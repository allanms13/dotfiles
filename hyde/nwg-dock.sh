#!/usr/bin/env bash

if ! source "$(which hyde-shell)"; then
  echo "[wallbash] nwg-dock :: Error: hyde-shell not found."
  exit 1
fi

cacheDir="${cacheDir:-$XDG_CACHE_HOME/hyde}"
dockCss="$HOME/.config/nwg-dock-hyprland/style.css"

# Leer colores de wallbash
source <(grep "^export" "${cacheDir}/wallbash/dunst.conf" 2>/dev/null || true)

# Obtener colores del tema actual
pry1=$(grep "wallbash-pry1:" "${cacheDir}/wallbash/colors.scss" | head -1 | grep -oP '#[0-9A-Fa-f]+')
pry2=$(grep "wallbash-pry2:" "${cacheDir}/wallbash/colors.scss" | head -1 | grep -oP '#[0-9A-Fa-f]+')
xa5=$(grep "wallbash-2xa5:" "${cacheDir}/wallbash/colors.scss" | head -1 | grep -oP '#[0-9A-Fa-f]+')
txt1=$(grep "wallbash-txt1:" "${cacheDir}/wallbash/colors.scss" | head -1 | grep -oP '#[0-9A-Fa-f]+')

cat > "${dockCss}" <<EOF
window {
    background: $(echo $pry2 | sed 's/#//') ;
    background: rgba($(printf '%d,%d,%d' 0x${pry1:1:2} 0x${pry1:3:2} 0x${pry1:5:2}), 0.85);
    border-radius: 14px;
    border-style: solid;
    border-width: 1px;
    border-color: rgba($(printf '%d,%d,%d' 0x${xa5:1:2} 0x${xa5:3:2} 0x${xa5:5:2}), 0.4);
}

#box {
    padding: 4px 8px;
}

#active {
    border-bottom: solid 2px;
    border-color: rgba($(printf '%d,%d,%d' 0x${xa5:1:2} 0x${xa5:3:2} 0x${xa5:5:2}), 0.9);
}

button, image {
    background: none;
    border-style: none;
    box-shadow: none;
}

button {
    padding: 2px;
    margin-left: 2px;
    margin-right: 2px;
    font-size: 10px;
}

button:hover {
    background-color: rgba($(printf '%d,%d,%d' 0x${xa5:1:2} 0x${xa5:3:2} 0x${xa5:5:2}), 0.25);
    border-radius: 8px;
}

button:focus {
    box-shadow: none;
}
EOF

# Reiniciar el dock
pkill nwg-dock-hyprland
sleep 0.5
nwg-dock-hyprland -i 24 -p bottom -d -mb 0 -hd 100 -c "/home/allanms/.local/lib/hyde/rofilaunch.sh" &
