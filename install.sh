sudo pacman -S paru texinfo

#开启颜色提醒、并行下载、multilib和cn库
sudo vim /etc/pacman.conf << EOF
/Color

x
/ParallelDownloads = 5

x
/[multilib]

x
/Include = /etc/pacman.d/mirrorlist

x
G
$
o


[archlinuxcn]
Server = https://mirrors.bfsu.edu.cn/archlinuxcn/$arch
:wq
EOF

sudo pacman -S archlinuxcn-keyring base-devel
sudo mv /etc/makepkg.conf /home/akira/
sudo cp /home/akira/Archinstall/makepkg.conf /etc/


#桌面
sudo pacman -S mesa vulkan-intel intel-media-driver
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
sudo pacman -S bluez bluez-utils bluedevil
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


GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus

:wq
EOF


#常用
sudo pacman -S meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio ctags
sudo pacman -S clash v2ray v2raya
#配置clash
clash
sudo cp /home/akira/Archinstall/config.yaml /home/akira/.config/clash/
sudo vim /etc/systemd/system/clash.service
i
[Unit]
Description=Clash daemon
After=network.target

[Service]
Type=simple
Restart=always
ExecStart=/usr/bin/clash

[Install]
WantedBy=multi-user.target

:wq

systemctl enable clash
systemctl start clash
sudo vim /etc/environment << EOF
G
$
o


export https_proxy=127.0.0.1:7890
export https_proxy=127.0.0.1:7890
export socks_proxy=127.0.0.1:7890

:wq
EOF

sudo pacman -S jdk-openjdk
sudo pacman -S obs-studio xdg-desktop-portal xdg-desktop-portal-kde
sudo pacman -S ntfs-3g
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd ttf-jetbrains-mono
paru -S google-chrome
sudo pacman -S ark mpv
sudo pacman -S p7zip unrar unarchiver lzop lrzip okular spectacle tar
sudo pacman -S neofetch tree
sudo pacman -S packagekit-qt5 packagekit appstream-qt appstream
sudo pacman -S gwenview
sudo pacman -S gwenview
sudo pacman -S steam
sudo pacman -S obsidian ghostwriter
sudo pacman -S telegram-desktop
sudo pacman -S arm-none-eabi-gcc arm-none-eabi-newlib
sudo pacman -S stlink openocd
sudo pacman -S foliate
#终端
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions autojump
chsh -s /usr/bin/zsh
sudo vim /home/akira/.zshrc << EOF
G
$
o


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

:wq
EOF
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
sudo vim /home/akira/.zimrc << EOF
G
$
o


zmodule romkatv/powerlevel10k

:wq
EOF
zimfw install

paru -S visual-studio-code-bin clion clion-jre clion-gdb clion-cmake typora-free linuxqq yesplaymusic stm32cubemx qqmusic-electron netease-cloud-music wps-office-cn wps-office-mui-zh-cn ttf-wps-fonts baidunetdisk-bin lceda-pro-bin xmind pycharm
sudo downgrade 'freetype2=2.13.0'
sudo pacman -S minecraft-launcher steam blender

sudo pacman -S texlive texlive-langchinese 
sudo pacman -S gparted kicad gimp thunderbird qbittorrent

#博客
sudo pacman -S npm nodejs
paru -S hexo-cli

#sudo cp /home/akira/Archinstall/.vimrc /home/akira
sudo cp /home/akira/Archinstall/.vimrc /etc/vimrc

cd /home/akira/.config/
mkdir fontconfig
sudo cp /home/akira/Archinstall/fonts.conf /home/akira/.config/fontconfig/

