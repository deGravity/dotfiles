#!/bin/sh

# Install MacOSX Developer Tools (XCode)
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install Development Packages
brew install git
brew install cmake
brew install mono
brew install boost
brew install opencv
brew install gsl
brew install gradle
brew install wget
brew install tmux
brew install ant
# OSX comes with python, but this will also give us pip
brew install python --with-brewed-openssl

brew install caskroom/cask/brew-cask

# Install oh my zsh - don't use brew zsh because it is "non-standard"
curl -L http://install.ohmyz.sh | sh

# Install Other Applications
brew cask install google-chrome
brew cask install amethyst
brew cask install flux
brew cask install bettertouchtool
brew cask install handbrake
brew cask install xquartz
brew cask install inkscape
brew cask install iterm2
brew cask install audacity
brew cask install hyro
brew cask install cyberduck
brew cask install eclipse-ide
brew cask install intellij-idea-ce
brew cask install minecraft
brew cask install capo
brew cask install mumble
brew cask install mplayerx
brew cask install vlc

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install vim
brew install macvim --env-std --override-system-vim

# Install Powerline -- must be done before putting bash_profile in place
# so that syspip is not required.
pip install --user git+git://github.com/Lokaltog/powerline

# Install Virtualenv
pip install virtualenv

# Install Eclim for headless running
# wget http://sourceforge.net/projects/eclim/files/eclim/2.3.4/eclim_2.3.4.jar/download
# TODO - figure out where eclipse home and eclim jars will be
# figure out xvfb
# java \
#    -Dvim.files=$HOME/.vim \
#    -Declipse.home=/opt/eclipse \
#    -jar eclim_2.3.4.jar install

# Symlink Dotfiles into place
ln -sfn vimrc ~/.vimrc
ln -sfn amethyst ~/.amethyst
ln -sfn zshrc ~/.zshrc
ln -sfn bash_profile ~/.bash_profile

# Install Vim Plugins
vim +BundleInstall +quall

# Build YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --omnisharp-completer

# Remind about necessary manual changes:
echo "Required Manual Installs:"

echo "Install vimium and change custom key mappings to:"
echo "unmap j"
echo "unmap k"
echo "unmap h"
echo "unmap l"
echo "map h scrollDown"
echo "map t scrollUp"
echo "map d scrollLeft"
echo "map n scrollRight"
echo "map y createTab"

echo ""

echo "Install RES. Remap key bindings to:"
echo "hide -> none"
echo "moveUp -> T"
echo "moveDown -> H"
echo "moveUpSibling -> shift-T"
echo "moveDownSibling -> shift-H"
echo "toggleExpando -> O"
echo "toggleViewImages -> shift-O"

echo ""

echo "Install powerline fonts and set default iTerm font."

echo ""

echo "Install Guitar Pro 6"

echo "Setup an alias for MacVim in the /Applications directory"

echo ""

echo "Install MOTU software from disk."

