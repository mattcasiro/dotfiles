# Start from the home dir
if [[ "$(pwd)" != "${HOME}" ]]; then
	pushd ~ > /dev/null
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/mcasiro/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade

# Install fzf for improved reverse search
brew install fzf

# Install go
brew install go
go version

# Install rbenv
brew install rbenv

# Install jenv
brew install jenv

# Install pipx
brew install pipx
pipx ensurepath
sudo pipx ensurepath --global

# Install argcomplete
pipx install argcomplete

# Install AWS cli
sudo softwareupdate --install-rosetta
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

### Kubernetes Tooling
# Install kubectl to manage Kubernetes
brew install kubectl
brew install fluxcd/tap/flux

# Install Maccy clipboard manager
brew install maccy

# Install AeroSpace (tiling window manager)
# If uncommenting this line, also uncomment linking the dotfile
# brew install --cask nikitabobko/tap/aerospace
# Install Rectangle (window snapping)
brew install --cask rectangle

# Install Python
brew install pyenv
eval "$(pyenv init -)"
pyenv install

# Install Zsh and OhMyZsh
brew install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install dotfiles
pushd ~/src/personal/dotfiles > /dev/null
#ln -sf ~/src/personal/dotfiles/.aerospace.toml ~/.aerospace.toml
ln -sf ~/src/personal/dotfiles/.aliases ~/.aliases
ln -sf ~/src/personal/dotfiles/.awsrc ~/.awsrc
ln -sf ~/src/personal/dotfiles/.env ~/.env
ln -sf ~/src/personal/dotfiles/.gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ln -sf ~/src/personal/dotfiles/.vimrc ~/.vimrc
ln -sf ~/src/personal/dotfiles/.zshfuncs ~/.zshfuncs
ln -sf ~/src/personal/dotfiles/.zshrc ~/.zshrc
popd > /dev/null # ~

. ~/.zshrc

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

# tenv for Terraform version management
brew install tenv

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
