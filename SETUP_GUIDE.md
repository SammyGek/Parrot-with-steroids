# 📝 Guía de Configuración Inicial del Repositorio

Esta guía te ayudará a poblar el repositorio con tus configuraciones actuales.

## 🚀 Pasos para Configurar el Repositorio

### 1. Clonar o crear el repositorio

```bash
mkdir ~/dotfiles
cd ~/dotfiles
git init
```

### 2. Copiar tus configuraciones actuales al repositorio

Ejecuta estos comandos para copiar tus configs al repositorio:

```bash
# Crear estructura de directorios
mkdir -p config/{bspwm/scripts,sxhkd,polybar,picom,rofi,kitty,nvim,zsh}
mkdir -p wallpapers

# BSPWM
cp ~/.config/bspwm/bspwmrc config/bspwm/
cp ~/.config/bspwm/scripts/* config/bspwm/scripts/

# SXHKD
cp ~/.config/sxhkd/sxhkdrc config/sxhkd/

# Polybar (copiar todos los archivos)
cp -r ~/.config/polybar/* config/polybar/

# Picom
cp ~/.config/picom/picom.conf config/picom/

# Rofi
cp ~/.config/rofi/config.rasi config/rofi/
# Si tienes temas custom:
# cp -r ~/.config/rofi/themes config/rofi/

# Kitty
cp ~/.config/kitty/kitty.conf config/kitty/

# ZSH
cp ~/.zshrc config/zsh/.zshrc
cp ~/.p10k.zsh config/zsh/.p10k.zsh

# NvChad (toda la configuración custom)
cp -r ~/.config/nvim/* config/nvim/

# Wallpapers
cp ~/fondos/* wallpapers/
# Renombrar tu wallpaper principal a fondo.jpg
# mv wallpapers/tu_wallpaper.jpg wallpapers/fondo.jpg
```

### 3. Revisar archivos sensibles

⚠️ **IMPORTANTE**: Antes de hacer commit, revisa que NO hayas incluido:
- Claves privadas
- Tokens de API
- Contraseñas
- Información personal sensible

```bash
# Buscar archivos que puedan contener información sensible
grep -r "password" config/
grep -r "token" config/
grep -r "api_key" config/
```

### 4. Añadir los archivos que ya están en el repo

Los siguientes archivos ya están incluidos en el repositorio:
- `install.sh` - Script de instalación
- `README.md` - Documentación
- `.gitignore` - Archivos ignorados por git
- `config/bspwm/scripts/` - Scripts de ejemplo (ethernet_status.sh, htb_ip.sh, target_hack.sh)
- `config/zsh/.zshrc` - Template con funciones personalizadas

### 5. Personalizar archivos si es necesario

#### Si tus scripts de polybar tienen nombres diferentes:
Renombra tus scripts para que coincidan con los del README o actualiza el README con tus nombres.

#### Si usas rutas diferentes:
Revisa el `install.sh` y ajusta las rutas si las tuyas son diferentes.

### 6. Hacer commit inicial

```bash
git add .
git commit -m "Initial commit: My custom BSPWM environment"
```

### 7. Subir a GitHub

```bash
# Crear repo en GitHub primero, luego:
git remote add origin https://github.com/TU_USUARIO/dotfiles.git
git branch -M main
git push -u origin main
```

## 📋 Checklist de Archivos a Copiar

Marca lo que ya has copiado:

- [ ] `config/bspwm/bspwmrc`
- [ ] `config/bspwm/scripts/ethernet_status.sh` (o tu versión)
- [ ] `config/bspwm/scripts/htb_ip.sh` (o tu versión)
- [ ] `config/bspwm/scripts/target_hack.sh` (o tu versión)
- [ ] `config/sxhkd/sxhkdrc`
- [ ] `config/polybar/config.ini` (o config)
- [ ] `config/polybar/launch.sh`
- [ ] `config/polybar/` (otros archivos)
- [ ] `config/picom/picom.conf`
- [ ] `config/rofi/config.rasi`
- [ ] `config/kitty/kitty.conf`
- [ ] `config/zsh/.zshrc`
- [ ] `config/zsh/.p10k.zsh`
- [ ] `config/nvim/` (toda la carpeta)
- [ ] `wallpapers/fondo.jpg`

## 🔧 Personalización del README

Recuerda actualizar el README.md con:
- Tu captura de pantalla del setup
- Tu usuario de GitHub en las URLs
- Cualquier personalización específica que hayas hecho
- Atajos de teclado personalizados

## 🎯 Después de Configurar

Una vez que hayas configurado todo:

1. Prueba la instalación en una VM o sistema limpio
2. Ajusta el `install.sh` si encuentras problemas
3. Actualiza el README con cualquier nota adicional
4. ¡Comparte tu setup! 🚀

## 💡 Consejos

- Haz commits frecuentes mientras configuras
- Usa branches para experimentar con cambios
- Documenta cualquier personalización no obvia
- Mantén el repo actualizado con tus cambios

---

¿Listo para empezar? Ejecuta los comandos del paso 2 y ¡tendrás tu repo configurado! 🎉
