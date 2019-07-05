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
" set wmh=0
" set wmw=0
set ignorecase
set encoding=utf-8
set foldmethod=indent
set foldignore=

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
" let g:CommandTWildIgnore=&wildignore . ",*/node_modules"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<c-m>'

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
nnoremap <silent> <leader>nt :NERDTreeToggle<cr>
nnoremap <silent> <leader>nf :NERDTreeFocus<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>cl :let @*=expand("%:p")<CR>
" nmap <leader>ns :NERDTreeFind<Space>
nnoremap <silent> <leader>v :NERDTreeFind<CR>

let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" shortcut mapping
nnoremap <C-L> <C-W>l<C-W>_
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-H> <C-W>h<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <silent> <C-c> :close<cr>
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
inoremap jk <Esc>
noremap <silent> <F4> :set hlsearch! hlsearch?<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ji :call JSXEachAttributeInLine()<CR>

" ale
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

let g:javascript_plugin_flow = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma'

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
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mattn/emmet-vim'
call plug#end()

" put each JSX tag's attributes on its on line
function! JSXEachAttributeInLine()
  let l:previous_q_reg = @q
  let l:line = getline(".")
  let l:identation_length = len(matchstr(line, "^\[\\t|\\ \]*"))

  if &expandtab
    let l:padding = repeat(" ", (identation_length + &shiftwidth))
  else
    let l:padding = repeat("\t", identation_length + 1)
  endif

  let @q = substitute(line, "\\w\\+=[{|'|\"]", "\\n" . padding . "&", "g")

  let @q = substitute(getreg("q"), "\ \\n", "\\n", "g")

  execute "normal! 0d$\"qp"

  let @q = previous_q_reg
endfunction
