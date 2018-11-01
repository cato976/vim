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
set spell
set spelllang=en_us

" Set up for vundle
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'


Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'powerline/powerline-fonts'
Plugin 'powerline/powerline'
"Plugin 'vim-syntastic/syntastic'
Plugin 'sjl/badwolf'
Plugin 'rakr/vim-one'
"Plugin 'burnettk/vim-angular'
Plugin 'leafgarland/typescript-vim'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'w0rp/ale'
Plugin 'janko-m/vim-test'
Plugin 'cato976/omnisharp-vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'cato976/vim-spotifysearch'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'neomake/neomake'
call vundle#end()
filetype plugin indent on


" Set up Powerline
if !has("nvim")
    set rtp+=$HOME/.vim/bundle/powerline/powerline/bindings/vim
    set laststatus=2
    set showtabline=2
    set noshowmode
    set encoding=utf-8 
    if has("gui_running")
        set guifont=Inconsolata_for_Powerline:h12i:cANSI
    endif
endif

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog="C:\\Users\\andre\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"

let g:powerline_config_overrides={'common': {'reload_config': 0}}
let g:powerline_pycmd="python3"
let g:powerline_pycmd="py3"    
let g:Powerline_symbols = 'fancy'
let g:Powerline_mode_V="V·LINE"
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

""colorscheme slate
""colorscheme badwolf
"colorscheme one
"highlight Normal ctermfg=grey ctermbg=black
"set background=dark

"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

syntax on

let mapleader = ","
nnoremap <leader>m [{y%
nnoremap <leader>p mm%x`mx
nnoremap <leader>c :Neomake!<CR>

" OmniSharp bindings
nnoremap <leader>rt :OmniSharpRunTests<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
nnoremap <leader>ra :OmniSharpRunAllTest<cr>
nnoremap <leader>rl :OmniSharpRunLastTest<cr>
nnoremap <leader>b :OmniSharpBuildAsync<cr>


" OmniSharp won't work without this setting
filetype plugin on
"let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_host = "http://localhost:2000"
let g:syntastic_cs_checkers = ['code_checker']

let g:OmniSharp_server_path = 'C:\Users\andre\.omnisharp/OmniSharp.exe'
"let g:OmniSharp_server_path = 'C:\WS\Personal_Git\omnisharp-roslyn\bin\Debug\OmniSharp.Http.Driver\net461\OmniSharp.exe'
let g:OmniSharp_port = 2000

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1




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

set background=dark
colorscheme one

if has("autocmd")
    augroup templates
        autocmd BufNewFile *.cs 0r ~/.vim/templates/skeleton.cs | normal! w 
    augroup END
endif

" Spotify
let g:spotify_country_code = 'US'
let g:spotify_playpause_key = "<F10>"
