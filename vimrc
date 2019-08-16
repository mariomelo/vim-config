" Instalao vim-plug automaticamente
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin()
if !&diff
  Plug 'roman/golden-ratio'
endif
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-startify'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'gcmt/taboo.vim'
Plug 'w0rp/ale'
Plug 'tmhedberg/matchit'
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'liuchengxu/vista.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Elixir
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'tpope/vim-endwise'

call plug#end()

" Basic Configuration
set nocompatible
filetype plugin indent on
syntax enable
set guifont=Menlo\ Regular:h16
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
set wildignore+=*/tmp/*,*.so,*.swp,*.pdf,*.zip,*/node_modules/*,*/build/*,*/dist/*
let g:jsx_ext_required = 0

" Configuring Folds
set foldmethod=indent
set foldnestmax=3
set foldlevel=1

" ALE
let g:ale_completion_enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
nnoremap <Leader>j :ALENext<CR>
nnoremap <Leader>k :ALEPrevious<CR>

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Elixir
let g:ale_elixir_elixir_ls_release = '/Users/melomario/.elixir/elixir-ls/release'
" let g:mix_format_on_save = 1

" Javascript autoformat
let g:ale_fixers = {}
let g:ale_linters = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['graphql'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fixers['html.eex'] = ['prettier']
let g:ale_fixers['eex'] = ['prettier']
let g:ale_fixers['elixir'] = ['mix_format']
let g:ale_linters['elixir'] = ['elixir-ls', 'credo']
let g:ale_linters['exs'] = ['elixir-ls', 'credo']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--trailing-comma --no-semi --no-bracket-spacing
      \ --single-quote --jsx-bracket-same-line --print-width 120'
     
" Theme options
set termguicolors
colorscheme gruvbox-material
let g:one_allow_italics = 1
hi def link jsObjectKey Label

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_monokai'

" Salva as abas na sessão
set sessionoptions+=tabpages,globals

" Keyboard Shortcuts
let mapleader=" "
map <leader>s :source ~/.vim/vimrc<CR>
map <leader>S :e ~/.vim/vimrc<CR>

" Double Space to open last closed file
nnoremap <Leader><Leader> :e#<CR>

" CTRL+P open FZF
nnoremap <C-p> :FZF<CR>

" Space + G to toggle GitGutter (git information)
nnoremap <Leader>g :GitGutterToggle<Enter>
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '>>'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '--'
" jj to return to Normal mode
inoremap jj <ESC>l
" jk to return to Normal Mode and save file
inoremap jk <ESC>:w<CR>
nnoremap <Leader>h :nohl<CR>
" Use TAB to change Split Panels
nnoremap <TAB> <C-w>w
" Use prettier to format Javascript code with gp
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>

" ALE Config

" Custom commands
command! Dark execute "colorscheme base16-materia"
command! Light execute "colorscheme base16-google-light"
command! Mocha execute "colorscheme base16-mocha"
command! Ocean execute "colorscheme OceanicNext"

" Find and Replace
nnoremap <Leader>f :vimgrep /
nnoremap <Leader>r :%s/
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>

"Copy to Clipboard
nnoremap <Leader>c "+y

" Search Definitions, Warnings and Errors
nnoremap <Leader>p :Vista finder<CR>
nnoremap <Leader>e :ALENext<CR>
nnoremap <Leader>E :ALEPrevious<CR>
nnoremap <Leader>d :ALEGoToDefinition<CR>

"VimDiff configuration
"" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

set cmdheight=1
set shortmess+=c
set noruler

" === Vim airline ==== "
" Enable extensions
try
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '❮'
let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

set noswapfile

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]


let g:vista_default_executive = 'ale'
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

let g:vista_fzf_preview = ['right:50%']
