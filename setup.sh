#!/usr/bin/sh

sudo pacman -Syu

echo "Installing YAY..."
cd ~ && git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
clear

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

# Desktop environment and window managers
echo "Installing Xorg Dependencies..."
yay -S xorg-server xorg-apps xorg-xinit xf86-video-intel --noconfirm
yay -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm
lightdm --test-mode --debug

echo "Installing Network Manager..."
yay -S wpa_supplicant wireless_tools networkmanager modemmanager mobile-broadband-provider-info usb_modeswitch --noconfirm
yay -S rp-pppoe nm-connection-editor network-manager-applet --noconfirm

sudo systemctl enable NetworkManager.service
sudo systemctl disable dhcpcd.service
sudo systemctl enable wpa_supplicant.service
sudo systemctl start NetworkManager.service


echo "Installing bluetooth..."
yay -S bluez bluez-utils pulseaudio-bluetooth --noconfirm
sudo systemctl enable bluetooth.service
clear

echo "Installing development base"
yay -S base-devel curl wget xclip openssh openssl gnome-keyring libsecret libgnome-keyring zlib xz --noconfirm 
clear

echo "Installing fonts..."
echo "Installing Fira Code..."
yay -S ttf-fira-code --noconfirm
clear

sudo systemctl enable lightdm.service

echo "Installing Xmonad Dependencies..."
yay -S xmonad xmonad-contrib xmobar dmenu xterm --noconfirm

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

echo "Installing ZSH..."
yay -S zsh --noconfirm

echo "Installing Oh my ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing starship"
yay -S starship --noconfirm

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo "Installing Docker..."
yay -S docker --noconfirm
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
docker --version
clear

echo "Installing Docker-Compose..."
yay -S docker-compose --noconfirm
docker-compose --version
clear

echo "Installing Pyenv..."
yay -S pyenv-virtualenv
clear

echo "Install poetry..."
curl -sSL https://install.python-poetry.org | python3 -
#poetry config virtualenvs.in-project true

echo "Installing autoswitch plugin" 
cd ~ && git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"

echo "Installing PHP..."
yay -S php php-apache php-gd php-intl php-pgsql php-sqlite php-yaml --noconfirm

echo "Installing Composer..."
yay -S composer --noconfirm

echo "Installing NodeJS..."
yay -S nodejs npm --noconfirm

echo "Installing NVM..."
yay -S nvm --noconfirm

echo "Installing Elixir..."
yay -S elixir --noconfirm

echo "Installing Erlang..."
yay -S erlang --noconfirm

echo "Installing asdf..."
yay -S asdf-vm --noconfirm

echo "installing alacritty"
yay -S alacritty --noconfirm
clear

echo "Installing Flameshot..."
yay -S flameshot --noconfirm
clear

echo "Installing Discord..."
yay -S discord --noconfirm
clear

echo "Installing VLC..."
yay -S vlc --noconfirm
clear

echo "Installing Spotify..."
yay -S spotify --noconfirm
clear

echo "Installing Telegram..."
yay -S telegram-desktop --noconfirm
clear

echo "Installing Dbeaver..."
yay -S dbeaver --noconfirm
clear

echo "Installing VSCode..."
yay -S visual-studio-code-bin --noconfirm
clear

echo "Installing Postman..."
yay -S postman-bin --noconfirm

echo "Installing Neovim..."
yay -S neovim --noconfirm

echo "Installing emacs..."
yay -S emacs --noconfirm
clear

echo "Install Thunar..."
yay -S thunar --noconfirm
clear

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

# Setting up the system

cd ~ && git clone https://github.com/jvklj/dotfiles.git

mv dotfiles .dotfiles

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.config/xmonad ~/.config/xmonad
ln -s ~/.dotfiles/.config/xmobar ~/.config/xmobar
ln -s ~/.dotfiles/.emacs.d ~/.emacs.d
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.config/alacritty ~/.config/alacritty



