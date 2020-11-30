#!/bin/zsh

usage()
{
    echo "Usage: Deploy.zsh -p PATH -t TARGET"
    echo "PATH where to install the Dot environnement"
    echo "TARGET wich environement you choose between HOME, WORK and MAC"

    exit 1
}

prepare_work()
{
    local deploy_path=$1

    rm -v ~/.bashrc
    ln -fnsv $deploy_path/.bashrc ~/.bashrc
} 

prepare_home()
{
    local deploy_path=$1

    rm -v ~/.zshrc
    ln -fnsv $deploy_path/.zshrc ~/.zshrc

}

clean()
{
    local deploy_path=$1

    rm -vf ~/.vimrc ~/.screenrc ~/.gitconfig ~/.gitignore_global ~/.alacritty.yml ~/.config/procps/toprc\
        && rm -vrf ~/.vim ~/.oh-my-zsh

    rm -rf $deploy_path/.vim $deploy_path/.oh-my-zsh
}

prepare()
{
    local deploy_path=$1

    clean $deploy_path

    ln -fnsv $deploy_path/.vim ~/.vim && \
    ln -fnsv $deploy_path/.vimrc ~/.vimrc && \
    ln -fnsv $deploy_path/.screenrc ~/.screenrc && \
    ln -fnsv $deploy_path/.gitignore_global ~/.gitignore_global && \
    ln -fnsv $deploy_path/.gitconfig ~/.gitconfig && \
    ln -fnsv $deploy_path/.alacritty.yml ~/.alacritty.yml && \
    ln -fnsv $deploy_path/toprc ~/.config/procps/toprc

    if [ $2 = 'work' ]; then
        prepare_work $deploy_path
    elif [ $2 = 'home' -o $2 = 'mac' ]; then
        prepare_home $deploy_path
    fi
}

deploy()
{
    local deploy_path=$1

    git submodule init $deploy_path
    git submodule update $deploy_path

    mkdir -v ~/.vim/autoload
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    
    ln -fnsv $deploy_path/ohmyzsh ~/.oh-my-zsh
    cp -v robbyrussell.zsh-theme-pi $deploy_path/ohmyzsh/themes/robbyrussell.zsh-theme

    ruby -v
    if [ $? -eq 0 ]; then
        cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && \
        ruby extconf.rb > /dev/null && \
        make > /dev/null
    else
        echo "Ruby isn't installed and command-t haven't been configured"
    fi
}


local clean=0
while getopts 'p:t:c?h' c
do
    case $c in
        p) home_path="$OPTARG" ;;
        t) target="$OPTARG" ;;
        c) clean=1 ;;
        h|?) usage ;; esac
done

if [ $clean -ne 0 ]; then
    clean
    exit
else
    [ -z $target ] && usage
    [ -z $home_path ] && usage
fi

prepare "$home_path/$target" "$target"
deploy "$home_path/$target"
