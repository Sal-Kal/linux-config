inoremap jk <Esc>
set number
set relativenumber
set ai
set si
set cindent
set shiftwidth=4
set mouse=a
set smarttab
set tabstop=4
set softtabstop=4
filetype indent on
filetype plugin indent on

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:airline_theme='simple'
let mapleader = " "

inoremap <tab> <Down>
inoremap <S-tab> <Up>
nnoremap <leader>l $
nnoremap <leader>h 0
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
vmap <C-y> "+y
nmap <F8> :TagbarToggle<CR>
:set completeopt-=preview " For No Previews

highlight Pmenu ctermbg=000
highlight Pmenu ctermfg=083
highlight PmenuSel ctermbg=083
highlight PmenuSel ctermfg=000
highlight PmenuSbar ctermbg=000
highlight PmenuSbar ctermfg=000
highlight PmenuThumb ctermfg=226
highlight PmenuThumb ctermbg=226
