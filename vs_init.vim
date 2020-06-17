" vim:fdm=marker:foldlevel=0
"editor settings {{{
let mapleader = " "
let maplocalleader = " "
let $NVIM_TUI_ENABLE_TRUE_COLORS=1
let $FZF_DEFAULT_COMMAND = 'find .'

let g:vimtex_complete_enabled = 1
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:tex_conceal = ""

set number relativenumber
set nu rnu
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set lbr
set breakindent

set nolist
"set list lcs=tab:\|\ 
set splitright
set splitbelow
"}}}

"vim plug {{{
call plug#begin('~/.vim/plugged')
    Plug 'haya14busa/incsearch.vim'
    "Plug 'jiangmiao/auto-pairs'
    Plug 'machakann/vim-sandwich'
    Plug 'preservim/nerdcommenter'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-user'
call plug#end()
"}}}

"mappings{{{

"personal bindings {{{
nmap cl cc<Esc>
nmap <CR> o<Esc>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <leader>dl cc<Esc>

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>y :%y+<CR>

" tabs
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>
nnoremap tc :tabc<CR>
"emulating line textobj
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o^
onoremap al :normal val<CR>
"}}}

"}}}
