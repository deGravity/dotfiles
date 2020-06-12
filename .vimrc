set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-fugitive.git'
"Plugin 'gregsexton/gitv'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'hsanson/vim-android'
Plugin 'kien/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'tpope/vim-dispatch'
" Plugin 'tpope/vim-jdaddy' " May need bindings.

" Color Schemes
Plugin 'adlawson/vim-sorcerer'
Plugin 'altercation/vim-colors-solarized'
Plugin 'blueshirts/darcula'
Plugin 'tomasr/molokai'

" Syntax Highlighters
"Plugin 'derekwyatt/vim-scala'
call vundle#end()

:command! Vimrc execute "vsplit ~/.vimrc"
:command! Resource execute "source ~/.vimrc"
:command! Rebundle execute "source ~/.vimrc | BundleInstall"

" Turn filetype back on now that Vundle is done
filetype plugin indent on
filetype on

set laststatus=2
set ruler
set showcmd
set visualbell

set mouse=a

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nu

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

set autoindent
set smartindent

colorscheme darcula
set background=dark
if has("gui_running")
    colorscheme desert
endif

set backspace=indent,eol,start

syntax on

let mapleader = "-"
" Basic Movement
noremap d h
noremap h gj
noremap t gk
vnoremap h gj
vnoremap t gk

" Correcting for  movement displacements
noremap n l
noremap N L
noremap l n
noremap L N
noremap e d
noremap E D
noremap k t
noremap K T
noremap j e
noremap J E
noremap H J

" Easy normal mode
inoremap hh <ESC>

" Movement keys for windows
noremap <C-w>h <C-w>j
noremap <C-w>d <C-w>h
noremap <C-w>t <C-w>k
noremap <C-w>n <C-w>l

" Cycle through windows xmonad style
noremap <C-h> <C-w>w
noremap <C-t> <C-w>W

" Window cycling map breaks ctags, so remap
" going back through ctags
noremap <leader>t <C-t>
"noremap <C-[> <C-t>

map <C-Tab> gt
map <C-S-Tab> gT

let NERDTreeMapOpenInTab='y'
let NERDTreeMapOpenInTabSilent='Y'
let NERDTreeMapJumpPrevSibling='<C-T>'
let NERDTreeMapJumpNextSibling='<C-H>'
let NERDChristmasTree=1
nmap <silent> <C-D> :NERDTreeToggle<CR>

vnoremap <leader>yo "*y
nnoremap <leader>po "*p

noremap <silent><Leader>/ :nohls<CR>

command! W :w

cnoremap <c-a> <home>
cnoremap <c-e> <end>

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

nnoremap <space> za
vnoremap <space> za

nnoremap z0 zCz0

nnoremap <leader>z zMzvzz

" Ctrl-P Bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Functions w/out ctags in Ctrl-P
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1


" Required for javacomplete2
autocmd FileType java set omnifunc=javacomplete#Complete
imap <F4> <Plug>(Java-Complete-Imports-Add)
imap <F4> <Plug>(Java-Complete-Imports-RemoveUnused)
nmap <F4> <Plug>(Java-Complete-Imports-Add)
nmap <F4> <Plug>(Java-Complete-Imports-RemoveUnused)

" Required for vim-android
let g:android_sdk_path = '/Users/ben/Library/Android/sdk'
let g:gradle_path = '/usr/local/bin/gradle'

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) -len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
