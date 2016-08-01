set rtp+=~/.vim/bundle/Vundle

call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
call vundle#end()

" ui
set number          " show line numbers
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

" plugins
" minibufferexplorer
map <leader>mbt :MBEToggle<cr>
map <leader>mbf :MBEFocus<cr>

" syntastic
let g:syntastic_python_pep8_args = "--max-line-size=180" 
let g:syntastic_python_flake8_args = "--max-line-size=180" 
