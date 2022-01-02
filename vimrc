syntax on 

set colorcolumn=238
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=indent
set foldlevel=99
set hidden
set hlsearch
set incsearch
set laststatus=2
set nobackup
set noerrorbells
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set nu
set relativenumber
set shiftwidth=4
set showcmd
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set tabstop=4 softtabstop=4
set textwidth=0
set undodir=~/.vim/undodir
set undofile
set rtp+=/usr/local/opt/fzf

"Plugins
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'sheerun/vim-polyglot'
    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'jiangmiao/auto-pairs'
    Plug 'dense-analysis/ale'
call plug#end()

"Key remapping
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Q> :copen<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-F> :NERDTreeFind<CR>
nnoremap <C-t> :terminal<CR>

"Cursorline settings
hi Search ctermbg=LightGray
hi Search ctermfg=Black

hi CursorLine ctermfg=DarkGray
hi CursorLineNr ctermfg=Black
hi LineNr ctermbg=Black ctermfg=Gray
hi QickFixLine ctermbg=Yellow ctermfg=Black

"Lightline configuration
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:lightline = {
    \ 'colorscheme': 'ayu_light'
    \ }

"Custom syntax highlighting for reading logs
syntax match msg_open '^.*OPEN.*$'
syntax match msg_dbg '^.* DEBUG .*$'
syntax match msg_err '^.* ERROR .*$'
highlight msg_open ctermbg=DarkGreen ctermfg=White
highlight msg_dbg ctermbg=DarkYellow ctermfg=White
highlight msg_err ctermbg=DarkRed ctermfg=White
