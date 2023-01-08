#!/usr/bin/sh

sudo pacman -S git --noconfirm

echo "Installing YAY..."
cd ~ && git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd .. && rm -rf yay
clear

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

echo "Installing Xorg Dependencies..."
yay -S xorg-server xorg-apps xorg-xinit xf86-video-intel --noconfirm
yay -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm
lightdm --test-mode --debug
sudo systemctl enable lightdm.service

echo "Installing Network Manager..."
yay -S wpa_supplicant wireless_tools networkmanager modemmanager mobile-broadband-provider-info usb_modeswitch --noconfirm
yay -S rp-pppoe nm-connection-editor network-manager-applet --noconfirm

sudo systemctl enable NetworkManager.service
sudo systemctl disable dhcpcd.service
sudo systemctl enable wpa_supplicant.service
sudo systemctl start NetworkManager.service

echo "Installing bluetooth..."
yay -S bluez bluez-utils blueman pulseaudio-bluetooth --noconfirm
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
clear

echo "Installing development base"
yay -S base-devel curl wget xclip openssh openssl gnome-keyring libsecret libgnome-keyring zlib xz --noconfirm 
clear

echo "Installing Fira Code..."
yay -S ttf-fira-code --noconfirm


echo "Installing Xmonad Dependencies..."
yay -S xmonad xmonad-contrib xmobar dmenu xterm --noconfirm

echo "Installing Qtile Dependencies..."
yay -S qtile --noconfirm

echo "Installing AwesomeWM Dependencies..."
yay -S awesome --noconfirm

--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

echo "Installing ZSH..."
yay -S zsh --noconfirm

echo "Installing Oh my ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


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
yay -S php

echo "Installing Composer..."
cd ~ && mkdir .composer
cd .composer
curl -sS https://getcomposer.org/installer | php
sudo pacman -S composer --noconfirm

echo "Installing NodeJS..."
yay -S nodejs npm --noconfirm

echo "Installing NVM..."
yay -S nvm --noconfirm

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

echo "Installing PHPStorm..."
yay -S phpstorm --noconfirm
clear

echo "Installing VSCode..."
yay -S visual-studio-code-bin --noconfirm
clear

echo "Installing Postman..."
yay -S postman-bin --noconfirm

echo "Installing emacs..."
yay -S emacs --noconfirm
clear

echo "Installing nnn"
yay -S nnn --noconfirm
clear

echo "Install Google Chrome..."
yay -S google-chrome --noconfirm
clear


--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

# Setting up the system

cd ~ && git clone https://github.com/jvklj/dotfiles.git

mv dotfiles .dotfiles

ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/.config/xmonad ~/.config/xmonad
ln -sf ~/.dotfiles/.config/xmobar ~/.config/xmobar
ln -sf ~/.dotfiles/.config/qtile ~/.config/qtile
ln -sf ~/.dotfiles/.emacs.d ~/.emacs.d
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.config/alacritty ~/.config/alacritty



####################################################################
####################################################################
####################################################################
####################################################################
