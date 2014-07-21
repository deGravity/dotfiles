syntax on

set nu
set nocompatible
set laststatus=2 ruler showcmd

" Turn on mouse support in all modes
set mouse=a

" Remap keys for Dvorak
" Only movement and delete are remapped
noremap d h
noremap h j
noremap t k
noremap n l
noremap l n
noremap e d
noremap E D

" Autocomplete Movement Keys
inoremap <expr> <C-h> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-t> ((pumvisible())?("\<C-p>"):("k"))

" Split Editor Movements
noremap <C-w>h <C-w>j
noremap <C-w>d <C-w>h
noremap <C-w>t <C-w>k
noremap <C-w>n <C-w>l
"noremap <C-w>l <C-w>n
"Bind for easy normal mode
inoremap hh <ESC>

"Activate Make wrapper with f5
map <f5> :Make<CR><CR>

"Backspace fix
set backspace=indent,eol,start

" Insert unicode with CTRL-k
" inoremap <c-t> <c-k>

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

set background=dark
" Set GUI background
if has("gui_running")
    colorscheme desert
endif

"Set Tab Switching
map <C-Tab> gt
map <C-S-Tab> gt

set autoindent
set smartindent

" Setup Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Plugins and configuration

"delimitMate auto-completes quotes, braces, etc.
Bundle 'Raimondi/delimitMate'
let delimitMate_excluded_ft = "vimrc,txt"
let delimitMate_jump_expansion = 1


" Vundle Packages
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive.git'
"Bundle 'vim-scripts/VimClojure'
Bundle 'scrooloose/nerdtree'
""Bundle 'git://git.wincent.com/command-t.git'
"Bundle 'tpope/vim-rails'
""Bundle 'vim-scripts/Conque-Shell'
""Buldle 'vim-scripts/slimv.vim'
"Bundle 'tpope/vim-git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'tfnico/vim-gradle'
""Fuzzy Matching and plugins
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
"Bundle 'skammer/vim-css-color'
Bundle 'lilydjwg/colorizer'
Bundle 'tpope/vim-dispatch'
Bundle 'derekwyatt/vim-scala'
let g:ctrlp_extensions = ['funky']

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
let vimclojure#NailgunClient = "/users/bjones/.vim/ng/ng"
let vimclojure#WantNailgun = 1
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

"ConqueTerm Setup

map <C-S-Enter> :ConqueTermSplit bash <CR>
let g:ConqueTerm_Color = 1

"Eclim Setup

set scrolloff=999
