#!/bin/bash
echo 'Installing neovim'
sudo add-apt-repository -y ppa:neovim-ppa/stable 
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y neovim

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
DEBIAN_FRONTEND=noninteractive | sudo apt install -y lsb-core
sudo apt install -y software-properties-common
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform-ls

sudo pip3 install jedi-language-server

sudo apt install -y fzf
sudo apt install -y ripgrep

echo 'alias vim='nvim'' >> ~/.bashrc

echo 'Now run :PlugInstall to install plugins and done!'
