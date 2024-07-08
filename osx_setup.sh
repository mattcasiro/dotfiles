# Start from the home dir
if [[ "$(pwd)" != "${HOME}" ]]; then
	pushd ~ > /dev/null
fi

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
pushd ~/src/personal/dotfiles > /dev/null
ln -sf ~/src/personal/dotfiles/.aliases ~/.aliases
ln -sf ~/src/personal/dotfiles/.awsrc ~/.awsrc
ln -sf ~/src/personal/dotfiles/.benevity ~/.benevity
ln -sf ~/src/personal/dotfiles/.env ~/.env
ln -sf ~/src/personal/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ln -sf ~/src/personal/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/personal/dotfiles/.zshfuncs ~/.zshfuncs
ln -sf ~/src/personal/dotfiles/.zshrc ~/.zshrc
popd > /dev/null # ~

exec zsh

# Install darcula theme for vim
pushd ~/src/personal > /dev/null
git clone git@github.com:blueshirts/darcula.git
mkdir -p ~/.vim/colors
cp darcula/colors/darcula.vim ~/.vim/colors/
popd > /dev/null # ~

# Set up plugins for Vim
mkdir -p ~/.vim/pack/plugins
mkdir -p ~/.vim/pack/plugins/start
mkdir -p ~/.vim/pack/plugins/opt

# Terraform for vim
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform

# Install powerline fonts
pushd ~/src/personal > /dev/null
git clone https://github.com/powerline/fonts.git --depth=1
pushd fonts > /dev/null
./install.sh
popd > /dev/null # ~/src/personal
rm -rf fonts
popd > /dev/null # ~

# OSX configurations
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots
