"
" Link as: ~/.vimrc
"

syntax on
filetype on
set number
set nocompatible

set background=dark

set tabstop=2
set noexpandtab
set shiftwidth=2
set smartindent
set smarttab
set autoindent

" Highlighting
" TODO
highlight MyTodo ctermbg=green guibg=green
match MyTodo /\ctodo/

" FIXME 
highlight MyFixme ctermbg=red guibg=red
2match MyFixme /\cfixme/
" "call matchadd('MyFixme', '/FIXME\|Fixme\|fixme/')
call matchadd('MyFixme', '\s\+$')

" uppercase current word
inoremap <c-u> <esc>viwU<esc>i

filetype indent plugin on

" bash
autocmd FileType sh vmap ,mc !boxes -d shell<CR>
autocmd FileType sh vmap ,xc !boxes -d shell -r<CR>

" vim
autocmd FileType vim vmap ,mc !boxes -d vim-cmt<CR>
autocmd FileType vim vmap ,xc !boxes -d vim-cmt -r<CR>

" python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" qt/qml
autocmd BufNewFile,BufRead *.qs set filetype=javascript

" latex
autocmd BufNewFile,BufRead *.cls set filetype=tex
autocmd BufNewFile,BufRead *.lco set filetype=tex
autocmd FileType tex vmap ,mc !boxes -d tex<CR>
autocmd FileType tex vmap ,xc !boxes -d tex -r<CR>

" povray
autocmd BufEnter *.pov nmap <F5> :w<CR> :!povray +P +W800 +H600 %<CR>
autocmd BufEnter *.pov nmap <F6> :w<CR> :!povray -P +W600 +H480 Initial_Frame=1 Final_Frame=50 %<CR>
