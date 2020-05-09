#!/bin/bash

usage()
{
    echo "Usage: Deploy.zsh -p PATH  -t TARGET"
    echo "PATH where to install the Dot environnement"
    echo "TARGET wich environement you choose between HOME and WORK"
    exit 2
}

set_variable()
{
    local varname=$1
    shift
    if [ -z "${!varname}" ]; then
        eval "$varname=\"$@\""
    else
        echo "Error: $varname already set"
        usage
    fi
}

function prepare_work()
{
    rm ~/.bashrc
    ln -s $DEPLOY_PATHANDTARGET/.bashrc ~/.bashrc
}

function prepare_home()
{
    rm ~/.zshrc
    ln -s $DEPLOY_PATHANDTARGET/.zshrc ~/.zshrc
}

function prepare()
{
    DEPLOY_PATHANDTARGET=$1/$2

    if [ $? -ne 0 ]; then
        echo "The combo path target doesn't exist"
        exit
    fi

    rm -rf ~/.vimrc ~/.vim ~/.screenrc ~/.oh-my-zsh ~/.gitconfig ~/.gitignore_global

    ln -sv $DEPLOY_PATHANDTARGET/.vim ~/.vim && \
    ln -sv $DEPLOY_PATHANDTARGET/.vimrc ~/.vimrc && \
    ln -sv $DEPLOY_PATHANDTARGET/.screenrc ~/.screenrc && \
    ln -sv $DEPLOY_PATHANDTARGET/ohmyzsh ~/.oh-my-zsh
    ln -sv $DEPLOY_PATHANDTARGET/.gitignore_global ~/.gitignore_global
    ln -sv $DEPLOY_PATHANDTARGET/.gitconfig ~/.gitconfig
    ln -sv $DEPLOY_PATHANDTARGET/ohmyzsh ~/.oh-my-zsh

    if [ $2 = 'work' ]; then
        prepare_work
    elif [ $2 = 'home' ]; then
        prepare_home
    fi
}

function deploy()
{
    git submodule init $DEPLOY_PATHANDTARGET
    git submodule update $DEPLOY_PATHANDTARGET

    cp -v robbyrussell.zsh-theme-pi $DEPLOY_PATHANDTARGET/ohmyzsh/themes/robbyrussell.zsh-theme && \

    cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && \
    ruby extconf.rb > /dev/null && \
    make > /dev/null

    if [ $? -ne 0 ]; then
        echo "The depoy function failed"
    fi
}

while getopts 'p:t:?h' c
do
    case $c in
        p) set_variable DEPLOY_PATH $OPTARG ;;
        t) set_variable DEPLOY_TARGET $OPTARG ;;
        h|?) usage ;; esac
done

[ -z "$DEPLOY_PATH" ] && usage
[ -z "$DEPLOY_TARGET" ] && usage

prepare $DEPLOY_PATH $DEPLOY_TARGET
deploy
