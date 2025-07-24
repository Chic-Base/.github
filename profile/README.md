# 🚀 ChicBase: Build Multiple Flutter Apps from One Codebase

**ChicBase** is a modular architecture that lets you build multiple Flutter apps efficiently by sharing code while keeping each app unique.

## 📦 How It Works

```
Your Flutter App
├── 🎯 App-Specific (You customize these)
│   ├── minibase/     → App configuration
│   ├── skeleton/     → Custom UI & screens  
│   └── metadata/     → Assets & translations
│
└── 📦 Shared Foundation (Reused across all apps)
    ├── base/         → Business logic
    ├── superbase/    → UI components
    └── sharedkernel/ → Utilities & services
```

**The Magic**: When you fix a bug or add a feature to the shared modules, ALL your apps get the update automatically!

## 🚀 Quick Start

```bash
# Get the tools
git clone git@github.com:Chic-Base/clone-tools.git
cd clone-tools
chmod +x *.sh

# Clone what you need
./clone_app.sh YourOrgName        # Everything (build complete apps)
./clone_skeleton.sh YourOrgName   # Just UI modules (customize interface)
./clone_superbase.sh YourOrgName  # Shared components (build for all apps)
```

## 💡 Why ChicBase?

- **Build Fast**: Launch new apps in weeks, not months
- **Share Code**: 70-80% code reuse across apps
- **Stay Consistent**: One fix updates all apps
- **Scale Easy**: One team can manage multiple apps

Perfect for: Multi-brand companies, white-label solutions, regional app variants

---

*ChicBase: Where shared innovation meets individual creativity* ✨
