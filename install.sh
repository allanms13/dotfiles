#!/usr/bin/env bash

echo "==> Instalando dotfiles de allanms..."

# Instalar paquetes base
sudo pacman -S --needed git base-devel hyprland waybar kitty fish starship \
    neovim lsd bat fzf zoxide lazygit btop fastfetch dunst \
    grim slurp wl-clipboard brightnessctl swayidle \
    nwg-dock-hyprland networkmanager power-profiles-daemon \
    noto-fonts ttf-jetbrains-mono-nerd

# Instalar yay si no está
if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si
fi

# Instalar paquetes AUR
yay -S --needed visual-studio-code-bin ani-cli grimblast-git

# Crear symlinks
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/fish ~/.config/fish
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/dunst ~/.config/dunst
ln -sf ~/dotfiles/nwg-dock ~/.config/nwg-dock-hyprland

echo "==> Listo! Reinicia sesión para aplicar todo."
