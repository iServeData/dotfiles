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
"    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
"    Plug 'preservim/nerdtree'
    Plug 'mbbill/undotree'
    Plug 'sheerun/vim-polyglot'
"    Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'jiangmiao/auto-pairs'
"    Plug 'dense-analysis/ale'
call plug#end()

"Key remapping
let mapleader = " "
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <leader>q :copen 25<CR>
map <leader>c :cclose<CR>
"nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-F> :NERDTreeFind<CR>
map <leader>t :terminal<CR>
map <leader>u :UndotreeToggle<CR>

"Cursorline settings
hi Search ctermbg=Red ctermfg=Black
hi CursorLine ctermbg=Black ctermfg=Red
hi CursorLineNr ctermbg=Red ctermfg=Black
hi LineNr ctermbg=Black ctermfg=Red
hi QickFixLine ctermbg=Yellow ctermfg=Black

"highlighting
let g:python_highlight_all = 1

"Lightline configuration
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
let g:lightline = {
    \ 'colorscheme': 'ayu_light'
    \ }

syntax match msg_debug '^.*\[DEBUG\].*$'
syntax match msg_error '^.*\[ERROR\].*$'
syntax match msg_warn '^.*\[WARN\].*$'
syntax match msg_vuln '^.* - VULNERABLE.*$'
syntax match msg_soft '^.*Installed\ Software.*$'
syntax match msg_sysf '^.*Promoting\ SystemFingerprint.*$'
syntax match msg_fw '^.*A\ firewall\ is\ running.*$'
syntax match msg_prodv '^.*Product\ Version>.*$'
syntax match msg_open '^.*OPEN.*$'
syntax match msg_dbg '^.* DEBUG .*$'
syntax match msg_err '^.* ERROR .*$'
syntax match msg_errno '^.*Errno.*$'
highlight msg_debug ctermbg=DarkYellow ctermfg=Black
highlight msg_error ctermbg=DarkRed ctermfg=White
highlight msg_warn ctermbg=Yellow ctermfg=Black
highlight msg_vuln ctermbg=DarkMagenta ctermfg=White
highlight msg_soft ctermbg=Green ctermfg=Black
highlight msg_sysf ctermbg=LightGreen ctermfg=Black
highlight msg_fw ctermbg=LightMagenta ctermfg=Black
highlight msg_prodv ctermbg=LightBlue ctermfg=Black
highlight msg_open ctermbg=DarkGreen ctermfg=White
highlight msg_dbg ctermbg=DarkYellow ctermfg=White
highlight msg_err ctermbg=DarkRed ctermfg=White
highlight msg_errno ctermbg=DarkRed ctermfg=Gray
