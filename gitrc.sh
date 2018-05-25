#!/bin/bash
cp ~/.config/nvim/init.vim .
cp ~/.mybashrc .
cp ~/.vim/vimrc .
git commit -a -m "script upload"
git push
