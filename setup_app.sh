#!/bin/bash

# === 🛠 CONFIGURATION ===
ORG_NAME="$1"
if [ -z "$ORG_NAME" ]; then
  echo "❌ You must specify the organization name (e.g: ./setup.sh Artify25)"
  exit 1
fi

APP_DIR="./$ORG_NAME"
CHICBASE_ORG="Chic-Base"
APP_MODULES=("minibase" "skeleton" "metadata")
SHARED_MODULES=("base" "superbase" "sharedkernel")

# === 📁 Create project base folder
echo "📁 Creating folder $APP_DIR"
mkdir -p "$APP_DIR"
cd "$APP_DIR" || exit 1

# === 🔽 Clone shared modules from Chic-Base
for module in "${SHARED_MODULES[@]}"; do
  echo "🔽 Cloning $module from $CHICBASE_ORG..."
  git clone "git@github.com:$CHICBASE_ORG/$module.git"
done

# === 🧬 Clone base modules for the app from Chic-Base
for module in "${APP_MODULES[@]}"; do
  echo "🔽 Cloning $module from $CHICBASE_ORG..."
  git clone "git@github.com:$CHICBASE_ORG/$module.git"
done

# === 🚀 Create repos in the organization (if they don't exist) and change remotes
for module in "${APP_MODULES[@]}"; do
  echo "🔎 Checking if $ORG_NAME/$module already exists..."
  if gh repo view "$ORG_NAME/$module" >/dev/null 2>&1; then
    echo "⚠️  $ORG_NAME/$module already exists. Skipping creation and push."
    continue
  fi

  echo "🌐 Creating repo $ORG_NAME/$module on GitHub..."
  gh repo create "$ORG_NAME/$module" --private --confirm

  echo "🔁 Changing remote for $module..."
  cd "$module" || exit 1
  git remote remove origin
  git remote add origin "git@github.com:$ORG_NAME/$module.git"
  git push -u origin main
  cd ..
done

# === 🌍 Create special .github repository if it doesn't exist
echo "🔎 Checking if $ORG_NAME/.github already exists..."
if gh repo view "$ORG_NAME/.github" >/dev/null 2>&1; then
  echo "✅ .github repo already exists. Nothing to do."
else
  echo "🌐 Creating public repo $ORG_NAME/.github..."
  gh repo create "$ORG_NAME/.github" --public --confirm --description "Org-wide config and README"

  # 🧹 Remove temporary folder if it exists from before
  rm -rf .temp_github

  TMP_DIR=".temp_github"
  GH_REPO="$ORG_NAME/.github"
  git clone "git@github.com:$GH_REPO.git" "$TMP_DIR"

  cd "$TMP_DIR" || exit 1

  mkdir -p profile
  cat > profile/README.md <<EOF
# 🚀 $ORG_NAME - ChicBase Project

Build Flutter apps faster by sharing code across multiple applications.

## 🎯 Quick Setup

Get the clone tools and run the script for your workflow:

\`\`\`
git clone git@github.com:Chic-Base/clone-tools.git
cd clone-tools
chmod +x *.sh

# Choose your workflow:
./clone_app.sh $ORG_NAME        # Full app development
./clone_skeleton.sh $ORG_NAME   # App development (the app itself)
./clone_superbase.sh $ORG_NAME  # Shared components development
\`\`\`

## 📦 What Gets Cloned

**🎨 Skeleton Development** (App definition)
- **skeleton/** - The app itself: all screens, navigation, and features
- **metadata/** - App configuration, assets, and translations
- **sharedkernel/** - Shared utilities (read-only)

**🏗️ Superbase Development** (Shared components)
- **superbase/** - Reusable UI components for all apps
- **metadata/** - Test configurations
- **sharedkernel/** - Core utilities (read-only)

**🚀 Full App Development** (Everything)
- All 6 modules for complete app building

## ⚠️ Important

- Keep exact folder names (skeleton, metadata, etc.)
- Clone all repos in the same parent directory
- For SSH issues: [GitHub SSH Setup](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

---

*ChicBase: Build once, use everywhere* ✨
EOF

  git add profile/README.md
  git commit -m "📝 Add profile README"
  git push origin main

  echo "📦 Copying clone_*.sh scripts to clone-tools/"
  mkdir -p clone-tools
  cp ../../clone_app.sh clone-tools/
  cp ../../clone_skeleton.sh clone-tools/
  cp ../../clone_superbase.sh clone-tools/

  git add clone-tools/
  git commit -m "🚀 Add clone tools"
  git push origin main

  cd ..
  rm -rf "$TMP_DIR"
fi

