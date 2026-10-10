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

# Install fonts
sudo add-apt-repository -y universe
sudo apt install fonts-firacode

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
mkdir -p ~/.config

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-bash

# Install dotfiles
mkdir -p ~/src
ln -sf ~/src/dotfiles/.zshrc ~/.zshrc
ln -sf ~/src/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/dotfiles/.aliases ~/.aliases
ln -sf ~/src/dotfiles/spaceship.zsh ~/.config/spaceship.zsh
ln -sf ~/src/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global init.defaultBranch main
git config --global pager.branch false

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
## Terraform syntax
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform

# Install tfenv
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
