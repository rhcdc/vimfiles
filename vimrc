" vimrc
" kjk@rhcdc



" OS SPEC " {{{ 
if has("unix")
  let g:path_to_dotfiles = '~/.vim'
elseif has("win32")
  let g:path_to_dotfiles = '~/vimfiles'
endif
" " }}}



" VIM-PLUG " {{{
exec "call plug#begin('".g:path_to_dotfiles."/plugged')"

" misc
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'

" linter and completor
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" finder
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }

" conditional loading
if has("win32") && has("gui_running")
  Plug 'ruedigerha/vim-fullscreen'
endif 
call plug#end()
" " }}}



" GENERAL " {{{
" i18n
let $LANG='en'
set langmenu=en
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" no swapfiles
set noswapfile

" completion options
set completeopt=longest,menu

" backspace
set backspace=indent,eol,start

" case-insensitive, unless uppercase char specified
set ignorecase
set smartcase

" wildmenu on
set wildmenu

" split below
set splitbelow

" global wrap & indention 
set nowrap
set textwidth=80 
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" silent the bell/vbell
set novisualbell t_vb=

" boost redrawing
set lazyredraw

" listchar 
set listchars=tab:▸\ ,eol:¬

" auto hidden buffers
set hidden

" if par, use par
if executable('par')
  set formatprg=par
endif
" " }}}



" UI " {{{
syntax enable
syntax on

colorscheme molokai

set cursorline
set hlsearch
set incsearch
set number
set showcmd

" statusline
set laststatus=2 

" signcolumn
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

" 80 charwrap indicator
highlight ColorColumn term=reverse ctermbg=darkred guibg=Black
set colorcolumn=81

" scrolloff
set scrolloff=8

" terminal
set termwinsize=12x0
highlight Terminal ctermbg=black ctermfg=green guibg=black guifg=lightgreen
" " }}}



" KEYMAPPINGS " {{{
" leader
let mapleader=","
nnoremap \ ,

" quick to quit
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

" toggle line wrap
nnoremap <silent> <leader><leader>w :set wrap!<CR>:set wrap?<CR>

" toggle proofing
nnoremap <silent> <leader><leader>p :set spell!<CR>:set spell?<CR>

" toggle invisibles
nnoremap <silent> <leader><leader>l :set list!<CR>:set list?<CR>

" highway to $MYVIMRC
nnoremap <silent> <leader><leader>s :source $MYVIMRC<CR>
nnoremap <silent> <leader><leader>e :tabnew $MYVIMRC<CR>

" clean search highlights before redraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" bash-style cmdline editing
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
" restoring
cnoremap <C-x>  <C-a> 
" " }}}



" PLUGIN SETTINGS " {{{
" coc.nvim
set shortmess+=c  
let g:coc_config_home = g:path_to_dotfiles . '/.config/coc'
let g:coc_data_home = g:path_to_dotfiles . '/.config/coc'
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-clangd',
      \ 'coc-python',
      \ 'coc-snippets',
      \] 
" suggest
nmap <silent> <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" jump
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" diagnostic
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
" coc-snippets
nnoremap <silent> <F3> <Esc>:CocList snippets<CR> 
nnoremap <silent> <leader>ue <Esc>:CocCommand snippets.editSnippets<CR> 
nnoremap <silent> <leader>uo <Esc>:CocCommand snippets.openSnippetFiles<CR> 

" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '»'
let g:ale_sign_warning = '!'
nmap <silent> <leader><leader>a <Plug>(ale_toggle)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
hi ALEErrorSign ctermfg=red guifg=red
hi ALEWarningSign ctermfg=yellow guifg=yellow 

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_setColors = 0
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1
let g:indentLine_char = '¦'
nnoremap <silent> [c :IndentLinesToggle<CR>

" leaderf
let g:Lf_CacheDirectory = $HOME.'/.cache'
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_WindowHeight = 0.3
let g:Lf_HideHelp = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShortcutF = '<C-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_close_button = 0

" NERDTree
nnoremap <silent> <F4> :NERDTreeToggle %:p:h<CR> 

" NERDCommenter
let g:NERDCustomDelimiters = {
      \ 'json': { 'left': '//' }
      \ }
" " }}}



" AUTOCOMMANDS " {{{
" vimscript
augroup vimscript
  au!
  " auto-reload vimrc after writen
  au BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" markdown
augroup markdown
  au!
  " in case that old Vim may identify *.md as *.modula-2
  au BufNewFile,BufRead *.md set filetype=markdown
augroup END

" tex
augroup tex
  au!
  " identify tex instead of plaintex
  au BufNewFile,BufRead *.tex set filetype=tex
augroup END 
" " }}}



" GUI " {{{
if has("gui_running") 
    " font
    set guifont=Source\ Code\ Pro\ Bold\ 12,Consolas:h12:b

    " caret no blink
    set guicursor=a:block-blinkon0

    " customize menu, toolbar, scroll bar, etc.
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=b
    set guioptions-=e
    set guioptions+=c

    " tab nav
    nnoremap <C-S-tab> :tabprevious<CR>
    nnoremap <C-tab>   :tabnext<CR>
    inoremap <C-S-tab> <Esc>:tabprevious<CR>i
    inoremap <C-tab>   <Esc>:tabnext<CR>i

    " GUI entering
    augroup guienter
        au!
        " set GUI window's init gui interfaces
        au GUIEnter * set vb t_vb= lines=30 columns=100
    augroup END
endif
" " }}} 
