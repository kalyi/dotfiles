###########################################################
# Link as: ~/.bash_aliases                                #
###########################################################

# use local vimrc
alias vimlo='vim -u .vimrc'

# attach tmux session if possible, else create new
alias mux='tmux a || tmux'

# count LOC in *.h/*.cpp files in current directory
alias cpplocs='find . -name \*.cpp -o -name \*.h | xargs -n1 cpp -fpreprocessed -P | awk "!/^[{[:space:]}]*$/" | wc -l'
