# ⚠️ Archivos que debes añadir

Los siguientes archivos de configuración **DEBES copiarlos desde tu sistema actual** para que el repositorio esté completo:

## 📁 Archivos de configuración que faltan

### BSPWM
- [ ] `config/bspwm/bspwmrc` - Tu archivo de configuración de BSPWM

```bash
cp ~/.config/bspwm/bspwmrc ~/dotfiles/config/bspwm/
```

### SXHKD
- [ ] `config/sxhkd/sxhkdrc` - Tus atajos de teclado

```bash
mkdir -p ~/dotfiles/config/sxhkd
cp ~/.config/sxhkd/sxhkdrc ~/dotfiles/config/sxhkd/
```

### Rofi
- [ ] `config/rofi/config.rasi` - Tu configuración de Rofi
- [ ] `config/rofi/themes/` (opcional) - Temas personalizados

```bash
mkdir -p ~/dotfiles/config/rofi
cp ~/.config/rofi/config.rasi ~/dotfiles/config/rofi/
# Si tienes temas custom:
# cp -r ~/.config/rofi/themes ~/dotfiles/config/rofi/
```

### Kitty
- [ ] `config/kitty/kitty.conf` - Tu configuración de Kitty

```bash
mkdir -p ~/dotfiles/config/kitty
cp ~/.config/kitty/kitty.conf ~/dotfiles/config/kitty/
```

### Powerlevel10k
- [ ] `config/zsh/.p10k.zsh` - Tu configuración de Powerlevel10k

```bash
cp ~/.p10k.zsh ~/dotfiles/config/zsh/
```

### NvChad
- [ ] `config/nvim/*` - TODA tu configuración personalizada de NvChad

```bash
cp -r ~/.config/nvim/* ~/dotfiles/config/nvim/
```

### Wallpapers
- [ ] `wallpapers/fondo.jpg` - Tu wallpaper principal

```bash
cp ~/fondos/TU_WALLPAPER.jpg ~/dotfiles/wallpapers/fondo.jpg
```

## ⚡ Copiar todo de una vez

Ejecuta este script desde el directorio `~/dotfiles`:

```bash
#!/bin/bash

# Crear todas las carpetas necesarias
mkdir -p config/{bspwm,sxhkd,rofi,kitty,nvim}

# Copiar archivos
cp ~/.config/bspwm/bspwmrc config/bspwm/ 2>/dev/null
cp ~/.config/sxhkd/sxhkdrc config/sxhkd/ 2>/dev/null
cp ~/.config/rofi/config.rasi config/rofi/ 2>/dev/null
cp ~/.config/kitty/kitty.conf config/kitty/ 2>/dev/null
cp ~/.p10k.zsh config/zsh/ 2>/dev/null
cp -r ~/.config/nvim/* config/nvim/ 2>/dev/null
cp ~/fondos/*.jpg wallpapers/ 2>/dev/null

echo "✓ Archivos copiados. Ejecuta ./verify.sh para verificar."
```

## 🔍 Verificar

Después de copiar tus archivos, ejecuta:

```bash
./verify.sh
```

Este script te dirá exactamente qué archivos faltan.

## 💡 Nota

Los archivos que YA ESTÁN incluidos en el repo son:
- Scripts de Polybar (ethernet_status.sh, htb_ip.sh, target_hack.sh)
- Configuración de ejemplo de Polybar (config.ini)
- Configuración de Picom (picom.conf)
- Configuración de ZSH con funciones custom (.zshrc)
- Scripts de instalación y verificación

Estos archivos son **plantillas/ejemplos** que puedes personalizar o reemplazar con los tuyos.
