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
filetype plugin indent on
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

" A few keyboard shortcuts for freq functions
:map <C-a> GVgg
:map <C-i> maGVgg='a$
:map <C-d> Vyp$
:map <CR> o<Esc>

"Syntax highlighting for txt files
au BufReadPost *.txt set syntax=txt

