# ⚠️ FALTA AÑADIR preview.png

Este archivo debe ser reemplazado por tu captura de pantalla principal.

## Cómo hacer la captura:

1. **Prepara tu escritorio:**
   - Abre varias ventanas (terminal, navegador, editor)
   - Asegúrate de que Polybar sea visible con tus módulos
   - Ejecuta: `settarget 10.10.10.123` (para que se vea en polybar)
   - Conecta a VPN HTB si es posible

2. **Haz la captura:**
   ```bash
   # Opción 1: Con Flameshot
   sudo apt install flameshot
   flameshot full -p ~/dotfiles/assets/

   # Opción 2: Con Print Screen
   Presiona Print Screen
   ```

3. **Renombra y coloca aquí:**
   ```bash
   # Renombrar la captura
   mv ~/tu_captura.png ~/dotfiles/assets/preview.png
   
   # Añadir a git
   cd ~/dotfiles
   git add assets/preview.png
   git commit -m "Add preview screenshot"
   git push
   ```

## ⚠️ Importante

Sin esta imagen, el README mostrará un enlace roto en GitHub.

**Tamaño recomendado:** 1920x1080 (o tu resolución)
**Formato:** PNG
**Nombre exacto:** `preview.png`
