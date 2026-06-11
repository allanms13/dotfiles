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
configs=(hypr waybar fish kitty nvim rofi dunst)

for config in "${configs[@]}"; do
    rm -rf ~/.config/$config
    ln -sf ~/dotfiles/$config ~/.config/$config
done

rm -rf ~/.config/nwg-dock-hyprland
ln -sf ~/dotfiles/nwg-dock ~/.config/nwg-dock-hyprland

echo "==> Listo! Reinicia sesión para aplicar todo."
