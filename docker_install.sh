#!/bin/bash
echo 'Installing neovim'
add-apt-repository -y ppa:neovim-ppa/stable 
apt-get update
apt-get upgrade
apt-get install -y neovim

echo 'Copying personal neovim config to ~/.config/nvim'
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
cp coc-settings.json ~/.config/nvim/coc-settings.json

echo 'Installing Plug manager'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo 'Installing coc nvim nodejs'
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt install -y nodejs

echo 'Installing Terraform language server'
DEBIAN_FRONTEND=noninteractive | apt install -y lsb-core
apt install -y software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install -y terraform-ls

pip3 install jedi-language-server

apt install -y fzf
apt install -y ripgrep

echo 'alias vim='nvim'' >> ~/.bashrc

echo 'Now run :PlugInstall to install plugins and done!'
echo 'Now run :CocInstall coc-tsserver to install typescript language server!'
echo 'Run also :CocInstall and then :CocInstallBinaries'

