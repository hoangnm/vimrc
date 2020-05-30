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

let NERDTreeHijackNetrw = 0
let g:elm_setup_keybindings = 1
set shell=zsh\ -l
let g:elm_format_autosave = 1
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

" ignore for t-command plugin
" set wildignore+=*/node_modules/**
" let g:CommandTWildIgnore=&wildignore . ",*/node_modules"
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<c-m>'

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "left"
nnoremap <silent> <leader>nt :NERDTreeToggle<cr>
nnoremap <silent> <leader>nf :NERDTreeFocus<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
" nnoremap <leader>cl :let @*=expand("%:p")<CR>
" nmap <leader>ns :NERDTreeFind<Space>
nnoremap <silent> <leader>v :NERDTreeFind<CR>

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

command! BufOnly silent! execute "%bd|e#|bd#"
" ------------------------

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
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>

let g:ackprg = 'ag --vimgrep'

set hidden
nnoremap <S-n> :bnext<CR>
nnoremap <S-p> :bprev<CR>

let g:miniBufExplorerAutoStart = 0

" let g:airline#extensions#bufferline#enabled = 1

" let g:deoplete#enable_at_startup = 1

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

" Plug
call plug#begin('~/.vim/plugged')
" Plug 'elmcast/elm-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'w0rp/ale'
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
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'ap/vim-css-color'
Plug 'vim-scripts/indentpython.vim'
Plug 'airblade/vim-rooter'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'fholgado/minibufexpl.vim'
" Plug 'Shougo/deoplete.nvim'
Plug 'bkad/CamelCaseMotion'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'ap/vim-buftabline'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

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
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
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
nnoremap <leader>g :Denite grep<CR>
" nnoremap <leader>j :<C-u>Denite grep<CR>
" nmap <LEADER>p :Denite -start-filter file/rec<CR>
" nmap <LEADER>b :Denite buffer<CR>
" nnoremap \ :Denite grep<CR>
