
help=$(cat <<'heredoc'
\n>>>>>>>>>>>>>>>>>>>>ec1 usage<<<<<<<<<<<<<<<<<<<<\n
h takes one argument with which it filters the bash history
\n<<<<<<<<<<<<<<<<<<<<ec1 usage>>>>>>>>>>>>>>>>>>>>\n
h takes one argument with which it filters the bash history
heredoc
)

if [ "$1" = '-h' ] || [ "$1" = '' ]; then
    echo -e "$help";
else
    history |egrep --color -i $1
fi

#history |egrep --color -i $1


# Project infos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>># {{{
# Project: Epiculture
# Web: www.epiculture.org
# Author: Pierre-Mael Cretinon
# Email: projects2011@3eclipses.com
# License: GNU GPLv3
#
# Notes:
#the usage of the builtin command "history" is disabled inside scripts, don't use the shebang!! :
#http://www.linuxquestions.org/questions/linux-newbie-8/usage-of-history-command-inside-shell-script-688247/
#http://www.tldp.org/LDP/abs/html/special-chars.html
#
# License details:
# <copyright/copyleft>
# Copyright 2010-2011 (c) Pierre-Mael CRETINON <copyleft@pierremael.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# </copyright/copyleft>
# Project infos <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<# }}}
#vim: ft=sh foldmethod=marker
