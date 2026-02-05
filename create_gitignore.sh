#!/bin/bash

# Vérifier qu'un argument est fourni
if [ $# -eq 0 ]; then
    echo "Usage: $0 <C|web|nodejs>"
    echo "  C      - Génère un .gitignore pour projet C"
    echo "  web    - Génère un .gitignore pour projet web"
    echo "  nodejs - Génère un .gitignore pour projet Node.js"
    exit 1
fi

PROJECT_TYPE="$1"

# Fonction pour créer le .gitignore selon le type de projet
case "$PROJECT_TYPE" in
C | c)
    cat <<EOL >.gitignore
# Compiled source #
###################
*.o
*.a
*.so
*.out
*.exe
*.obj
*.elf

# Executables
unit_test
a.out

# Debug files
*.dSYM/
*.su
*.idb
*.pdb

# Coverage files
*.gcno
*.gcda
*.gcov

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
*.swp
*~
EOL
    echo ".gitignore for C project created."
    ;;

web | Web | WEB)
    cat <<EOL >.gitignore
# Dependencies
node_modules/
bower_components/

# Build outputs
dist/
build/
*.min.js
*.min.css

# Environment files
.env
.env.local
.env.*.local

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Cache
.cache/
.parcel-cache/
.next/
.nuxt/

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
*.swp
*~
EOL
    echo ".gitignore for web project created."
    ;;

nodejs | node | Node | NodeJS)
    cat <<EOL >.gitignore
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
package-lock.json
yarn.lock

# Environment variables
.env
.env.local
.env.*.local

# Build outputs
dist/
build/
coverage/

# Logs
logs/
*.log

# Runtime data
pids/
*.pid
*.seed
*.pid.lock

# Testing
.nyc_output/

# Cache directories
.npm
.eslintcache
.node_repl_history

# OS generated files #
######################
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
*.swp
*~
EOL
    echo ".gitignore for Node.js project created."
    ;;

*)
    echo "Error: Unknown project type '$PROJECT_TYPE'"
    echo "Available options: C, web, nodejs"
    exit 1
    ;;
esac
