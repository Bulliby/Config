#!/bin/bash

# ERRORS CODE

E_BADARGS=11
E_BADLOCATION=12
E_MISSING_VAR=13
E_UNAVAILABLE_ENV=14
E_MISSING_DEPENDNCIES=15

set -e

usage()
{
    cat <<UsagePrint
Usage :
    ./deploy.bash [-t target] [-v] [-d] [-h]
    ./deploy.bash [--target target] [--verbose] [--debug] [--help]
    Target :  is optional and can be : home,work or mac and represent 
    the configuration to link in the user's home directory. 
    By default home is selected.
    Verbose : Permit to see what is done at each step
    Debug: Stop on exception and show execution script line by line
    Help : Print this help
UsagePrint

    exit $E_BADARGS
}

options=$(getopt -a -n "$(basename $0)" -l "target:,help,verbose,debug" -- "t:hvd" "$@")

if [ $? -ne 0 ]; then
	usage
fi

eval set --$options

while [ ! -z "$1" ]
do
	case "$1" in
		-t) target="$2"; shift ;;
        -v) verbose=1 ;;
		-h) usage ;;
		-d) debug=1 ;;
		--target) target="$2"; shift ;;
		--help) usage ;;
		--debug) debug=1 ;;
        --verbose) verbose=1 ;;
	esac
	shift
done

close_stderr_stdout()
{
	exec 11>&1 12>&2 1>&- 2>&-     
}

restore_stderr_stdout()
{
	exec 11>&1- 12>&2-     
}

clean()
{
    rm -vf $HOME/{.vimrc,.screenrc,.gitconfig,.gitignore_global,.alacritty.yml,.zshrc,.config/procps/toprc,.bashrc}
    # L'expansion avec les accolad ne semble pas fonctionner pour les dossiers
    rm -vrf "$HOME/.oh-my-zsh" "$HOME/.vim"
}


deploy()
{
    ln -sv $ACTIVE_PATH/.vim $HOME/.vim && \
    ln -sv $ACTIVE_PATH/.vimrc $HOME/.vimrc && \
    ln -sv $ACTIVE_PATH/.screenrc $HOME/.screenrc && \
    ln -sv $ACTIVE_PATH/.gitignore_global $HOME/.gitignore_global && \
    ln -sv $ACTIVE_PATH/.gitconfig $HOME/.gitconfig && \
    ln -sv $ACTIVE_PATH/.alacritty.yml $HOME/.alacritty.yml && \
    ln -sv $ACTIVE_PATH/toprc $HOME/.config/procps/toprc && \
    ln -sv $ACTIVE_PATH/.bashrc $HOME/.bashrc && \
    ln -sv $ACTIVE_PATH/.zshrc $HOME/.zshrc

	git submodule init $ACTIVE_PATH
	git submodule update $ACTIVE_PATH

	curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	ln -snv $ACTIVE_PATH/ohmyzsh $HOME/.oh-my-zsh
	cp -v robbyrussell.zsh-theme-pi $HOME/.oh-my-zsh/themes/robbyrussell.zsh-theme

	ruby -v
	if [ $? -eq 0 ]; then
		cd $HOME/.vim/bundle/command-t/ruby/command-t/ext/command-t && \
		ruby extconf.rb > /dev/null && \
		make > /dev/null
	else
		echo "Ruby isn't installed and command-t haven't been configured"
	fi
}

debug()
{
	set -x
}

if [ ! -f $(basename $0) ]; then
    echo "The current working directory must be the one of deploy.bash"
    usage
    exit $E_BADLOCATION
fi

if [ -z $HOME ]; then
    echo 'No environment variable $HOME'
    exit $E_MISSING_VAR
fi

echo $target
if [[ $target != "home" && $target != "mac" && $target != "work" ]]; then
    echo "Your environment is not available"
    echo 'You have choice between mac,work,home'
    exit $E_UNAVAILABLE_ENV
fi

cat <<'WARNING'
    Be careful all your configuration's file in your home will be supressed and
    taken from my git.
WARNING

echo -n 'Are you sure ? (type "No" to quit) '
read answer

if [[ $answer == "No" ]]; then
    exit 0
fi

# Here we close stdin stdout after have made copy (11,12)
# for restoring them
if [[ $verbose -eq 0 && $debug -ne 1 ]]; then
	close_stderr_stdout
fi

ACTIVE_PATH="$PWD/$target"

if [[ $debug -eq 1 ]]; then
    debug
fi

clean
deploy

if [[ $verbose -eq 1 && $debug -ne 1 ]]; then
    restore_stderr_stdout
fi
