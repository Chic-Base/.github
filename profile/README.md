# 🧠 ChicBase – Sistema Modular de Apps Flutter

**ChicBase** es la arquitectura base para construir, escalar y mantener múltiples apps Flutter de forma eficiente.  
Permite compartir lógica entre proyectos y personalizar cada app de forma independiente, sin duplicar código innecesario.

---

## 📦 Estructura de Proyectos

Cada app se organiza en una carpeta propia, que contiene proyectos reutilizables (globales) y personalizados (por app):
/nombre_app/
├─ minibase/ ← lógica y branding específico de la app (🔧 editable)
├─ skeleton/ ← UI y configuración específica de la app (🔧 editable)
├─ metadata/ ← configuración dinámica, assets y textos por app (🔧 editable)
├─ base/ ← lógica general (🌐 compartido)
├─ superbase/ ← componentes UI y controladores comunes (🌐 compartido)
├─ sharedkernel/ ← utilidades, preferencias, ads, analytics... (🌐 compartido)


---

## 🛠 Repositorios involucrados

| Proyecto        | ¿Edita cada app? | Descripción breve                                  |
|----------------|------------------|----------------------------------------------------|
| `minibase`     | ✅ Sí            | Entry point de la app, build config, branding     |
| `skeleton`     | ✅ Sí            | UI, rutas, lógica específica de la app            |
| `metadata`     | ✅ Sí            | Textos, assets, idiomas, ajustes por app          |
| `base`         | ❌ No            | Core lógico de las apps (clases base, navegación) |
| `superbase`    | ❌ No            | Widgets, controladores, UI genérica               |
| `sharedkernel` | ❌ No            | Ads, prefs, analytics, utilidades generales       |

---

## 🚀 Clonador de Proyectos ChicBase

Este repositorio (`clone-tools`) incluye scripts para clonar rápidamente cualquier app basada en esta estructura.

---

### 📦 Scripts disponibles

| Script               | ¿Qué clona?                                           |
|----------------------|--------------------------------------------------------|
| `clone_app.sh`       | Toda la app (minibase, skeleton, metadata + globales) |
| `clone_skeleton.sh`  | Solo skeleton, metadata, sharedkernel                 |
| `clone_superbase.sh` | Solo superbase, metadata, sharedkernel                |

---

### 🧪 Uso rápido
Para clonar cualquier app, usa los scripts disponibles en [/clone-tools](/clone-tools/).

## 📦 Scripts

- clone_app.sh: clona toda una app completa
- clone_skeleton.sh: clona solo skeleton + sharedkernel + metadata
- clone_superbase.sh: clona superbase + sharedkernel + metadata

## 🛠 Requisitos

- Git + SSH configurado: [Guía aquí](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- macOS, Linux o WSL (con Bash)

## 🧪 Uso rápido

bash
git clone git@github.com:Chic-Base/clone-tools.git
cd clone-tools
chmod +x clone_*.sh

./clone_app.sh Artify25
./clone_skeleton.sh Artify25
./clone_superbase.sh Artify25

