# Catálogo de repos — Medicitas

Los repositorios reales del proyecto **Medicitas** (curso *1FIS0276 — Plataforma
Móviles y Análisis Cloud*, UPC) se orquestan desde este meta-repo. Este
directorio se puebla con [`../scripts/bootstrap.sh`](../scripts/bootstrap.sh):
**symlinks** si ya tienes los repos clonados como hermanos dentro de
`MEDICITAS/`, o **clones** desde GitHub si eres un dev nuevo (`--clone`).

Su contenido **no se versiona** aquí (ver [`../.gitignore`](../.gitignore)),
salvo este `README.md` (catálogo) y `repos.txt` (manifiesto).

- **Org/usuario GitHub:** `jonathammendoza-elogiatech`
- **Clonar un repo:** `git clone https://github.com/jonathammendoza-elogiatech/<repo>.git`
- **Jira:** proyecto `MCI` — *Medicitas* (`https://elogia.atlassian.net`)

## Repos

| repo | stack | rol | propósito |
| --- | --- | --- | --- |
| **concebir-medicos-upc** | Android (Kotlin, Compose, Hilt) | app móvil del médico | App del piloto **Concebir Médicos**: agenda multi-sede, pacientes, ficha y resultados, y registro de la atención. Ingreso con CMP + biometría. |
| **concebir-medicos-api** | Cloud (AWS Lambda Python + DynamoDB + API Gateway + Cognito) | backend | Servicio REST que consume la app: perfil, agenda, pacientes, resultados y registro firmado de la atención. Login con Cognito (usuario = CMP). Datos de ejemplo en lugar de Sysmedical en el piloto. |

<!--
Formato para nuevas entradas:
| **<repo>** | <stack> | <rol> | <propósito 1 línea> |
Clone: git clone https://github.com/jonathammendoza-elogiatech/<repo>.git
Recuerda añadir el repo también en repos.txt y en el .code-workspace.
-->
