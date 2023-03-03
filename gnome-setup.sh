# installing gnome shell extensions
wget https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer -P  ~/Downloads/
chmod +x ~/Downloads/gnome-shell-extension-installer
~/Downloads/gnome-shell-extension-installer 19 517 4099 1319 2890 

# create folders
mkdir ~/.themes
mkdir ~/.icons

# Download and install GTK Theme
wget https://github.com/catppuccin/gtk/releases/download/v0.4.0/Catppuccin-Macchiato-Standard-Mauve-Dark.zip -P ~/Downloads/
unzip ~/Downloads/Catppuccin-Macchiato-Standard-Mauve-Dark.zip -d .themes/

# Download and install Icons and Cursor
git clone https://github.com/vinceliuice/Colloid-icon-theme ~/Downloads/Colloid-icon-theme
sh ~/Downloads/Colloid-icon-theme/install.sh -s dracula -t purple
cd ~/Downloads/Colloid-icon-theme/cursors/
./install.sh

#Download Wallpaper
git clone https://github.com/catppuccin/wallpapers ~/.themes/wallpaper

# GTK 4 config
mkdir -p "${HOME}/.config/gtk-4.0"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${HOME}/.themes/Catppuccin-Macchiato-Standard-Mauve-Dark//gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# Flatpak theme config
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --env=GTK_THEME=Catppuccin-Macchiato-Standard-Mauve-Dark
sudo flatpak override --filesystem=/home/$USER/.icons/:ro

# gnome configuration
dconf write /org/gnome/shell/extensions/user-theme/name "'Catppuccin-Macchiato-Standard-Mauve-Dark'"
gsettings set org.gnome.desktop.background picture-uri-dark ~/.themes/wallpaper/minimalistic/gradient-synth-cat.png
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Mauve-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Macchiato-Standard-Mauve-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Colloid-purple-dracula-dark"
gsettings set org.gnome.desktop.interface cursor-theme "Colloid-cursors"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
