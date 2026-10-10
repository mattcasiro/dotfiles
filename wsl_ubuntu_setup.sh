# Update system and install zsh
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install zsh

# Force zsh to launch if running bash
cat << EOF >> ~/.bashrc
if [ -t 1 ]; then
    exec zsh
fi
EOF

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install dotfiles
mkdir -p ~/src
ln -sf ~/src/dotfiles/.zshrc ~/.zshrc
ln -sf ~/src/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/dotfiles/.aliases ~/.aliases
ln -sf ~/src/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main

# Install darcula theme for vim
git clone git@github.com:blueshirts/darcula.git ~/src/darcula
mkdir -p ~/.vim/colors
cp ~/src/darcula/colors/darcula.vim ~/.vim/colors/
rm -rf ~/src/darcula

# Vim
## Set up plugins
mkdir -p ~/.vim/pack/plugins
mkdir -p ~/.vim/pack/plugins/start
mkdir -p ~/.vim/pack/plugins/opt
## Terraform
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
## Install powerline fonts
git clone https://github.com/powerline/fonts.git ~/src/fonts
~/src/fonts/install.sh
rm -rf ~/src/fonts

# Install tfenv
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
