#!/bin/bash
p=`dirname $0`
cd $p
cp ~/.config/nvim/init.vim .
cp ~/.mybashrc ./mybashrc
cp ~/.vim/vimrc .
git commit -a -m "script upload"
git push
