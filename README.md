# 🌆 Dusk Dark Theme - Dev Notes

Este repositorio contiene mi tema oscuro personal ("Dusk Dark"), diseñado originalmente para tener un excelente contraste y un look vibrante con acentos en turquesa, ámbar, naranja y rojo. 

Este `README` es una referencia rápida para mi **futuro yo** sobre cómo probar, instalar y sincronizar el tema de manera local en los distintos editores que utilizo (Cursor, VS Code y Antigravity), sin depender de la tienda oficial.

## 🎨 Resumen de la Paleta

- **Turquesa (Teal):** `#49D8EE`
- **Crema:** `#F5EFE7`
- **Ámbar:** `#FCDF5F`
- **Naranja:** `#FFA24B`
- **Rojo:** `#FF5B65`
- **Gris Apagado:** `#a39684`
- **Fondo:** `#323232`

---

## 🛠️ Flujo de Trabajo (Script de Sincronización)

Si estás editando el archivo `themes/dusk-dark-theme.json` para hacerle retoques a los colores y necesitas probarlos rápidamente:

1. Haz los cambios de códigos hexadecimales en los tokens.
2. Ejecuta el script de sincronización local en tu terminal:
   ```bash
   ./sync.sh
   ```
   *Esto copiará automáticamente los archivos editados a las carpetas locales de extensiones de Cursor, VS Code y Antigravity.*
3. Dentro de tu editor, usa `Cmd + Shift + P` y ejecuta **`Developer: Reload Window`** para que tome los nuevos colores.

*(Nota: Asegúrate de tener permisos de ejecución `chmod +x sync.sh`)*

---

## 🚀 Instalación en una Nueva Computadora

Si reseteaste el equipo o estás en uno nuevo y quieres traerte el tema configurado de golpe en todos los editores, corre este _one-liner_ en la terminal. 

El snippet descarga el repositorio usando la URL de github directamente, lo copia a `~/.cursor`, `~/.vscode` y `~/.antigravity`, y borra el archivo temporal:

```bash
REPO="https://github.com/jersonlatorre/dusk-dark-theme.git" && TMP="/tmp/dusk-dark-theme" && rm -rf $TMP && git clone --depth 1 $REPO $TMP && rm -rf $TMP/.git && mkdir -p ~/.cursor/extensions ~/.vscode/extensions ~/.antigravity/extensions && rm -rf ~/.cursor/extensions/dusk-dark-theme ~/.vscode/extensions/dusk-dark-theme ~/.antigravity/extensions/dusk-dark-theme && cp -r $TMP ~/.cursor/extensions/ 2>/dev/null; cp -r $TMP ~/.vscode/extensions/ 2>/dev/null; cp -r $TMP ~/.antigravity/extensions/ 2>/dev/null; rm -rf $TMP && echo "¡Dusk Dark instalado en todos tus editores! Recarga para aplicar."
```

---

## 📦 Generar el .vsix (Opcional)

Si alguna vez por algún motivo necesitas el archivo de extensión compilado (`.vsix`):

1. Instala `vsce` si no lo tienes globalmente: `npm install -g @vscode/vsce`
2. Empaqueta el proyecto:
   ```bash
   npx vsce package
   ```
3. Instala el paquete resultante `.vsix` arrastrándolo a la vista de extensiones o ejecutando `code --install-extension dusk-dark-theme-1.0.0.vsix`.
