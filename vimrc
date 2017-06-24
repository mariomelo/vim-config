call plug#begin()
Plug 'roman/golden-ratio'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
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
let g:gruvbox_termcolors = 256
colorscheme solarized 
colorscheme gruvbox
set background=dark

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
" jj to return to Normal mode
inoremap jj <ESC>
" Use TAB to change Split Panels
nnoremap <TAB> <C-w>w
