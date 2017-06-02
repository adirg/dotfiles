" define plugins
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'davidhalter/jedi-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
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

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_confirm_extra_conf=0
