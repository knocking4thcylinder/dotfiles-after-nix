yay pacman -S --needed --noconfirm git neovim fisher gcc starship zoxide fzf carapace-bin atuin superfile luajit luarocks bat btop ghostty tmux

#Hyprland stuff
yay -S --needed --noconfirm hyprland waybar rofi-wayland hyprpaper hypridle xdg-desktop-portal-hyprland hyprlock wl-clipboard wl-clip-persist cliphist dunst hyprpolkitagent network-manager-applet udiskie grim slurp playerctl brightnessctl blueberry autocpufreq btop gnome-calendar pavucontrol keyd xwaylandvideobridge xorg-xwayland wireplumber-pulse

#Fonts
yay -S --needed --noconfirm ttf-iosevkaterm-nerd ttf-iosevka-nerd ttf-iosevka ttf-font-awesome

sudo cp $HOME/dotfiles/keyd.conf /etc/keyd/default.conf
sudo systemctl enable --now autocpufreq.service
sudo systemctl enable --now keyd.service

fisher install kidonng/zoxide.fish
fisher install patrickf2/fzf.fish

