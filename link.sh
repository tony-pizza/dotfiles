#!/usr/bin/env bash

mv ~/.gitconfig ~/.gitconfig.backup
mv ~/.tmux.conf ~/.tmux.conf.backup
mv ~/.vimrc ~/.vimrc.backup

ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
