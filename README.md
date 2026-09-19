# medicitas-global

Meta-repo orquestador y **contexto unificado** del proyecto **Medicitas / Concebir
Médicos** (curso *1FIS0276 — Plataformas Móviles y Análisis Cloud*, UPC · Grupo N°1).
Está en **GitHub** (repo **público**): coordina los repos reales, guarda la documentación
transversal y enlaza con Jira.

> 📌 **El contexto completo del proyecto está en [`CLAUDE.md`](CLAUDE.md)** — léelo primero:
> producto, alcance, equipo, repos, decisiones y planificación.

## En una línea

**Medicitas** es una plataforma white-label para organizar el trabajo de médicos.
**Concebir Médicos** es el piloto para la Clínica Concebir: una app Android que da al
médico acceso móvil y seguro a su agenda, sus pacientes y resultados, y le permite
registrar la atención — integrándose con el sistema Sysmedical vía un servicio REST.

## Equipo (Grupo N°1)

| Integrante | Área |
| --- | --- |
| Jonatham Mendoza | Acceso y perfil |
| Junior Adrianzen | Agenda |
| Miguel Rodríguez | Atención de la cita |
| Renzo Apolaya | Pacientes y ficha |
| José Ríos | Resultados y plataforma base |

Docente: Jorge Rosvin Narvaez Villacorta.

## Reglas de trabajo

1. **Repos de código sin rastro de IA** — nada de `CLAUDE.md`, memorias ni co-authors de asistentes en los repos; ese contexto vive solo aquí.
2. **Todo cambio va por PR**, revisado por **al menos otra persona**; **nadie aprueba su propio PR**.
3. **Datos de salud** — no exponer datos reales y revisar seguridad básica en cada PR; secretos nunca en el repo.

Detalle en [`CLAUDE.md`](CLAUDE.md) (§9).

## Estructura

```
MEDICITAS/
├── medicitas-global/              ← este meta-repo (en GitHub, público)
│   ├── external-repos/            ← symlinks a los repos reales (no se versiona)
│   │   ├── README.md              ← catálogo de repos
│   │   ├── repos.txt              ← manifiesto (fuente de verdad)
│   │   └── concebir-medicos-upc → ../../concebir-medicos-upc
│   ├── scripts/                   ← bootstrap.sh (puebla external-repos/)
│   ├── docs/                      ← informe del curso, guía de pantallas, prototipo
│   ├── medicitas-global.code-workspace
│   ├── CLAUDE.md                  ← CONTEXTO UNIFICADO del proyecto
│   └── README.md
└── concebir-medicos-upc/          ← repo real (app Android) → GitHub
```

## Paso a paso (primera vez que clonas)

> Repo **público**: puedes clonarlo directamente. Para **contribuir** (subir ramas/PR)
> pide que te agreguen como colaborador con permiso *Write* (ver abajo).

```bash
# 1. Clona este meta-repo
git clone https://github.com/jonathammendoza-elogiatech/medicitas-global.git
cd medicitas-global

# 2. Prepara los repos de código en external-repos/
#    Clona automáticamente concebir-medicos-upc desde GitHub
#    (o crea un symlink si ya lo tienes clonado al lado)
./scripts/bootstrap.sh
./scripts/bootstrap.sh --check     # opcional: solo reporta estado

# 3. Lee el contexto del proyecto  →  abre CLAUDE.md

# 4. Abre el proyecto
#    - App Android: abre external-repos/concebir-medicos-upc en Android Studio y haz Gradle Sync
#    - Workspace multi-root (VS Code): abre medicitas-global.code-workspace
```

**Accesos:** Jira → proyecto `MCI` (https://elogia.atlassian.net).
**Reglas:** todo cambio por PR revisado por otra persona; nada de IA en los repos de código.

## Acceso del equipo (colaboradores)

Clonar/leer es abierto (repo público). Para **contribuir** (push, ramas, PR) agrega a cada integrante como **colaborador** con permiso *Write*:

- **Web:** GitHub → repo → *Settings → Collaborators → Add people* → usuario o correo de GitHub del integrante → rol **Write**.
- **CLI:** `gh api -X PUT repos/jonathammendoza-elogiatech/medicitas-global/collaborators/<usuario> -f permission=push`

Cada invitado acepta la invitación (le llega por correo / GitHub) y ya puede clonar.

## Enlaces

- **Contexto del proyecto:** [`CLAUDE.md`](CLAUDE.md)
- **Repos:** [`external-repos/README.md`](external-repos/README.md) · [`repos.txt`](external-repos/repos.txt)
- **Jira:** proyecto `MCI` — *Medicitas* · https://elogia.atlassian.net
- **GitHub:** https://github.com/jonathammendoza-elogiatech
