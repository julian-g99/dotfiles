call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'
    Plug 'mattn/emmet-vim'
    Plug 'alvan/vim-closetag'
    Plug 'ap/vim-css-color'
    Plug 'leafgarland/typescript-vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'haya14busa/incsearch.vim'
    Plug 'posva/vim-vue'
    Plug 'lervag/vimtex'
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'thaerkh/vim-indentguides'
    Plug 'tpope/vim-commentary'
    Plug 'scrooloose/nerdtree'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'gabrielelana/vim-markdown'
    Plug 'PratikBhusal/vim-grip'
    Plug 'rbong/vim-crystalline'
call plug#end()

syntax on
colorscheme dracula
highlight Normal ctermbg=None


"""crystalline"""
function! StatusLine(current)
  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CystallineInactive#') . ' %f%h%w%m%r '
endfunction
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'dracula'
set laststatus=2
"""crystalline"""

let g:closetag_filetypes = 'html,xhtml,phtml,vue'
let g:vimtex_complete_enabled = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
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

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}
let mapleader = "\\"
let maplocalleader = "\\"
let g:vimtex_view_method = 'zathura'

autocmd VimEnter * UltiSnipsAddFiletypes tex
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
