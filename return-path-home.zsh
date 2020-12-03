# **************************************************************************** #
#                                                                              #
#                                                                              #
#    return-path-home.zsh                                                      #
#                                                         ________             #
#    By: bulliby <wellsguillaume+at+gmail.com>           /   ____/_  _  __     #
#                                                       /    \  _\ \/ \/ /     #
#    Created: 2020/12/03 23:40:05 by bulliby            \     \_\ \     /      #
#    Updated: 2020/12/04 00:10:34 by bulliby             \________/\/\_/       #
#                                                                              #
# **************************************************************************** #

#Replace the Home part of the given path `1` by a Tilde
putTilde()
{
    echo "${1/$HOME/~}"
}
