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
" set guioptions=
" set wmh=0
" set wmw=0
set ignorecase
set encoding=utf-8
set foldmethod=indent
" set foldignore=
set diffopt+=vertical


filetype plugin indent on
filetype plugin on

set shell=zsh\ -l
" set hlsearch
set incsearch 
" vim-gutter
set updatetime=100

" theme
set background=dark
syntax enable
colorscheme gruvbox

let mapleader = ","
let maplocalleader = ","

let g:camelcasemotion_key = '<leader>'

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<c-m>'

let g:UltiSnipsExpandTrigger           = '<c-j>'
let g:UltiSnipsJumpForwardTrigger      = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger     = '<c-k>'

" :nnoremap <F5> :buffers<CR>:buffer<Space>

" coc.nvim settings
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"
set updatetime=300
set cmdheight=2
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> dc <Plug>(coc-diagnostic-info)
nmap <silent> fc <Plug>(coc-float-jump)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nmap <silent> gf <Plug>(coc-format)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')

command! BufOnly silent! execute "%bd|e#|bd#"
" ------------------------

" shortcut mapping
nnoremap <C-L> <C-W>l<C-W>_
" nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-H> <C-W>h<C-W>_
" nnoremap <C-K> <C-W>k<C-W>_
nnoremap <silent> <C-c> :close<cr>
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
inoremap jk <Esc>
noremap <silent> <F4> :set hlsearch! hlsearch?<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vz :VimuxZoomRunner<CR>

set hidden
nnoremap <S-n> :bnext<CR>
nnoremap <S-p> :bprev<CR>
nnoremap <S-c> :bp <bar> :bd #<CR>

let g:miniBufExplorerAutoStart = 0

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
" map sh <C-w>h
" map sk <C-w>k
" map sj <C-w>j
" map sl <C-w>l
" Resize window
nmap <-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-


nnoremap - :Explore<CR>
nnoremap <Leader>f :Explore .<CR>

" Plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
" Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-rooter'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'bkad/CamelCaseMotion'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
call denite#custom#option('default', 'prompt', 'λ')
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])


" Define mappings for Denite
nmap ; :Denite buffer -split=floating -winrow=1<CR>
nmap <leader>p :DeniteProjectDir file/rec -split=floating -winrow=1<CR>
" nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :Denite grep -split=floating -winrow=1<CR>
" nnoremap <leader>j :<C-u>Denite grep<CR>
" nmap <LEADER>p :Denite -start-filter file/rec<CR>
" nmap <LEADER>b :Denite buffer<CR>
" nnoremap \ :Denite grep<CR>
