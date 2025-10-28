#!/bin/bash

#####################################
# Dotfiles Auto-Installer
# Compatible with Parrot OS
#####################################

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Directorio del script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Función para imprimir mensajes
print_message() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Verificar si estamos en Parrot OS
check_parrot() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [[ "$ID" == "parrot" ]]; then
            print_success "Parrot OS detectado"
            return 0
        fi
    fi
    print_warning "No se detectó Parrot OS. El script puede funcionar pero usa comandos específicos de Parrot."
    read -p "¿Deseas continuar? (s/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        exit 1
    fi
}

# Crear backup de configuraciones existentes
backup_configs() {
    print_message "Creando backup de configuraciones existentes..."
    
    BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # Backup de archivos individuales
    [ -f ~/.zshrc ] && cp ~/.zshrc "$BACKUP_DIR/"
    [ -f ~/.p10k.zsh ] && cp ~/.p10k.zsh "$BACKUP_DIR/"
    
    # Backup de directorios de configuración
    [ -d ~/.config/bspwm ] && cp -r ~/.config/bspwm "$BACKUP_DIR/"
    [ -d ~/.config/sxhkd ] && cp -r ~/.config/sxhkd "$BACKUP_DIR/"
    [ -d ~/.config/polybar ] && cp -r ~/.config/polybar "$BACKUP_DIR/"
    [ -d ~/.config/picom ] && cp -r ~/.config/picom "$BACKUP_DIR/"
    [ -d ~/.config/rofi ] && cp -r ~/.config/rofi "$BACKUP_DIR/"
    [ -d ~/.config/kitty ] && cp -r ~/.config/kitty "$BACKUP_DIR/"
    [ -d ~/.config/nvim ] && cp -r ~/.config/nvim "$BACKUP_DIR/"
    
    print_success "Backup creado en: $BACKUP_DIR"
}

# Instalar paquetes
install_packages() {
    print_message "Instalando paquetes necesarios..."
    
    # Actualizar repositorios (usar parrot-upgrade en Parrot OS)
    sudo apt update
    
    # Lista de paquetes
    PACKAGES=(
        "bspwm"
        "sxhkd"
        "polybar"
        "picom"
        "rofi"
        "kitty"
        "feh"
        "zsh"
        "bat"
        "lsd"
        "git"
        "curl"
        "wget"
        "unzip"
        "build-essential"
        "libxcb-xinerama0-dev"
        "libxcb-icccm4-dev"
        "libxcb-randr0-dev"
        "libxcb-util0-dev"
        "libxcb-ewmh-dev"
        "libxcb-keysyms1-dev"
        "libxcb-shape0-dev"
    )
    
    for package in "${PACKAGES[@]}"; do
        if ! dpkg -l | grep -q "^ii  $package "; then
            print_message "Instalando $package..."
            sudo apt install -y "$package"
        else
            print_success "$package ya está instalado"
        fi
    done
    
    print_success "Paquetes instalados correctamente"
}

# Instalar Hack Nerd Font
install_fonts() {
    print_message "Instalando Hack Nerd Font..."
    
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    
    if [ ! -f "$FONT_DIR/Hack Regular Nerd Font Complete.ttf" ]; then
        cd /tmp
        wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
        unzip -q Hack.zip -d "$FONT_DIR"
        rm Hack.zip
        fc-cache -fv > /dev/null 2>&1
        print_success "Hack Nerd Font instalada"
    else
        print_success "Hack Nerd Font ya está instalada"
    fi
}

# Instalar Powerlevel10k
install_powerlevel10k() {
    print_message "Instalando Powerlevel10k..."
    
    P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    
    if [ ! -d "$P10K_DIR" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
        print_success "Powerlevel10k instalado"
    else
        print_success "Powerlevel10k ya está instalado"
    fi
}

# Instalar NvChad
install_nvchad() {
    print_message "Instalando NvChad..."
    
    # Verificar que neovim esté instalado
    if ! command -v nvim &> /dev/null; then
        print_message "Instalando Neovim..."
        sudo apt install -y neovim
    fi
    
    # Instalar NvChad si no existe
    if [ ! -d "$HOME/.config/nvim" ] || [ ! -f "$HOME/.config/nvim/init.lua" ]; then
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
        print_success "NvChad instalado"
        print_warning "Recuerda: Abre nvim y ejecuta :MasonInstallAll para instalar los LSPs"
    else
        print_success "NvChad ya está instalado"
    fi
}

# Crear directorios necesarios
create_directories() {
    print_message "Creando directorios necesarios..."
    
    mkdir -p ~/.config/{bspwm,sxhkd,polybar,picom,rofi,kitty}
    mkdir -p ~/fondos
    
    print_success "Directorios creados"
}

# Copiar configuraciones
copy_configs() {
    print_message "Copiando configuraciones..."
    
    # BSPWM
    ln -sf "$DOTFILES_DIR/config/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc
    chmod +x ~/.config/bspwm/bspwmrc
    
    # Scripts de BSPWM/Polybar
    mkdir -p ~/.config/bspwm/scripts
    cp -r "$DOTFILES_DIR/config/bspwm/scripts/"* ~/.config/bspwm/scripts/
    chmod +x ~/.config/bspwm/scripts/*
    
    # SXHKD
    ln -sf "$DOTFILES_DIR/config/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc
    
    # Polybar
    cp -r "$DOTFILES_DIR/config/polybar/"* ~/.config/polybar/
    chmod +x ~/.config/polybar/*.sh 2>/dev/null
    
    # Picom
    ln -sf "$DOTFILES_DIR/config/picom/picom.conf" ~/.config/picom/picom.conf
    
    # Rofi
    ln -sf "$DOTFILES_DIR/config/rofi/config.rasi" ~/.config/rofi/config.rasi
    
    # Kitty
    ln -sf "$DOTFILES_DIR/config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
    
    # ZSH
    ln -sf "$DOTFILES_DIR/config/zsh/.zshrc" ~/.zshrc
    ln -sf "$DOTFILES_DIR/config/zsh/.p10k.zsh" ~/.p10k.zsh
    
    # NvChad - Solo copiar si hay configs custom
    if [ -d "$DOTFILES_DIR/config/nvim" ]; then
        cp -r "$DOTFILES_DIR/config/nvim/"* ~/.config/nvim/ 2>/dev/null
    fi
    
    # Wallpapers
    cp -r "$DOTFILES_DIR/wallpapers/"* ~/fondos/
    
    print_success "Configuraciones copiadas correctamente"
}

# Configurar wallpaper
setup_wallpaper() {
    print_message "Configurando wallpaper..."
    
    # Añadir feh al bspwmrc si no está
    if ! grep -q "feh --bg-fill" ~/.config/bspwm/bspwmrc; then
        echo "feh --bg-fill ~/fondos/fondo.jpg &" >> ~/.config/bspwm/bspwmrc
    fi
    
    # Establecer wallpaper ahora
    if [ -f ~/fondos/fondo.jpg ]; then
        feh --bg-fill ~/fondos/fondo.jpg
        print_success "Wallpaper configurado"
    fi
}

# Cambiar shell a ZSH
change_shell() {
    print_message "Cambiando shell a ZSH..."
    
    if [ "$SHELL" != "$(which zsh)" ]; then
        chsh -s $(which zsh)
        print_success "Shell cambiado a ZSH. Cierra sesión y vuelve a entrar para aplicar cambios."
    else
        print_success "ZSH ya es tu shell predeterminado"
    fi
}

# Función principal
main() {
    clear
    echo -e "${BLUE}"
    echo "╔═══════════════════════════════════════════╗"
    echo "║     Instalador de Dotfiles - Parrot OS   ║"
    echo "╚═══════════════════════════════════════════╝"
    echo -e "${NC}"
    
    check_parrot
    
    echo ""
    read -p "$(echo -e ${YELLOW}¿Deseas hacer un backup de tus configuraciones actuales? [S/n]:${NC} )" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        backup_configs
    fi
    
    echo ""
    print_message "Iniciando instalación..."
    echo ""
    
    install_packages
    install_fonts
    create_directories
    install_powerlevel10k
    install_nvchad
    copy_configs
    setup_wallpaper
    change_shell
    
    echo ""
    echo -e "${GREEN}"
    echo "╔═══════════════════════════════════════════╗"
    echo "║     ¡Instalación completada! 🚀           ║"
    echo "╚═══════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    print_warning "Pasos siguientes:"
    echo "  1. Cierra sesión y vuelve a entrar (para aplicar ZSH)"
    echo "  2. Inicia sesión en tu WM con BSPWM"
    echo "  3. Abre nvim y ejecuta: :MasonInstallAll"
    echo "  4. Configura Powerlevel10k si es necesario: p10k configure"
    echo ""
    print_message "¡Disfruta de tu nuevo entorno! 😎"
}

# Ejecutar
main
