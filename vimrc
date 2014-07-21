syntax on

set nocompatible
set nu
set laststatus=2 ruler showcmd
set visualbell
set list listchars=tab:\ \ ,trail:·

" Remap keys for Dvorak
noremap d h
noremap h j
noremap t k
noremap n l
noremap l n
noremap e d
noremap E D
inoremap hh <ESC>

noremap <C-w>d <C-w>h
noremap <C-w>h <C-w>j
noremap <C-w>t <C-w>k
noremap <C-w>n <C-w>l

" Insert unicode with CTRL-k
inoremap <c-t> <c-k>

" Set Leader and LocalLeader
"let mapleader = "\\"
let maplocalleader = "-"

set textwidth=80

"set linebreak showbreak=+
"set shiftwidth=4 softtabstop=4
"set list listchars=trail:-
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Set Tab Switching
map <C-Tab> gt
map <C-S-Tab> gt

set autoindent
set smartindent

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Packages
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/VimClojure'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'vim-scripts/SyntaxComplete'
""Bundle 'vim-scripts/Auto-Pairs'
Bundle 'tarruda/vim-conque-repl'
Bundle 'vim-scripts/vim-java-sql'
Bundle 'vim-scripts/vim-clojure-sql'
Bundle 'vim-scripts/html_annoyance'
Bundle 'vim-scripts/SudoEdit.vim'
Bundle 'tpope/vim-rails'
" Vim Scripts I would like to try but may have complicated setup
"Bundle 'vim-scripts/VimTAP'
" These two may be mutually exclusive
"Bundle 'vim-scripts/c.vim'
"Bundle 'vim-scripts/VimLite'
"Bundle 'vim-scripts/slimv.vim'
"Bundle 'vim-scripts/unicode.vim'
"Scratch.vim on vim.org/scripts (not setup for pathogen)
"Bundle 'vim-scripts/localvimrc'
"Bundle 'vim-scripts/IndentTab'
"Bundle 'vim-scripts/css3-mod'
"Bundle 'vim-scripts/harlequin'
"Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'vim-scripts/Vim-R-plugin'
"http://www.vim.org/scripts/script.php?script_id=294
"http://www.vim.org/scripts/script.php?script_id=40

" Ruby Setups to try
"http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/
"http://www.vim.org/scripts/script.php?script_id=303
"https://github.com/vim-ruby/vim-ruby

" Vundle is setup, turn filetype back on
filetype plugin indent on

"NERDTree mappings and settings
let NERDTreeMapOpenInTab='y'
let NerdTreeMapOpenInTabSilect='Y'
let NERDTreeMapJumpPrevSibling='<C-T>'
let NERDTreeMapJumpNextSibling='<C-H>'
let NERDChristmasTree=1
nmap <silent> <C-D> :NERDTreeToggle<CR>

"VimClojure Setup
let vimclojure#NailgunClient = "/users/ben/.vim/ng/ng"
"let vimclojure#WantNailgun = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" ConqueTerm is not managed by Vundle - must be manually installed
"ConqueTerm Shortcut
map <C-S-Enter> :ConqueTermSplit bash<CR>
map <a-S-Enter> :ConqueTermVSplit bash<CR>

" Keep Cursor in center of screen
set scrolloff=999

" Set colorscheme last
set background=dark
" Set GUI background
if has("gui_running")
    colorscheme desert
endif
