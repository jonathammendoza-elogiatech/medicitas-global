# CLAUDE.md — medicitas-global

Contexto para el asistente cuando trabaja en el ecosistema **Medicitas**.

> ⏳ **Andamiaje.** El contexto completo del proyecto lo aportará el usuario más
> adelante. No inventar alcance, arquitectura ni decisiones que no estén aquí.

## Qué es este repo

Meta-repo orquestador **local** (sin remoto) del proyecto Medicitas
(curso *1FIS0276 — Plataforma Móviles y Análisis Cloud*, UPC). No contiene código
de producto: coordina los repos reales, que se enlazan en `external-repos/`.

## Reglas de trabajo

- **Los repos reales viven en `external-repos/<repo>`** (symlinks a hermanos de
  `MEDICITAS/`). Editar el código allí; cada uno tiene su propio git y su propio
  remoto (GitHub).
- **`medicitas-global` es local:** no hacer `git push` ni añadir remoto salvo que
  el usuario lo pida.
- **`external-repos/` no se versiona** en este meta-repo (salvo `README.md` y
  `repos.txt`). Al añadir un repo: actualizar `external-repos/repos.txt`,
  `external-repos/README.md` y el `.code-workspace`.
- **Manifiesto = fuente de verdad:** `external-repos/repos.txt`.

## Repos

| repo | stack | notas |
| --- | --- | --- |
| `medicitas-upc` | Android (Android Studio) | app móvil — _contexto pendiente_ |

## Enlaces

- Jira: proyecto `MCI` (*Medicitas*) · https://elogia.atlassian.net
- GitHub: https://github.com/jonathammendoza-elogiatech

## Pendiente de completar

- [ ] Alcance y objetivo del proyecto (entregables del curso).
- [ ] Arquitectura (app móvil + capa cloud/análisis).
- [ ] Repos adicionales (backend/cloud) si los hubiera → añadir a `repos.txt`.
- [ ] Convenciones de ramas / commits / PRs.
