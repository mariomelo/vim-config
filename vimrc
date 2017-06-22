call plug#begin()
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'
call plug#end()

" Basid Configuration
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
set is
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" Theme options
let g:solarized_termcolors = 256
let g:solarized_bold = 1
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme solarized 
set background=light

" NerdTREE Config
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['node_modules']

" Snippets Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>

" Double Space to open last closed file
nnoremap <Leader><Leader> :e#<CR>

" Space + F to toggle NerdTREE (Current Folder File Tree)
nnoremap <Leader>f :NERDTreeToggle<Enter>
" Space + G to toggle GitGutter (git information)
nnoremap <Leader>g :GitGutterToggle<Enter>
