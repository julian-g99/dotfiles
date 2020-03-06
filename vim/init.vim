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
    "Plug 'morhetz/gruvbox'
    "Plug 'dracula/vim'
    Plug 'joshdick/onedark.vim'
    Plug 'godlygeek/tabular'
    Plug 'haya14busa/incsearch.vim'
    Plug 'thaerkh/vim-indentguides'
    "Plug 'nathanaelkane/vim-indent-guides'
    Plug 'jiangmiao/auto-pairs'
    "Plug 'dense-analysis/ale'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'machakann/vim-sandwich'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'luochen1990/rainbow'
    Plug 'airblade/vim-gitgutter'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'junegunn/goyo.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdtree'
    Plug 'SirVer/UltiSnips'
    Plug 'lervag/vimtex'
    Plug 'gabrielelana/vim-markdown'
    Plug 'christoomey/vim-tmux-navigator'
    "Plug 'liuchengxu/vista.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jreybert/vimagit'
    Plug 'dag/vim-fish'
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'tpope/vim-obsession'
    Plug 'camspiers/animate.vim'
    Plug 'camspiers/lens.vim'
    Plug 'wincent/loupe'
call plug#end()
"}}}

"{{{theme
set termguicolors
let COLORTERM="truecolor"
syntax on
highlight Normal ctermbg=None
"let g:gruvbox_italic=0
 colorscheme onedark
"colorscheme gruvbox
"set nolist
let g:rainbow_active = 1
set ignorecase
set noinfercase
let g:solarized_termcolors=256
"}}}

" Lightline{{{
let g:lightline = {}
let g:lightline.colorscheme = 'onedark'
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

nnoremap <leader>f :FZF<CR>
nnoremap <leader>id :IndentGuidesToggle<CR>
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

" vista bindings
"nnoremap <leader>v :Vista<CR>

" animate
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
nnoremap <silent> <S-Up>    :call animate#window_delta_height(5)<CR>
nnoremap <silent> <S-Down>  :call animate#window_delta_height(-5)<CR>
nnoremap <silent> <S-Left>  :call animate#window_delta_width(5)<CR>
nnoremap <silent> <S-Right> :call animate#window_delta_width(-5)<CR>

"fzf bindings
nnoremap <silent> <leader>m :Commands<CR>
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

" loupe stuff
let g:LoupeVeryMagic=0

let g:vimtex_compiler_progname = 'nvr'
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

"coc{{{
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=4000

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-S-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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

"Obsess {{{
set statusline^=%{ObsessionStatus()}
nnoremap <leader>o :Obsess<CR>
nnoremap <leader>O :Obsess!<CR>
"}}}

"tab stuff{{{
aug python
    " ftype/python.vim overwrites this
    au FileType python setlocal ts=4 sts=4 sw=4 et
aug end

aug rust
    " ftype/rust.vim overwrites this
    au FileType rust setlocal ts=4 sts=4 sw=4 expandtab
aug end
"}}}

