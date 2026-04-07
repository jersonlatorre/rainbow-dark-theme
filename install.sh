#!/bin/bash

# Rutas de extensiones
ANTIGRAVITY_EXT=~/.antigravity/extensions/jersonlatorre.vibrant-dark-color-theme-0.0.1/themes/vibrant-dark-color-theme.json
CURSOR_EXT=~/.cursor/extensions/jersonlatorre.vibrant-dark-color-theme-0.0.1/themes/vibrant-dark-color-theme.json

# Empaquetar extensión
jq 'del(.tokenColors[] | select(.name == "js/ts italic"))' ./themes/vibrant-dark-color-theme.json > tmp.json && mv tmp.json ./themes/vibrant-dark-color-theme.json
vsce package

# Instalar en Antigravity si existe
if [ -f "$ANTIGRAVITY_EXT" ]; then
  cp themes/vibrant-dark-color-theme.json "$ANTIGRAVITY_EXT"
  echo "✅ Sincronizado en Antigravity"
fi

# Instalar en Cursor si existe
if [ -f "$CURSOR_EXT" ]; then
  cp themes/vibrant-dark-color-theme.json "$CURSOR_EXT"
  echo "✅ Sincronizado en Cursor"
fi

# Git
git add .
git commit -m "update"
git push