# CLAUDE.md — medicitas-global

Contexto **unificado** del proyecto **Medicitas / Concebir Médicos**. Este archivo es
la fuente única de verdad para que todo el equipo (y el asistente) trabaje sobre el
mismo entendimiento. Léelo antes de empezar.

---

## 1. El producto

- **Medicitas** = plataforma **white-label** multi-entidad: una herramienta de
  organización para médicos (agenda multi-sede, pacientes, resultados, y a futuro
  comunicación centralizada) que puede rebrandearse para cualquier entidad de salud.
- **Concebir Médicos** = **primera instancia (piloto)** de Medicitas, para la
  **Clínica Concebir** (grupo SERPROSA, medicina reproductiva). Es lo que entrega y
  califica el curso.

### Problema
El personal médico de Concebir trabaja distribuido en varias sedes, pero la agenda y
la información clínica solo viven en **Sysmedical** (app de escritorio, red interna).
Fuera de ese equipo, el médico queda sin acceso y recurre a llamadas, WhatsApp con
capturas y notas en papel.

### Solución
App **Android nativa** de uso exclusivo del personal médico + un **servicio REST en la
nube** que actúa como capa de integración con Sysmedical (agenda, ficha, resultados;
registro de nota de atención). No reemplaza a Sysmedical.

---

## 2. Contexto académico

| | |
| --- | --- |
| Curso | **1FIS0276 – Plataformas Móviles y Análisis Cloud** (UPC · FISI-EPE) |
| Periodo | 2026-2 · **Grupo N°1** |
| Docente | Jorge Rosvin Narvaez Villacorta |
| Cierre del curso | **semana del 15-oct-2026** |
| Entrega actual | hasta **prototipos** (planificación + historias + prototipo navegable) |

---

## 3. Actores / equipo

| Integrante | Código | Área de trabajo (pantallas / épica) |
| --- | --- | --- |
| **Jonatham Mendoza** | U201322636 | Acceso y perfil — login, perfil, sesión (E1) |
| **Junior Alexander Adrianzen Juarez** | U20241a635 | Agenda — resumen del día, agenda (E2) |
| **Miguel Alejandro Rodriguez Marquez** | U202415499 | Atención de la cita — detalle, nota de evolución (E3) |
| **Renzo Apolaya Ccuno** | U202419195 | Pacientes y ficha — búsqueda, ficha (E4) |
| **José Antonio Ríos Poma** | U202320735 | Resultados y plataforma base — resultados, navegación/componentes (E4/E5) |

El servicio REST (E6) es trabajo **de equipo**.

---

## 4. Repos del proyecto

| repo | stack | rol | GitHub |
| --- | --- | --- | --- |
| **concebir-medicos-upc** | Android (Kotlin, Jetpack Compose, Hilt) | app móvil del médico (piloto) | `jonathammendoza-elogiatech/concebir-medicos-upc` |
| **concebir-medicos-api** | Cloud (AWS Lambda Python + DynamoDB + API Gateway + Cognito) | servicio REST que consume la app (capa de integración con Sysmedical) | `jonathammendoza-elogiatech/concebir-medicos-api` |

- Los repos reales se referencian en `external-repos/` por symlink. Editar el código allí.
- Org/usuario GitHub: **`jonathammendoza-elogiatech`**.

---

## 5. Alcance del piloto (Concebir Médicos)

**Incluye:** ingreso del médico con **CMP** (Colegio Médico del Perú) + contraseña y
**biometría** (huella/rostro); perfil y sede activa; agenda día/semana por sede;
detalle de cita; **registro de nota de evolución con firma biométrica (no repudio)**;
pacientes, ficha y resultados de laboratorio/genética; servicio REST (con **mock de
Sysmedical** en el piloto); tema white-label (Material 3, azul petróleo `#124559`).

**No incluye (en el piloto):** crear/reprogramar/anular citas (queda en Sysmedical);
app de pacientes; facturación/inventario; iOS; offline.

**Roadmap (post-curso):** white-label multi-entidad, gestión activa de horarios
multi-centro, comunicación centralizada (anti-WhatsApp). _(La app de pacientes —
confirmar citas, ver resultados, T&C— quedó pausada, no en el alcance actual.)_

---

## 6. Decisiones clave

- **Nombres:** Medicitas = plataforma; Concebir Médicos = instancia piloto (white-label).
- **Usuario = CMP** (no correo); biometría para ingreso y para **firmar** la atención.
- **Sysmedical simulado (mock)** en el piloto: la integración real depende de un tercero (MacPro).
  El servicio REST sirve datos de ejemplo desde DynamoDB (cuenta AWS Academy del curso).
- **Login con Amazon Cognito** (usuario = CMP, sin auto-registro); API Gateway valida el token.
- **Datos de ejemplo consistentes** en todo el prototipo: paciente Lucía Fernández Ramos
  (HC-20481, FIV ciclo 2) y médica Dra. Ana Torres Delgado (sede San Isidro).

---

## 7. Planificación (Jira)

- Proyecto **MCI — Medicitas** · `https://elogia.atlassian.net` (backlog priorizado, Scrum).
- **9 épicas · 35 historias**: piloto **E1–E6** (26 historias · 111 SP, label `piloto-concebir`)
  + roadmap **E7–E9** (9 historias · 60 SP, label `roadmap`).
- Estimación en Story Points; responsable por etiqueta `owner-<integrante>`.

---

## 8. Reglas de trabajo del meta-repo

- **Los repos reales viven en `external-repos/<repo>`** (symlinks a hermanos de `MEDICITAS/`).
  Editar el código allí; cada uno tiene su propio git y su remoto en GitHub.
- **`medicitas-global` está en GitHub (público):** los cambios se suben por PR; para contribuir (push) hace falta ser colaborador.
- **`external-repos/` no se versiona** (salvo `README.md` y `repos.txt`). Al añadir un repo:
  actualizar `external-repos/repos.txt`, `external-repos/README.md` y el `.code-workspace`.
- **Manifiesto = fuente de verdad:** `external-repos/repos.txt`.

## 9. Reglas de trabajo (acordadas)

Pocas y claras — es un proyecto de curso:

- **Repos de código limpios:** en `concebir-medicos-upc` (y demás repos) no va ningún archivo
  ni referencia de IA — nada de `CLAUDE.md`, memorias ni co-authors de asistentes. Ese contexto
  vive solo aquí (medicitas-global).
- **Todo cambio por Pull Request**, revisado por **al menos otra persona**; **nadie aprueba su propio PR**.
- **Commits** con la cuenta de cada integrante (Jonatham → `jonathammendoza-elogiatech`), no la de Kripto.
- **Secretos** (tokens, `local.properties`) nunca en el repo.
- Son **datos de salud**: no exponer datos reales de pacientes y dar una revisión de seguridad básica al PR.
- Documentación en **español**.

> Versión ligera de las reglas de `elogia-stax-global`, adaptada a un trabajo de curso.

## 10. Enlaces

- **Jira:** `MCI` — Medicitas · https://elogia.atlassian.net
- **GitHub:** https://github.com/jonathammendoza-elogiatech
- **Docs transversales:** `docs/` (informe del curso en Word, guía de pantallas, prototipo Stitch).
