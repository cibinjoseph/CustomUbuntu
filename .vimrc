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
Plugin 'ycm-core/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
" Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'nixon/vim-vmath'
Plugin 'pseewald/vim-anyfold'
Plugin 'arecarn/vim-fold-cycle'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-python/python-syntax'
Plugin 'Vimjas/vim-python-pep8-indent'
" Plugin 'rudrab/vimf90'
" Plugin 'rsmenon/vim-mathematica'
Plugin 'tomtom/tcomment_vim'
" Plugin 'python-mode/python-mode'
Plugin 'vim-syntastic/syntastic'
Plugin 'rickhowe/diffchar.vim'
" Plugin 'mattn/emmet-vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'preservim/nerdtree'

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

" Light appears to work well with terminator solarized
set background=light

" Ensure correct syntax highlighting and auto-indentation for Fortran free-form
" source code.
let fortran_free_source=1
let fortran_do_enddo=1
syntax on

if has("autocmd")
  au BufNewFile,BufRead *.nml set filetype=fortran
  au BufNewFile,BufRead *.namelist set filetype=fortran
endif

if has("autocmd")
  au BufNewFile,BufRead *.jl set filetype=julia
endif

" Turn on line numbers and row/column numbers.
set nu
set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Make vim echo commands as they are being entered.
set showcmd

" Set tabstops to two spaces and ensure tab characters are expanded into
" spaces.
" set cursorline
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

"Syntax highlighting for txt files
"au BufReadPost *.txt set syntax=txt

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {}

"highlight! link DiffText MatchParen


"kymaps for vim-vmath plugin
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap        ++ vip++

hi Search ctermbg=yellow
hi Search ctermfg=black

"Use code folding
autocmd FileType * AnyFoldActivate
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
"
" --------------------------------------------------
" A few keyboard shortcuts for freq functions

" Ctrl-A to select all
:map <C-a> GVgg

if !(&ft=='py')
  " Ctrl+I to auto-indent all
  :map <C-i> mtGVgg='t$

  " Tab to auto-indent visible part
  :map <Tab> mt<S-h><S-v><S-l>='t$
endif

" Ctrl+d to duplicate line
:map <C-d> Vyp$

" Enter for a newline in normal mode
autocmd VimEnter * map <CR> o<Esc>

" Space for a space in normal mode
:noremap <Space> i<Space><Right><Esc>

" Shift+Y to yank whole line
:map <S-y> <C-v>$y<Esc>

" Shift+D to duplicate what lies before cursor
:map <S-d> d$

" Ctrl+Right for w
:map <C-Right> w

" Ctrl+Right for b
:map <C-Left> b

" Map Shift++ to increment numbers
:map <S-Up> <C-a>

" Map Shift+- to decrement numbers
:map <S-Down> <C-x>

" Map Shift+Q to clear search highlighting
:nnoremap <S-Q> :noh<CR>

" Map F2 to run scripts
autocmd FileType python nnoremap <buffer> <F2> :exec '!clear; python' shellescape(@%, 1)<cr>
autocmd FileType matlab nnoremap <buffer> <F2> :exec '!clear; octave' shellescape(@%, 1)<cr>
autocmd FileType asy nnoremap <buffer> <F2> :exec '!clear; asy' shellescape(@%, 1)<cr>
" --------------------------------------------------
" Python environment
au BufNewFile,BufRead *.py
      \ set tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ textwidth=79
      \ expandtab
      \ autoindent
      \ fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
let python_highlight_all = 1

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<C-Down>"
let g:UltiSnipsJumpForwardTrigger="<S-f>"
let g:UltiSnipsJumpBackwardTrigger="<S-b>"

" C++ style syntax highlighting for vspscript
autocmd BufEnter *.vspscript :setlocal filetype=cpp

" Syntastic settings
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2                             " always show statusbar
set statusline+=%-10.3n\                     " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️'

" Ignore errors of not finding modules
let g:syntastic_quiet_messages = { 'regex': "Can't.open.module.file"}

" To fix strange characters at the bottom being displayed
let &t_TI = ""
let &t_TE = ""

" Asymptote syntax highlighting
augroup filetypedetect
  au BufNewFile,BufRead *.asy     setf asy
augroup END

let g:ycm_language_server = [
			\   {
			\     'name': 'julia',
			\     'filetypes': [ 'julia' ],
			\     'project_root_files': [ 'Project.toml' ],
			\	'cmdline': ['julia', '--startup-file=no', '--history-file=no', '-e', '
			\       using LanguageServer;
			\       using Pkg;
			\       import StaticLint;
			\       import SymbolServer;
			\       env_path = dirname(Pkg.Types.Context().env.project_file);
			\
			\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
			\       server.runlinter = true;
			\       run(server);
			\   ']
			\  },
			\ ]

" Disable auto-commenting of following line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
