" vim:fdm=marker:foldlevel=0
"editor settings {{{
let mapleader = " "
let maplocalleader = " "
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
    Plug 'haishanh/night-owl.vim'
    Plug 'haya14busa/incsearch.vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'jiangmiao/auto-pairs'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'machakann/vim-sandwich'
    Plug 'luochen1990/rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'SirVer/UltiSnips'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'itchyny/lightline.vim'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-user'
    Plug 'wincent/loupe'
    Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()
"}}}

"{{{theme
set termguicolors
"let g:gruvbox_italic=1
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLORS=1
"colorscheme gruvbox
colorscheme night-owl
hi Normal ctermbg=None guibg=None
"set nolist
let g:rainbow_active = 1
set ignorecase
set noinfercase
"let g:solarized_termcolors=256
"}}}

" Lightline{{{
let g:lightline = {}
let g:lightline.colorscheme = 'nightowl'
"}}}

"mappings{{{

"personal bindings {{{
nmap cl cc<Esc>
nmap <CR> o<Esc>
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

nnoremap <leader>dl cc<Esc>

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>y :%y+<CR>

" tabs
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>
nnoremap tc :tabc<CR>

" splits
nnoremap <leader>st :sp<bar>te<CR>
nnoremap <leader>vt :vs<bar>te<CR>

"visual mode
nnoremap V v$
nnoremap vv V
"}}}

"plugin bindings {{{
nnoremap <leader>f :FZF<CR>
nnoremap <leader>id :IndentGuidesToggle<CR>
nmap <leader>t :NERDTreeToggle<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

"fzf bindings
nnoremap <silent> <leader>m :Commands<CR>

"}}}
"}}}

"startify{{{
let g:startify_bookmarks = ['~/dotfiles/vim/init.vim']
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
"}}}

"miscellaneous{{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" TODO highlights
hi CustomPink ctermbg=205 guibg=hotpink guifg=black ctermfg=black
augroup custom_highlightint
    autocmd!
    autocmd VimEnter,WinEnter * call matchadd('CustomPink', 'TODO') | call matchadd('CustomPink', 'FIXME') | call matchadd('CustomPink', 'CHECK')
augroup END

" fzf popout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"line numbers in nerdtree
let NERDTreeShowLineNumbers=1

let g:vimtex_compiler_progname = 'nvr'

"c++ running
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

let g:vimtex_view_general_viewer = "zathura"
let g:tex_flavor = 'latex'
"}}}

"prose vs code{{{
function Prose()
    Goyo 99
endfunction

nnoremap <leader>p :call Prose()<CR>
"}}}

"coc{{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=500

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" list symbols
nnoremap <leader>s :CocList symbols<CR>
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"rust
autocmd FileType rust let b:coc_root_patterns = ['Cargo.toml', '.vim', '.git', '.hg', '.projections.json']
"}}}

"{{{ treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
"}}}
