#!/bin/bash
echo 'Installing neovim'
sudo add-apt-repository -y ppa:neovim-ppa/stable 
sudo apt-get update
sudo apt-get install -y neovim

echo 'Copying personal neovim config to ~/.config/nvim'
mkdir ~/.config/nvim
#touch ~/.config/nvim/init.vim
cp init.vim ~/.config/nvim/

echo 'Installing Plug manager'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo 'Installing Terraform language server'
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform-ls

echo 'alias vim='nvim'' >> ~/.bashrc

echo 'Now run :PlugInstall to install plugins and done!'
