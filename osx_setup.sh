# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
pip install --upgrade pip setuptools

# Install Zsh and OhMyZsh
brew install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install dotfiles
pushd ~/src/MISC/dotfiles > /dev/null
ln -sf ~/src/MISC/dotfiles/.zshrc ~/.zshrc
ln -sf ~/src/MISC/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/MISC/dotfiles/.aliases ~/.aliases
ln -sf ~/src/MISC/dotfiles/.path ~/.path
ln -sf ~/src/MISC/dotfiles/.benevity ~/.benevity
ln -sf ~/src/MISC/dotfiles/.private ~/.private
ln -sf ~/src/MISC/dotfiles/.env ~/.env
ln -sf ~/src/MISC/dotfiles/.zshfuncs ~/.zshfuncs
ln -sf ~/src/MISC/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
popd > /dev/null # ~

# Install darcula theme for vim
pushd ~/src/MISC > /dev/null
git clone git@github.com:blueshirts/darcula.git
mkdir -p ~/.vim/colors
cp darcula/colors/darcula.vim ~/.vim/colors/
popd > /dev/null # ~

# Set up plugins for Vim
mkdir -p ~/.vim/pack/plugins
mkdir -p ~/.vim/pack/plugins/start
mkdir -p ~/.vim/pack/plugins/opt
# Terraform
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform

# Install powerline fonts
pushd ~/src/MISC > /dev/null
git clone https://github.com/powerline/fonts.git --depth=1
pushd fonts > /dev/null
./install.sh
popd > /dev/null # ~/src/MISC
rm -rf fonts
popd > /dev/null # ~

# OSX configurations
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
