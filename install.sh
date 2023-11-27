#桌面
sudo pacman -S plasma-meta konsole dolphin plasma-wayland-session
sudo systemctl enable sddm.service
balooctl suspend
balooctl disable

#电源管理
sudo pacman -S tlp
sudo systemctl enable tlp.service
systemctl mask systemctl-rfkill.service
systemctl mask systemctl-rfkill.socket

#声音
sudo pacman -S sof-firmware alsa-firmware alsa-ucm-conf
sudo pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-audio gst-plugin-pipewire pipewire-jack pavucontrol wireplumber


#蓝牙
sudo pacman -S bluez bluez-utils
sudo systemctl enable --now bluetooth

#输入法
sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-chewing fcitx5-configtool
sudo pacman -S fcitx5-material-color
sudo pacman -S fcitx5-pinyin-zhwiki
##设置环境变量
sudo vim /etc/environment << EOF
G
$
o
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus

:wq
EOF

#常用
sudo pacman -S clash
sudo pacman -S jdk-openjdk
sudo pacman -S obs-studio xdg-desktop-portal xdg-desktop-portal-kde
sudo pacman -S ntfs-3g
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd
paru -S google-chrome
sudo pacman -S ark mpv
sudo pacman -S p7zip unrar unarchiver lzop lrzip okular spectacle
sudo pacman -S neofetch tree
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream
sudo pacman -S gwenview
sudo pacman -S gwenview
sudo pacman -S steam
sudo pacman -S obsidian
sudo pacman -S telegram-desktop
sudo pacman -S arm-none-eabi-gcc arm-none-eabi-newlib
sudo pacman -S stlink openocd
sudo pacman -S calibre
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions autojump
paru -S visual-studio-code-bin clion clion-jre clion-gdb clion-cmake typora-free linuxqq yesplaymusic stm32cubemx qqmusic-electron netease-cloud-music wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts baidunetdisk-bin
sudo pacman -S minecraft-launcher steam

#博客
sudo pacman -S npm nodejs
paru -S hexo-cli
