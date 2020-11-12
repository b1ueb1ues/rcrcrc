#!/bin/bash
p=`dirname $0`
cd $p
if [ ! -e ~/.vim ]; then
    cp -r vimfile ~/.vim
    mkdir ~/.vim/undo
    mkdir ~/.vim/swp
fi
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
cp ./mybashrc ~/.mybashrc
cp ./vimrc ~/.vim/vimrc
