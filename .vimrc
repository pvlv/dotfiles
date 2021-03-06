call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'scrooloose/nerdcommenter'
" Plug 'tpope/vim-entary'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'scss', 'json'] }
Plug 'luochen1990/rainbow'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'jlanzarotta/bufexplorer'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-surround'
"plug 'svermeulen/vim-cutlass'
"Plug 'svermeulen/vim-yoink'

call plug#end()

filetype plugin on

set number
set hlsearch
set incsearch

colorscheme Tomorrow-Night-Eighties 
let mapleader=" "
inoremap jj <esc>

" comfortabel-motion
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" prettier
let g:prettier#config#single_quote = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md, PrettierAsync

" ctrlp
set wildignore+=*/node_modules/*

" rainbow
let g:rainbow_active = 1

let g:indentLine_color_term = 238
let g:indentLine_char ='|'

" convert tab to space
" http://stackoverflow.com/a/1878984
set tabstop=2
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

let g:vim_json_syntax_conceal = 0

" NERDTree
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden=1

" Mappings

set clipboard=unnamed

nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" Easymotion
vmap <C-c> "*y     " Yank current selection into system clipboard
nmap <C-c> "*Y     " Yank current line into system clipboard (if nothing is selected)
nmap <C-v> "*p     " Paste from system clipboard

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" NERDTree
map <Leader>b :NERDTreeToggle<CR>
