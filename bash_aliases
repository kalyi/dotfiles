###########################################################
# Link as: ~/.bash_aliases                                #
###########################################################

# use local vimrc
alias vimlo='vim -u .vimrc'

# attach tmux session if possible, else create new
mux() {
if [ -z "$1" ]
then
	tmux a || tmux
else
	tmux a -t $1 || tmux new -s $1
fi
}

# count LOC in *.h/*.cpp files in current directory
alias cpplocs='find . -name \*.cpp -o -name \*.h | xargs -n1 cpp -fpreprocessed -P | awk "!/^[{[:space:]}]*$/" | wc -l'
