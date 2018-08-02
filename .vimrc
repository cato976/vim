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
"set cursorline
set scrolloff=999

" Set up for vundle
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'


Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'powerline/powerline-fonts'
"Plugin 'vim-syntastic/syntastic'


call vundle#end()
filetype plugin indent on


" Set up Powerline
set rtp+=$HOME/appdata/roaming/python/python27/site-packages/powerline/bindings/vim/
set laststatus=2
set showtabline=2
set noshowmode
set encoding=utf-8 
"set fillchars+=stl:\ ,stlnc:\
"set guifont=Liberation_Mono_for_Powerline:h10
if has("gui_running")
    set guifont=Inconsolata_for_Powerline:h12i:cANSI
endif
"set guifont=Consolas\ for\ Powerline\ FixedD:h10:cANSI
set t_Co=256

"
"let g:powerline_pycmd="python"
"let g:powerline_pycmd="py"    
let g:Powerline_symbols = 'fancy'
"let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"


"Set up syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"

" Tweaks for browser
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_list_hide=netrw_gitignore#Hide()
augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * :Vexplore
augroup END


" set listchars=space:·
" set list

"colorscheme slate

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
"call plug#begin('~/.vim/plugged')
"Plug 'https://github.com/4Evergreen4/vim-hardy.git'
"call plug#end()
