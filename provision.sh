apt-get update -y
apt-get install -y sudo zsh git curl wget locales rsync \
  python3-venv neovim fzf direnv \
  build-essential libsqlite3-dev zlib1g-dev \
  libssl-dev libffi-dev libbz2-dev libreadline-dev \
  readline-doc bzip2-doc libncurses5 libncurses5-dev \
  libncursesw5 libncursesw5-dev

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8
export UHOME=/home/$SYS_USER
export APP_ROOT=$UHOME/apps

useradd -m -s /bin/zsh $SYS_USER
usermod -aG sudo $SYS_USER
echo $SYS_USER:$SYS_PASS | chpasswd
# Use origin script when outside: /bin/su -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' - $SYS_USER
/bin/su -c '/bin/sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"' - $SYS_USER
/bin/su -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" - $SYS_USER
/bin/su -c "git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" - $SYS_USER
/bin/su -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0" - $SYS_USER
/bin/su -c "mkdir $APP_ROOT" - $SYS_USER
/bin/su -c "git clone https://github.com/leetschau/sysClone.git $APP_ROOT/sysClone" - $SYS_USER
/bin/su -c "chmod 755 $APP_ROOT/sysClone/sc" - $SYS_USER
/bin/su -c "$APP_ROOT/sysClone/sc res" - $SYS_USER
/bin/su -c "echo '. /usr/share/doc/fzf/examples/key-bindings.zsh' >> $HOME/.zshrc" - $SYS_USER
/bin/su -c "git clone https://github.com/leetschau/vimrcs.git ~/.config/vimrcs" - $SYS_USER
/bin/su -c "nvim +qa" - $SYS_USER
