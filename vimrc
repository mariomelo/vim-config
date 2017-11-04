call plug#begin()
"Plug 'jelera/vim-javascript-syntax'
Plug 'roman/golden-ratio'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'kien/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'gcmt/taboo.vim'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

" Basic Configuration
set nocompatible
filetype plugin indent on
syntax enable
set guifont=Menlo\ Regular:h18
set colorcolumn=80
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.css
let g:jsx_ext_required = 0

" MuComplete Config
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt=longest,menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#buffer_relative_paths = 1
let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni', 'keyn', 'dict', 'uspl', 'ulti'],
    \ 'vim'     : ['path', 'cmd', 'keyn']
 \ }

" Javascript autoformat
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--trailing-comma --no-semi --no-bracket-spacing
      \ --single-quote --jsx-bracket-same-line --print-width 120'
     
" Theme options
let g:gruvbox_termcolors = 256
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi def link jsObjectKey Label

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" Salva as abas na sessão
set sessionoptions+=tabpages,globals

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>
map <leader>S :e ~/.vim/vimrc<CR>

" Double Space to open last closed file
nnoremap <Leader><Leader> :e#<CR>

"Avoid keymap duplicates
nnoremap <C>@ <Plug>MuComplete

" Space + G to toggle GitGutter (git information)
nnoremap <Leader>g :GitGutterToggle<Enter>
" jj to return to Normal mode
inoremap jj <ESC>l
" jk to return to Normal Mode and save file
inoremap jk <ESC>:w<CR>
" Use TAB to change Split Panels
nnoremap <TAB> <C-w>w
" Use prettier to format Javascript code with gp
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>

" Custom commands
command! Dark execute "set background=dark"
command! Light execute "set background=light"
