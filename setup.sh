#!/bin/bash

# The MIT License (MIT)
#
# Copyright (c) 2016 Kathrin Hanauer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

create_symlink() {
	SOURCE=$1
	TARGET=$2
	echo -ne "Linking ${SOURCE} as ${TARGET}... "
	if [ -f ${SOURCE} ] && [ ! -f ${TARGET} ]
	then
		ln -s ${SOURCE} ${TARGET}
		if [ $? ]
		then
		  echo "done."
		else
			echo "ERROR!"
		fi
	else
		echo "already exists."
	fi
}


DOTFILES=(bash_aliases bashrc tmux.conf vimrc)

for f in ${DOTFILES[@]}
do
	SOURCE=$(realpath $f)
	TARGET="${HOME}/.$f"
	create_symlink ${SOURCE} ${TARGET}
done

GITPROMPT="bash-git-prompt"
CURDIR=$(pwd)

cd ..
SOURCE="$(pwd)/${GITPROMPT}"
TARGET="${HOME}/.${GITPROMPT}"
ALLOK=1

if [ ! -e ${GITPROMPT} ]
then
	echo "Installing ${GITPROMPT}..."
	git clone https://github.com/magicmonty/bash-git-prompt.git ${GITPROMPT} && ALLOK=0
elif [ -d ${GITPROMPT} ]
then
	echo -e "Updating ${GITPROMPT}..."
	cd ${GITPROMPT} && git pull && ALLOK=0
else
	echo -e "Cannot setup bash-git-prompt."
fi

if [ ${ALLOK} -eq 0 ]
then
	create_symlink ${SOURCE} ${TARGET}
fi

cd ${CURDIR}

