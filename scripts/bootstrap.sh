#!/usr/bin/env bash
#
# bootstrap.sh — prepara external-repos/ para trabajar desde el meta-repo.
#
# Fuente de verdad: external-repos/repos.txt (un repo por línea).
# Para cada repo del manifiesto:
#   - Si YA existe en external-repos/ (symlink o clon) -> se deja como está.
#   - Si existe un checkout hermano en ../../<repo>     -> crea un symlink (modo auto).
#   - Si no hay hermano                                 -> clona desde GitHub.
# Nada de external-repos/ se versiona (ver .gitignore), salvo README.md y repos.txt.
#
# Modos:
#   ./scripts/bootstrap.sh            # auto: symlink si hay hermano, si no clona
#   ./scripts/bootstrap.sh --clone    # fuerza clonar desde GitHub aunque haya hermano
#   ./scripts/bootstrap.sh --symlink  # solo symlinks a hermanos; reporta los que faltan
#   ./scripts/bootstrap.sh --check    # solo reporta estado, no modifica nada
#
set -euo pipefail

ORCH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PARENT_DIR="$(cd "$ORCH_DIR/.." && pwd)"
EXT_DIR="$ORCH_DIR/external-repos"
MANIFEST="$EXT_DIR/repos.txt"
GITHUB="https://github.com/jonathammendoza-elogiatech"

MODE="auto"
case "${1:-}" in
  --clone)   MODE="clone" ;;
  --symlink) MODE="symlink" ;;
  --check)   MODE="check" ;;
  "")        MODE="auto" ;;
  *) echo "Uso: $0 [--clone|--symlink|--check]" >&2; exit 1 ;;
esac

[[ -f "$MANIFEST" ]] || { echo "No existe el manifiesto $MANIFEST" >&2; exit 1; }
mkdir -p "$EXT_DIR"

present=0 linked=0 cloned=0 missing=0
while IFS= read -r repo; do
  [[ -z "$repo" || "$repo" == \#* ]] && continue
  dest="$EXT_DIR/$repo"
  sibling="$PARENT_DIR/$repo"

  if [[ -e "$dest" || -L "$dest" ]]; then
    present=$((present+1)); continue
  fi

  case "$MODE" in
    check)
      if [[ -d "$sibling/.git" ]]; then echo "PENDIENTE (symlink): $repo"
      else echo "PENDIENTE (clon):    $repo"; fi
      missing=$((missing+1)) ;;
    symlink)
      if [[ -d "$sibling/.git" ]]; then
        ln -s "../../$repo" "$dest"; echo "symlink: $repo"; linked=$((linked+1))
      else echo "FALTA hermano (no clono en modo --symlink): $repo"; missing=$((missing+1)); fi ;;
    clone)
      echo "clon:    $repo"; git clone --quiet "$GITHUB/$repo.git" "$dest"; cloned=$((cloned+1)) ;;
    auto)
      if [[ -d "$sibling/.git" ]]; then
        ln -s "../../$repo" "$dest"; echo "symlink: $repo"; linked=$((linked+1))
      else
        echo "clon:    $repo"; git clone --quiet "$GITHUB/$repo.git" "$dest"; cloned=$((cloned+1))
      fi ;;
  esac
done < "$MANIFEST"

echo "---"
echo "ya presentes: $present · symlinks: $linked · clonados: $cloned · pendientes: $missing"
