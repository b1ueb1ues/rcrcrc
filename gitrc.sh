#!/bin/bash
cp ~/.config/nvim/init.vim .
cp ~/.mybashrc ./mybashrc
cp ~/.vim/vimrc .
cp ~/.config/nvim/init.vim .
git commit -a -m "script upload"
git push
