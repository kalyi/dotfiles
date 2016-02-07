###########################################################
# Link as: ~/.bash_aliases                                #
###########################################################

alias mux='tmux a || tmux'
alias cpplocs='find . -name \*.cpp -o -name \*.h | xargs -n1 cpp -fpreprocessed -P | awk "!/^[{[:space:]}]*$/" | wc -l'
