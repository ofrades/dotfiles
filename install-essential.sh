#!/bin/bash

# install linux essential stuff to work with pop-os

echo "-> Tools installation just started"

mkdir -p ~/build
mkdir -p ~/notes

sudo apt update

sudo apt-get install -y \
    make cmake fzf bat ripgrep fd-find silversearcher-ag tree kitty  \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip \
    make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev docker.io \
    git nodejs npm python3-pip python3-neovim golang-go \
    texlive-luatex texlive-fonts-recommended texlive-fonts-extra latexmk \
    libltdl-dev flex bison fontforge python3-pygments \
    neofetch flameshot google-chrome-stable htop code

flatpak install \
    slack discod microsoft.teams postman \
    calibre krita peek figma

echo "-> Essential linux packages installed"

# install yarn
if ! [ -x "$(command -v yarn)" ]; then
  echo "-> Yarn is installing"
  sudo npm install --global yarn
  else
    echo "-> Yarn already installed"
fi

# install yarn packages
if ! [ -x "$(command -v prettier)" ]; then
  echo "-> Yarn packages are installing"
  yarn global add prettier eslint eslint_d typescript write-good
  else
    echo "-> Yarn already installed"
fi

# install neovim
if ! [ -d $HOME/build/neovim ]; then
    echo "-> Neovim installing"
    git clone https://github.com/neovim/neovim ~/build/neovim
    cd ~/build/neovim/
    make
    sudo make install
    sudo npm install --global neovim
    cd ~/
else
    echo "-> Neovim already installed"
fi


# install starship
if ! [ -x "$(command -v starship)" ]; then
    echo "-> Installing starship"
    curl -fsSL https://starship.rs/install.sh | bash
else
    echo "-> Startship already installed"
fi

# install autojump
if ! [ -x "$(command -v jump)" ]; then
    echo "-> Autojump installing"
    wget https://github.com/gsamokovarov/jump/releases/download/v0.40.0/jump_0.40.0_amd64.deb
    sudo dpkg -i jump_0.40.0_amd64.deb
else
    echo "-> Autojump already installed"
fi

# get dotfiles
if ! [ -d $HOME/.cfg ]; then
    echo "-> Downloading dotfiles"
    git clone --bare https://github.com/ofrades/configs ~/.cfg
    echo "-> Moving dotfiles"
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
    echo "-> Remove dotfiles"
    sudo rm -r $HOME/configs
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
else
    echo "-> Dotfiles already present"
fi

# gnome options setup
# save in file with something like:
# dconf dump / > ~/.config/gnome/dconf-settings.ini
echo "-> Loading gnome configs"
dconf load / < ~/.config/gnome/dconf-settings.ini

# rust
if ! [ -x "$(command -v cargo)" ]; then
    echo "-> Installing rust"
    curl https://sh.rustup.rs -sSf | sh
else
    echo "-> Rust already installed"
fi

if ! [ -x "$(command -v stylua)" ]; then
    echo "-> Installing rust packages"
    cargo install cargo-generate
    cargo install stylua
    cargo install deno
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
else
    echo "-> Rust packages already installed"
fi

# jekyll
if ! [ -x "$(command -v jekyll)" ]; then
    echo "-> Installing jekyll"
    sudo gem install bundler jekyll
    sudo apt install ruby-dev
    sudo apt install pipenv
else
    echo "-> jekyll already installed"
fi

# lazygit
if ! [ -x "$(command -v lazygit)" ]; then
    echo "-> Installing lazygit and lazydocker"
    sudo add-apt-repository ppa:lazygit-team/release
    sudo apt-get update
    sudo apt-get install lazygit
    curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
else
    echo "-> lazygit already installed"
fi

# xournal
if ! [ -x "$(command -v xournal)" ]; then
    echo "-> Installing xournal"
    sudo add-apt-repository ppa:apandada1/xournalpp-stable
    sudo apt update
    sudo apt install xournalpp
else
    echo "-> xournal already installed"
fi

# install gregorio
# if ! [ -d $HOME/build/gregorio ] && ! [ -x "$(command -v gregorio)" ]; then
#     echo "-> Gregorio installing"
#     git clone https://github.com/gregorio-project/gregorio ~/build/gregorio
#     cd ~/build/gregorio
#     ./build.sh
#     sudo ./install.sh
#     cd ~/
# else
#     echo "-> Gregorio already installed"
# fi

# gh
if ! [ -x "$(command -v gh)" ]; then
    echo "-> Installing gh"
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh
else
    echo "-> gh already installed"
fi

# fish as default shell
if ! [ -x "$(command -v fish)" ]; then
    echo "-> Setting fish as default shell"
    sudo apt install fish
    chsh -s `which fish`
else
    echo "-> Fish already installed"
fi
