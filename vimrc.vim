" origin vim configs
set number
set list
set listchars+=space:·
" set listchars=tab:>-,trail:.,extends:>,precedes:<
set clipboard+=unnamed
" set paste
set laststatus=2
set ruler
set expandtab
set tabstop=2
set shiftwidth=2
set copyindent
set nobackup
set nowb
set noswapfile
set backspace=indent,eol,start
set guioptions=
set wmh=0
" set wmw=0
set ignorecase
filetype plugin indent on
filetype plugin on

let NERDTreeHijackNetrw = 0


let g:elm_setup_keybindings = 1
set shell=zsh\ -l
let g:elm_format_autosave = 1
" set hlsearch
set incsearch 
set viminfo='100,n$HOME/.vim/files/info/viminfo
" vim-gutter
set updatetime=100

" theme
set background=dark
syntax enable
colorscheme gruvbox

let mapleader = ","
let maplocalleader = ","

" ignore for t-command plugin
" set wildignore+=*/node_modules/**
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nmap <silent> <leader>nt :NERDTreeToggle<cr>
nmap <silent> <leader>nf :NERDTreeFocus<cr>
nmap <leader>nb :NERDTreeFromBookmark<Space>
nmap <leader>ns :NERDTreeFind<Space>

let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" shortcut mapping
map <C-L> <C-W>l<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_
map <silent> <C-c> :close<cr>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
inoremap jk <Esc>
noremap <silent> <F4> :set hlsearch! hlsearch?<CR>

" ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:startify_session_dir = '~/.vim/session'

let g:ackprg = 'ag --vimgrep'

" Plug
call plug#begin('~/.vim/plugged')
Plug 'elmcast/elm-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rvm'
Plug 'wincent/command-t'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
call plug#end()
