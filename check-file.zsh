# **************************************************************************** #
#                                                                              #
#                                                                              #
#    check-file.zsh                                                            #
#                                                         ________             #
#    By: bulliby <wellsguillaume+at+gmail.com>           /   ____/_  _  __     #
#                                                       /    \  _\ \/ \/ /     #
#    Created: 2020/12/03 23:24:33 by bulliby            \     \_\ \     /      #
#    Updated: 2020/12/04 00:10:19 by bulliby             \________/\/\_/       #
#                                                                              #
# **************************************************************************** #

#!/bin/zsh
		tott

source ./return-path-home.zsh

if [ ! -f $1 ]; then
	echo "$1 is not present, you can create $(putTilde "$(pwd)")/$1"
	exit 1
fi

while read -r line
do
	if [ -f "$HOME/$line" ]; then
		echo "Some file requested to be created already exist use -f to force"
	fi
done < $1
