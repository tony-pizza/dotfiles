#!/usr/bin/env bash

mv ~/.gitconfig ~/.gitconfig.backup
mv ~/.tmux.conf ~/.tmux.conf.backup
mv ~/.vimrc ~/.vimrc.backup

ln -s ~/Developer/dotfiles/gitconfig ~/.gitconfig
ln -s ~/Developer/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/Developer/dotfiles/vimrc ~/.vimrc
