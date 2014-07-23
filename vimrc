" Vundle Setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-dispatch'
let g:ctrlp_extensions = ['funky']
Plugin 'lilydjwg/colorizer'
" Plugins in testing (mostly from vimified)
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
"Plugin 'maxbrunsfeld/vim-yankstack' " This plugin breaks re-mapping d
Plugin 'tpope/vim-eunuch'
Plugin 'tsaleh/vim-align' " TODO - create appropriate mappings!
Plugin 'tpope/vim-endwise'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'wavded/vim-stylus'
Plugin 'kchmck/vim-coffee-script'
Plugin 'alfredodeza/jacinto.vim'
Plugin 'Twinside/vim-syntax-haskell-cabal'
Plugin 'lukerandall/haskellmode-vim'
call vundle#end()
filetype plugin indent on

" Turn on powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Always show status line
set laststatus=2 

" Show current position in the document
set ruler

" Show command information
set showcmd

" Don't make annoying bell sounds when scrolling too far
set visualbell

" Always enable the mouse
set mouse=a

" Use 4 space soft tabs by default
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Filetype  specific settings - should probably be moved into their own files
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

" Automatically and intelligently indent files
set autoindent
set smartindent

" Assume that we will be running against a dark terminal background
set background=dark
" Set GUI background
if has("gui_running")
    colorscheme desert
    set guifont=Meslo\ LG\ S\ for\ Powerline:h11 
endif

" Make backspace work as expected on certain systems
set backspace=indent,eol,start

" Keep the cursor in the middle of the screen
set scrolloff=999

" Turn on syntax highlighting
syntax on

" Key Bindings
let mapleader = "-"
" Remap keys for Dvorak
noremap d h
noremap h gj
noremap t gk
vnoremap h gj
vnoremap t gk
noremap n l
noremap N L
noremap l n
noremap L n
noremap e d
noremap E D
" 'till moves to bottom row from standard QWERTY position
noremap k t
noremap K T
" End move down one from standard Dvorak position
noremap j e
noremap J E
" Join lines stays in the same locations
noremap H J
" Help (K) and screen top (H) are left unmapped
" A more economical mapping would probably be
" d->h->j-t->k->, n->l->, but I was already accustomed to
" keeping delete in the same place (e/E).

" Quick escaping
inoremap hh <ESC>

" Split Editor Movements
noremap <C-w>h <C-w>j
noremap <C-w>d <C-w>h
noremap <C-w>t <C-w>k
noremap <C-w>n <C-w>l
"Use XMonad-like movement - This interferes with jump-to-symbol in
"YouCompleteMe...
noremap <C-h> <C-w>w
noremap <C-t> <C-w>W

" Autocomplete Movement Keys
inoremap <expr> <C-h> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <C-t> ((pumvisible())?("\<C-p>"):("k"))

"Set Tab Switching
map <C-Tab> gt
map <C-S-Tab> gT


" NERDTree mappings and settings
let NERDTreeMapOpenInTab='y'
let NERDTreeMapOpenInTabSilent='Y'
let NERDTreeMapJumpPrevSibling='<C-T>'
let NERDTreeMapJumpNextSibling='<C-H>'
let NERDChristmasTree=1
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Dispatch setup
map <f5> :Make<CR><CR>

" YouCompleteMe Setup
"play nice with eclim
let g:EclimCompletionMethod = 'omnifunc'

" Additional Tweaks - Mostly Stolen from vimified

" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>


set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set showbreak=↪

" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

