set hlsearch
set incsearch
set nocompatible
set tabstop=8
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set number
set relativenumber
set cursorline


" set listchars=space:·
" set list

colorscheme slate

let mapleader = ","
nnoremap <leader>m [{y%
nnoremap <leader>p mm%x`mx

" File name autocomplete
set path+=**

" Show file options above the commanc line
set wildmenu

" Set the working directory to wherever the open file lives
set autochdir

" Set path for Arduino
let g:hardy_arduino_path = 'C:\Program Files (x86)\Arduino\arduino_debug.exe'
"let g:hardy_window_name = '___MY_Arduino_Window___'
"let g:hardy_arduino_options = '.\template.ino'
let g:hardy_window_size = 15

" Specify a directoty for plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/4Evergreen4/vim-hardy.git'
call plug#end()
