call plug#begin('~/.vim/plugged')
    Plug 'alvan/vim-closetag'
    Plug 'godlygeek/tabular'
    Plug 'haya14busa/incsearch.vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'rbong/vim-crystalline'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'luochen1990/rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'junegunn/goyo.vim'
    Plug 'haishanh/night-owl.vim'
call plug#end()

set nolist
let g:rainbow_active = 1

set ignorecase
set noinfercase

if (has("termguicolors")) 
    set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLORS=1

syntax enable
colorscheme night-owl

highlight Normal ctermbg=None

let g:solarized_termcolors=256


"""crystalline"""
function! StatusLine(current)
  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CystallineInactive#') . ' %F%h%w%m%r '
endfunction
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'dracula'
set laststatus=2
"""crystalline"""

let g:closetag_filetypes = 'html,xhtml,phtml,vue'
let g:vimtex_complete_enabled = 1
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:tex_conceal = ""

let vim_markdown_preview_browser = 'Firefox'


let g:ale_fixers = {'vue': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

set number relativenumber
set nu rnu
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set lbr
set breakindent

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <C-n> :NERDTreeToggle<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

set splitright
set splitbelow
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>


let mapleader = "\\"
let maplocalleader = "\\"
let g:vimtex_view_method = 'zathura'
