# 🧠 ChicBase – Sistema Modular de Apps Flutter

**ChicBase** es la arquitectura base para construir, escalar y mantener múltiples apps Flutter de forma eficiente.  
Permite compartir lógica entre proyectos y personalizar cada app de forma independiente, sin duplicar código innecesario.

### 📦 Estructura de Proyectos

Cada app vive en su propia carpeta e incluye módulos **editables** y **compartidos**:

```
/nombre_app/
├── minibase/        → lógica y branding específico de la app (🔧 editable)
├── skeleton/        → UI y configuración específica (🔧 editable)
├── metadata/        → configuración dinámica, textos, assets (🔧 editable)
│
├── base/            → lógica general reutilizable (🌐 compartido)
├── superbase/       → UI genérica y controladores comunes (🌐 compartido)
└── sharedkernel/    → preferencias, ads, analytics, utilidades (🌐 compartido)
```

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

### 🧪 Uso rápido
Para clonar cualquier app, usa los scripts disponibles en [/clone-tools](/clone-tools/).

## 📦 Scripts

| Script               | ¿Qué clona?                                           |
|----------------------|--------------------------------------------------------|
| `clone_app.sh`       | Toda la app (minibase, skeleton, metadata + globales) |
| `clone_skeleton.sh`  | Solo skeleton, metadata, sharedkernel                 |
| `clone_superbase.sh` | Solo superbase, metadata, sharedkernel                |

## 🛠 Requisitos

- Git + SSH configurado: [Guía aquí](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- macOS, Linux o WSL (con Bash)

### 🧪 Uso rápido

```bash
git clone git@github.com:Chic-Base/clone-tools.git
cd clone-tools
chmod +x clone_*.sh

./clone_app.sh Artify25
./clone_skeleton.sh Artify25
./clone_superbase.sh Artify25
```

---

## 🧰 Alternativa Manual (Sin Scripts)

También puedes configurar tu entorno manualmente sin usar los scripts:

### 📁 Estructura esperada

Crea una carpeta con el nombre de tu app (ej. `Artify25`) y dentro clona los siguientes proyectos con exactamente estos nombres de carpeta:

```
/Artify25/
├── minibase/        ← git@github.com:Artify25/minibase.git
├── skeleton/        ← git@github.com:Artify25/skeleton.git
├── metadata/        ← git@github.com:Artify25/metadata.git
│
├── base/            ← git@github.com:Chic-Base/base.git
├── superbase/       ← git@github.com:Chic-Base/superbase.git
└── sharedkernel/    ← git@github.com:Chic-Base/sharedkernel.git
```

> ⚠️ **Los nombres de las carpetas deben coincidir exactamente** con los indicados arriba (`minibase`, `base`, etc.) para evitar errores al compilar.

### 🔁 Paso adicional

Luego de clonar, asegúrate de cambiar los remotes de los proyectos editables (`minibase`, `skeleton`, `metadata`) al repositorio correcto si es un fork o si usas tu propia organización.

Ejemplo:

```bash
cd minibase
git remote set-url origin git@github.com:Artify25/minibase.git
```

Repite este cambio para los otros módulos (`skeleton`, `metadata`) si es necesario.
