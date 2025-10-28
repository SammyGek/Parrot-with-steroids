# 📸 Assets - Imágenes del Repositorio

Esta carpeta contiene las imágenes que se muestran en el README.

## 🖼️ Imágenes que debes añadir

### 1. **preview.png** (Obligatoria) ⭐
- **Qué es:** Imagen principal que se muestra al inicio del README
- **Dónde se muestra:** Justo debajo del título del proyecto
- **Cómo hacer la captura:**
  ```bash
  # Con tu setup completo abierto:
  # - Terminal con comandos
  # - Polybar visible arriba (con tu IP, VPN, target)
  # - Algunas ventanas abiertas
  # Presiona: Print Screen (o usa Flameshot)
  ```
- **Tamaño recomendado:** 1920x1080 o tu resolución de pantalla
- **Nombre exacto:** `preview.png`

### 2. **screenshots/** (Opcional pero recomendado)
Capturas adicionales mostrando diferentes aspectos de tu setup:

#### Ejemplos de capturas útiles:
- `polybar.png` - Polybar con módulos custom (IP, VPN, target)
- `rofi.png` - Rofi abierto
- `terminal.png` - Terminal con colores y prompt
- `workspace.png` - Múltiples workspaces en uso
- `transparency.png` - Efectos de picom (transparencias)
- `full-setup.png` - Vista completa del escritorio

## 📁 Estructura final esperada

```
assets/
├── README.md           # Este archivo
├── preview.png         # Imagen principal (OBLIGATORIA)
└── screenshots/        # Capturas adicionales (OPCIONALES)
    ├── polybar.png
    ├── rofi.png
    ├── terminal.png
    └── ...
```

## 🎨 Cómo hacer buenas capturas

### Para preview.png (imagen principal):
1. Abre varias ventanas (terminal, navegador, editor)
2. Asegúrate de que Polybar se vea con tus módulos custom
3. Si tienes target configurado, ejecútalo: `settarget 10.10.10.123`
4. Conecta a VPN HTB si puedes (para que se vea el módulo verde)
5. Captura pantalla completa

### Herramientas para capturar:
```bash
# Instalar Flameshot (recomendado)
sudo apt install flameshot

# Capturar pantalla completa
flameshot full -p ~/assets/

# Capturar con selección
flameshot gui
```

### O usa el Print Screen del sistema:
- `Print Screen` = Captura pantalla completa
- `Alt + Print Screen` = Captura ventana actual
- `Shift + Print Screen` = Captura área seleccionada

## 📤 Cómo subir las imágenes al repo

```bash
# 1. Copia tus capturas a esta carpeta
cp ~/Imágenes/mi_captura.png ~/dotfiles/assets/preview.png

# 2. Si tienes más capturas, créalas en screenshots/
mkdir -p ~/dotfiles/assets/screenshots
cp ~/Imágenes/*.png ~/dotfiles/assets/screenshots/

# 3. Añadir a git
cd ~/dotfiles
git add assets/
git commit -m "Add preview and screenshots"
git push
```

## 🔗 Cómo se enlazan en el README

El README principal usa rutas relativas:

```markdown
![Preview](assets/preview.png)

## Screenshots
![Polybar](assets/screenshots/polybar.png)
![Rofi](assets/screenshots/rofi.png)
```

## ⚠️ Importante

- **preview.png es OBLIGATORIA** - Sin ella se verá un enlace roto en el README
- Las screenshots son opcionales pero mejoran mucho la presentación
- Asegúrate de no incluir información sensible en las capturas (IPs reales, tokens, etc.)
- Tamaño recomendado de imágenes: < 2MB cada una

## 💡 Consejo

Haz las capturas con:
- **Fondo limpio** (sin muchas ventanas)
- **Polybar visible** con tus módulos funcionando
- **Buena iluminación** si es foto de pantalla
- **Resolución decente** (mínimo 1280x720)

---

**¿No tienes preview.png aún?** Crea una captura rápida y cópiala aquí con ese nombre exacto.
