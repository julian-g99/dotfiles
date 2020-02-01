" vim:fdm=marker:foldlevel=0

"editor settings {{{
set modeline
set modelineexpr
let mapleader = ","
let maplocalleader = ","
let $NVIM_TUI_ENABLE_TRUE_COLORS=1
let $FZF_DEFAULT_COMMAND = 'find .'

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

set splitright
set splitbelow
"}}}

"vim plug {{{
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'alvan/vim-closetag'
    Plug 'godlygeek/tabular'
    Plug 'haya14busa/incsearch.vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'rbong/vim-crystalline'
    Plug 'machakann/vim-sandwich'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'luochen1990/rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'junegunn/goyo.vim'
    Plug 'haishanh/night-owl.vim'
    Plug '/usr/bin/fzf'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'tommcdo/vim-ninja-feet'
    Plug 'preservim/nerdtree'
    Plug 'SirVer/UltiSnips'
    Plug 'lervag/vimtex'
    Plug 'gabrielelana/vim-markdown'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'liuchengxu/vista.vim'
call plug#end()
"}}}

"{{{theme
set termguicolors
let COLORTERM="truecolor"
syntax on
highlight Normal ctermbg=None
let g:gruvbox_italic=1
" colorscheme night-owl
colorscheme gruvbox
set nolist
let g:rainbow_active = 1
set ignorecase
set noinfercase
let g:solarized_termcolors=256
"}}}

"{{{crystalline
function! StatusLine(current)
  return (a:current ? crystalline#mode() . '%#Crystalline#' : '%#CystallineInactive#') . ' %F%h%w%m%r '
endfunction
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'gruvbox'
set laststatus=2
"}}}

"mappings{{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

tnoremap <Esc> <C-\><C-n>

nmap <leader>f :FZF<CR>
nmap <leader>t :NERDTreeToggle<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

"" Advanced customization using Vim function
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
"}}}

"startify{{{
let g:startify_bookmarks = ['~/.config/nvim/init.vim']
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
"}}}

"miscellaneous{{{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:vimtex_view_method = 'zathura'

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"}}}

"prose vs code{{{
function Prose()
    set background=light
    Goyo 70
endfunction

function Code()
    set background=dark
    Goyo!
endfunction
nnoremap <leader>p :call Prose()<CR>
nnoremap <leader>c :call Code()<CR>
"}}}

"vista{{{
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"}}}
