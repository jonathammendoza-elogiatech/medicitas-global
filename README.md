# medicitas-global

Meta-repo orquestador del proyecto **Medicitas** (curso *1FIS0276 — Plataforma
Móviles y Análisis Cloud*, UPC). Vive **solo en local**: no tiene remoto.

Los repos reales (código) viven como carpetas hermanas dentro de `MEDICITAS/` y
se referencian desde `external-repos/` mediante symlinks. Desde aquí se trabajan
de forma coordinada, se guarda documentación transversal y se enlaza con Jira.

> ⏳ **Contexto completo pendiente.** Este README es un andamiaje; se completará
> con el alcance real del proyecto.

## Estructura

```
MEDICITAS/
├── medicitas-global/              ← este meta-repo (git local, sin remoto)
│   ├── external-repos/            ← symlinks a los repos reales (no se versiona)
│   │   ├── README.md              ← catálogo de repos
│   │   ├── repos.txt              ← manifiesto (fuente de verdad)
│   │   └── medicitas-upc → ../../medicitas-upc
│   ├── scripts/
│   │   └── bootstrap.sh           ← puebla external-repos/ (symlink o clon)
│   ├── docs/                      ← documentación transversal
│   ├── medicitas-global.code-workspace
│   ├── CLAUDE.md                  ← contexto para el asistente
│   └── README.md
└── medicitas-upc/                 ← repo real (app Android)
```

## Empezar

```bash
# 1. Poblar external-repos/ (symlink a hermanos existentes, o clona si faltan)
./scripts/bootstrap.sh            # auto
./scripts/bootstrap.sh --check    # solo reporta estado

# 2. Abrir el workspace multi-root
#    Abre medicitas-global.code-workspace en VS Code
#    (Android Studio abre external-repos/medicitas-upc como proyecto Android)
```

## Repos orquestados

Ver [`external-repos/README.md`](external-repos/README.md) (catálogo) y
[`external-repos/repos.txt`](external-repos/repos.txt) (manifiesto).

## Enlaces

- **Jira:** proyecto `MCI` — *Medicitas* · https://elogia.atlassian.net
- **GitHub (repos):** https://github.com/jonathammendoza-elogiatech
