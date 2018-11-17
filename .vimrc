" ======= For Vundle plugin ========
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'nixon/vim-vmath'
Plugin 'pseewald/vim-anyfold'
Plugin 'arecarn/vim-fold-cycle'

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
" ======= For Vundle plugin ========


" Ensure correct syntax highlighting and auto-indentation for Fortran free-form
" source code.
let fortran_free_source=1
let fortran_do_enddo=1
syntax on

" Turn on line numbers and row/column numbers.
set nu
set ruler

" Make vim echo commands as they are being entered.
set showcmd

" Set tabstops to two spaces and ensure tab characters are expanded into
" spaces.
set smarttab
set expandtab
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2

" Fix backspace key.
set bs=2

" Set up searching so that it jumps to matches as the word is being entered and
" is case-insensitive.
set incsearch
set ignorecase
set smartcase
set hlsearch

" Insert mode already shown in status bar
set noshowmode

" Configuration for lightline plugin
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

" To avoid typos
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" --------------------------------------------------
" A few keyboard shortcuts for freq functions

" Ctrl-A to select all
:map <C-a> GVgg

" Ctrl+I to auto-indent all
:map <C-i> maGVgg='a$

" Ctrl+d to duplicate line
:map <C-d> Vyp$

" Enter for a newline in normal mode
:map <CR> o<Esc>

" Space for a space in normal mode
:noremap <Space> i<Space><Right><Esc>

" Shift+Y to yank whole line
:map <S-y> <C-v>$y<Esc>

" Ctrl+S to save
:map <C-s> <Esc>:w<CR>

" Ctrl+W to shift between split windows 
:map <C-w> <C-W><C-W>  

" Shift+D to duplicate what lies before cursor
:map <S-d> d$

" Ctrl+Right for w
:map <C-Right> w

" Ctrl+Right for b
:map <C-Left> b

" --------------------------------------------------

"Syntax highlighting for txt files
au BufReadPost *.txt set syntax=txt

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

let g:ycm_seed_identifiers_with_syntax = 1

"highlight! link DiffText MatchParen


"kymaps for vim-vmath plugin
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

hi Search ctermbg=LightYellow

"Use code folding
let anyfold_activate=1
set foldlevel=3

"Use Tab for fold cycling
nmap <S-Tab> za

" Use better colours for folds
highlight Folded ctermfg=Gray ctermbg=NONE
highlight FoldColumn ctermfg=NONE ctermbg=NONE

" Save folds
"augroup AutoSaveFolds
"  autocmd!
"  autocmd BufWinLeave * mkview
"  autocmd BufWinEnter * silent loadview
"augroup END
