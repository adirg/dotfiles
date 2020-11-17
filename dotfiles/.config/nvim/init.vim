" define plugins
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/CSApprox'
call plug#end()

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

" fzf
let $FZF_DEFAULT_COMMAND="rg --files"
nmap <c-p> :Files<cr>
nmap <c-n> :Buffers<cr>

"vim-go
let g:go_def_mapping_enabled = 0    " disable go-to-definition (will be handled by coc)

"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" airline
let g:airline_extensions = []       " disable all extensions
let g:airline_section_x = ""        " hide file type
let g:airline_section_y = ""        " hide file encoding

" cscope
set nocsverb
if has("cscope")
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != "" && filereadable($CSCOPE_DB)
        cs add $CSCOPE_DB
    endif
endif
