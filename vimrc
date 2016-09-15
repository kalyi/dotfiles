"
" Link as: ~/.vimrc
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
filetype on
set number
set nocompatible

set background=dark
colorscheme solarized

set tabstop=2
set noexpandtab
set shiftwidth=2

" copy indent from previous line
set autoindent
" disable cindent/smartindent
set nocindent
set noautoindent

" window splitting behavior
set splitright
set splitbelow

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
autocmd FileType tex setlocal indentexpr=

" povray
autocmd BufEnter *.pov nmap <F5> :w<CR> :!povray +P +W800 +H600 %<CR>
autocmd BufEnter *.pov nmap <F6> :w<CR> :!povray -P +W600 +H480 Initial_Frame=1 Final_Frame=50 %<CR>

" solarized
call togglebg#map("<F7>")


