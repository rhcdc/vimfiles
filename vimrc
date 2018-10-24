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
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp' 

" linter and completer
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

" finder
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }

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
set visualbell
set t_vb=

" boost redrawing
set lazyredraw

" listchar 
set listchars=tab:▸\ ,eol:¬

" auto hidden buffers
set hidden

" if has par, then use par
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

" tabline
set showtabline=2
highlight TabLineFill ctermfg=DarkGrey guifg=DarkGrey 

" statusline
set laststatus=2 

" 80 charwrap indicator
highlight ColorColumn term=reverse ctermbg=Black guibg=Black
set colorcolumn=81

" scrolloff
set scrolloff=8

" terminal
set termwinsize=12x0
highlight Terminal ctermbg=black ctermfg=lightgreen guibg=black guifg=lightgreen
" " }}}



" PLUGINS " {{{
" ultisnips
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mySnips"]
let g:UltiSnipsSnippetsDir = g:path_to_dotfiles . "/after/mySnips"
let g:UltiSnipsEditSplit = "vertical"


" ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '!'
hi ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
hi ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow


" ycm
let g:ycm_global_ycm_extra_conf = g:path_to_dotfiles . '/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {}	      " enable for .md, .txt
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0


" indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" markdown-preview
let g:mkdp_auto_close = 0


" ctrlp
"let g:ctrlp_use_caching = 1
"let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp' 

" leaderf
let g:Lf_CacheDirectory = $HOME.'/.cache'
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_WindowHeight = 0.3
let g:Lf_HideHelp = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShortcutF = '<c-p>'
noremap <c-m> :LeaderfMru<CR>
" " }}}



" KEYMAPPING " {{{
" leader
let mapleader=","
nnoremap \ ,

" quick to quit
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

" buffer nav
nnoremap <silent> <C-n> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>

" toggle line wrap
nnoremap <silent> <leader><leader>w :set wrap!<CR>:set wrap?<CR>

" toggle proofing
nnoremap <silent> <leader><leader>p :set spell!<CR>:set spell?<CR>

" toggle invisibles
nnoremap <silent> <leader><leader>l :set list!<CR>:set list?<CR>

" highway to $MYVIMRC
nnoremap <silent> <leader>s :source $MYVIMRC<CR>
nnoremap <silent> <leader>e :tabnew $MYVIMRC<CR>

" clean search highlights before redraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" bash-style cmdline editing shortcut
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
" restoring
cnoremap <C-x>  <C-a>

" nerdtree
nnoremap <silent> <F4> :NERDTreeToggle %:p:h<CR>

" ultisnips
nnoremap <silent> <leader>ue :UltiSnipsEdit<CR>
nnoremap <silent> <F3> <Esc>:call UltiSnips#ListSnippets()<CR>

" ale
nnoremap <silent> <leader>a :ALEToggle<CR>
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)

" ycm
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
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
    set guifont=Consolas:h11.5

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
        au GUIEnter * set vb t_vb= lines=30 columns=135
    augroup END
endif
" " }}}



" LAB " {{{
" StatLine specified for each window
let g:unknownftstr=' - '
let g:currentmode={
      \ 'n'  : 'NORMAL ',
      \ 'no' : 'PENDIND ',
      \ 'v'  : 'VISUAL ',
      \ 'V'  : 'V·LINE ',
      \ '' : 'V·BLOCK ',
      \ 's'  : 'SELECT ',
      \ 'S'  : 'S·LINE ',
      \ '' : 'S·BLOCK ',
      \ 'i'  : 'INSERT ',
      \ 'R'  : 'REPLACE ',
      \ 'Rv' : 'R·VIRTUAL ',
      \ 'c'  : 'COMMAND ',
      \ 'cv' : 'EX·VIM ',
      \ 'ce' : 'EX·NORMAL ',
      \ 'r'  : 'PROMPT ',
      \ 'rm' : 'MORE ',
      \ 'r?' : 'CONFIRM ',
      \ '!'  : 'SHELL ',
      \ 't'  : 'TERMINAL '
      \} 
let g:statstyle="%{ColorModeIndicator()}"
      \. "%6*\ %{g:currentmode[mode()]}"
      \. "%5*\ %.20f\%r\ "
      \. "%1*\ %n\ "
      \. "%4*%="
      \. "%3*\ %{(&ft!=''?&ft:g:unknownftstr)}\|"
      \. "%{(&fenc!=''?&fenc:&enc)}\|%{&ff}\ "
      \. "%2*\ %4(%p%%%)\ "
      \. "%3l:%-3v"

function! ColorModeIndicator()
  redrawstatus!
  if (mode() =~# '\v(n|no)')
    exe 'hi! User6 cterm=bold ctermfg=Black ctermbg=254 
          \ gui=bold guifg=Black guibg=#e4e4e4'
  elseif (mode() =~# '\v^[vV]')
    exe 'hi! User6 cterm=bold ctermfg=Black ctermbg=51
          \ gui=bold guifg=Black guibg=#00ffff'
  elseif (mode() ==# 'i')
    exe 'hi! User6 cterm=bold ctermfg=Black ctermbg=46
          \ gui=bold guifg=Black guibg=#00ff00'
  endif

  return ''
endfunction
" default statline as a 'backup plan' for first window/tab 
" where no WinEnter event popped out 
let &statusline=g:statstyle
let g:NERDTreeStatusline="%4*%{b:NERDTree.root.path.str()}"
" statline highlight grp 
hi StatusLine cterm=bold ctermfg=2 ctermbg=8 
      \ gui=bold guifg=#757575 guibg=Black
hi User5 cterm=bold  ctermfg=235 ctermbg=241
      \ gui=bold guifg=#282828 guibg=#666666
hi User1 cterm=bold ctermfg=248 ctermbg=238
      \ gui=bold guifg=#a4a4a4 guibg=#464646
hi User4 cterm=bold ctermfg=248 ctermbg=234 
      \ gui=bold guifg=#a4a4a4 guibg=#333333
hi User3 cterm=bold ctermfg=245 ctermbg=238 
      \ gui=bold guifg=#888888 guibg=#484848
hi User2 cterm=bold ctermfg=236 ctermbg=241 
      \ gui=bold guifg=#353535 guibg=#686868
hi User7 cterm=bold ctermfg=Black ctermbg=237 
      \ gui=bold guifg=Black guibg=#333333
hi User8 cterm=bold ctermfg=235 ctermbg=237 
      \ gui=bold guifg=#282828 guibg=#333333

augroup WinLocalStatline
  au!
  au BufWinEnter,WinEnter * if(&ft!=#'nerdtree') 
        \| let &l:statusline=g:statstyle 
  au WinLeave * if(&ft!=#'nerdtree') | let &l:statusline="%7*\ %="
augroup END 
" " }}}
