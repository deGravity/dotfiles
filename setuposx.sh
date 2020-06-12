#!/usr/bin/env bash

PUBLICKEY=~/.ssh/id_rsa.pub

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f "$PUBLICKEY"]; then
    yes '' | ssh-keygen -t
fi

pbcopy < $PUBLICKEY

read -p "Public key copied to clipboard. Log in to https://github.com/settings/keys and add key to GitHub. Press ENTER when done."

open "https://github.com/settings/keys"

git clone git@github.com:deGravity/dotfiles.git ~/.dotfiles

brew install vim
brew install tmux
brew cask install iterm2
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install firefox
brew cask install anaconda
brew cask install rectangle
brew cask install anaconda

read -p "Launching Rectangle to setup permissions and preferences. Turn open at launch ON. Press ENTER to continue."

open "/Applications/Rectangle.app"


ln -sfn ~/.dotfiles/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall


read -p "Enter name for git." gituser
read -p "Enter email address for git." gitemail

git config --global user.name $gituser
git config --global user.email $gitemail

echo 'PATH=/usr/local/anaconda3/bin:$PATH' >> ~/.zshrc


