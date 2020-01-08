#!/bin/zsh

git submodule init
git submodule update

cp robbyrussell.zsh-theme-pi ./ohmyzsh/themes/robbyrussell.zsh-theme

#Compile command-t 
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make
