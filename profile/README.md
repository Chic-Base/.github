## 🚀 Clonador de Proyectos ChicBase

Para clonar cualquier app, usa los scripts disponibles en [`/clone-tools`](./clone-tools/).

### 📦 Scripts

- `clone_app.sh`: clona toda una app completa
- `clone_skeleton.sh`: clona solo skeleton + sharedkernel + metadata
- `clone_superbase.sh`: clona superbase + sharedkernel + metadata

### 🛠 Requisitos

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
