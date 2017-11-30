" define plugins
call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christoomey/vim-tmux-navigator'
"Plug 'davidhalter/jedi-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-clang'
call plug#end()

set number          " show line numbers
set relativenumber
set laststatus=2    " always show status line
set background=dark
colorscheme gruvbox
set cursorline

" navigation
" treat long lines as break lines
map j gj
map k gk

" indentation
set expandtab       " replace tab with spaces
set tabstop=4       " number of spaces for tab
set autoindent      " copy indent from current line
set shiftwidth=4    " number of spaces for autoindent step

" search
set hlsearch    " highlight search results
set incsearch   " incremental search
set ignorecase  " ignore case
set smartcase   " don't ignore case when pattern contains uppercase letters

" disable backup
set nobackup
set nowritebackup
set noswapfile

" misc
set wildmenu                    " enhanced command-line completion
set wildignore=*.o,*~,*.pyc     " ignore compiled files

" fzf
set rtp+=/home/adir/work/fzf
nmap <c-p> :Files<cr>
nmap <c-n> :Buffers<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/3.8/include/'
let g:deoplete#sources#clang#clang_complete_database = '.'

" cscope
if has("cscope")
    set cst
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
endif
