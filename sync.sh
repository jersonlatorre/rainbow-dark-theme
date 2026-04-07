#!/bin/bash

THEME_FILE="themes/dusk-dark-theme.json"

echo "🔄 Sincronizando cambios locales de colores..."

# Copiar a VS Code si la carpeta existe
if [ -d "$HOME/.vscode/extensions/dusk-dark-theme" ]; then
    cp "$THEME_FILE" "$HOME/.vscode/extensions/dusk-dark-theme/$THEME_FILE"
    echo "✅ Sincronizado en VS Code."
fi

# Copiar a Cursor si la carpeta existe
if [ -d "$HOME/.cursor/extensions/dusk-dark-theme" ]; then
    cp "$THEME_FILE" "$HOME/.cursor/extensions/dusk-dark-theme/$THEME_FILE"
    echo "✅ Sincronizado en Cursor."
fi

# Copiar a Antigravity si la carpeta existe
if [ -d "$HOME/.antigravity/extensions/dusk-dark-theme" ]; then
    cp "$THEME_FILE" "$HOME/.antigravity/extensions/dusk-dark-theme/$THEME_FILE"
    echo "✅ Sincronizado en Antigravity."
fi

echo "✨ Listo. Recuerda recargar tu editor para ver los cambios."
