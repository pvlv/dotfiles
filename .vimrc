call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'flazz/vim-colorschemes'

call plug#end()

filetype plugin on

set number
set hlsearch
set incsearch

" Colorscheme
set t_Co=256
syntax enable
colorscheme spacegray

" vim-airline
" let g:airline#extensions#tabline#enabled = 1

" Indentline
" http://terminal-color-builder.mudasobwa.ru/
let g:indentLine_color_term = 238
let g:indentLine_char ='|'
" convert tab to space
" http://stackoverflow.com/a/1878984
set tabstop=2
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

let g:vim_json_syntax_conceal = 0

" mappings
" nerdtree
map <C-n> :NERDTreeToggle<CR>