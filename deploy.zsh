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
    ln -sf $DEPLOY_PATHANDTARGET/.bashrc ~/.bashrc
}

function prepare_home()
{
    ln -sf $DEPLOY_PATHANDTARGET/.zshrc ~/.zshrc
}

function prepare()
{
    DEPLOY_PATHANDTARGET=$1/$2

    cd $DEPLOY_PATHANDTARGET 2> /dev/null

    if [ $? -ne 0 ]; then
        echo "The combo path target doesn't exist"
        exit
    fi

    ln -sf $DEPLOY_PATHANDTARGET/.vim ~/.vim && \
    ln -sf $DEPLOY_PATHANDTARGET/.vimrc ~/.vimrc && \
    ln -sf $DEPLOY_PATHANDTARGET/ohmyzsh ~/.oh-my-zsh

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

    cp ../robbyrussell.zsh-theme-pi ./ohmyzsh/themes/robbyrussell.zsh-theme && \

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
