#!/bin/sh
if [ ! -L ~/.vim ]; then
	ln -sd ~/dotfiles/.vim ~/.vim
fi
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
