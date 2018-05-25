#!/bin/bash
cp ~/.config/nvim/init.vim .
cp ~/.mybashrc ./mybashrc
cp ~/.vim/vimrc .
git commit -a -m "script upload"
git push
