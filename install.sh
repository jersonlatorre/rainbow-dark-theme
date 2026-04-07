#!/bin/bash

# Rutas de extensiones
ANTIGRAVITY_EXT=~/.antigravity/extensions/jersonlatorre.dusk-dark-theme-0.0.1/themes/dusk-dark-theme.json
CURSOR_EXT=~/.cursor/extensions/jersonlatorre.dusk-dark-theme-0.0.1/themes/dusk-dark-theme.json

# Empaquetar extensión
jq 'del(.tokenColors[] | select(.name == "js/ts italic"))' ./themes/dusk-dark-theme.json > tmp.json && mv tmp.json ./themes/dusk-dark-theme.json
vsce package

# Copiamos si existen las carpetas de instalación previa
if [ -d "$(dirname "$ANTIGRAVITY_EXT")" ]; then
  cp themes/dusk-dark-theme.json "$ANTIGRAVITY_EXT"
  echo "✅ Sincronizado en Antigravity"
fi

if [ -d "$(dirname "$CURSOR_EXT")" ]; then
  cp themes/dusk-dark-theme.json "$CURSOR_EXT"
  echo "✅ Sincronizado en Cursor"
fi

# Git
git add .
git commit -m "update rename dusk-dark-theme"
git push