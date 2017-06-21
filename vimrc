call plug#begin()
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
call plug#end()

" Basic Configuration
filetype plugin indent on
syntax enable
set guifont=Menlo\ Regular:h18
set colorcolumn=120
set number
set hidden
set history=100
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set noshowmode
set laststatus=2

" Theme options
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized 

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Double Space to open last closed file
nnoremap <Leader><Leader> :e#<CR>

