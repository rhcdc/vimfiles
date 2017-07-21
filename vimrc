" vimrc (unix/win32)
" kjk@rhcdc

 

" PROBING " {{{ 
if has("unix")
  let g:path_to_dotfiles='~/.vim'
elseif has("win32")
  " here '~' replace traditional '$HOME' for .ycm_extra_conf, see below
  let g:path_to_dotfiles='~/vimfiles'
endif
" " }}}



" PLUGINS " {{{
" vundle
set nocompatible
filetype off

exec "set runtimepath+=".g:path_to_dotfiles."/bundle/Vundle.vim"
exec "call vundle#begin('".g:path_to_dotfiles."/bundle')"

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on 


"ultisnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-e>"


" ycm
set completeopt=longest,menu
" does not work for g:path_to_dotfiles='$HOME/vimfiles', can't figure why...
let g:ycm_global_ycm_extra_conf=g:path_to_dotfiles."/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf=0
let g:ycm_server_python_interpreter='C:/Python27/python.exe'
let g:ycm_enable_diagnostic_signs=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger=1
let g:ycm_filetype_blacklist={}


" indent guides
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=LightGrey guibg=LightGrey
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=DarkGrey guibg=DarkGrey 


" markdown-preview
let g:mkdp_auto_close=0
" need chrome in PATH for win-os
let g:mkdp_path_to_chrome='chrome'
" " }}}



" GENERAL " {{{
" viminfo path
exec "set viminfo+=n".g:path_to_dotfiles."/viminfo"

" remove splash screen
set shortmess+=I

" fix backspace
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
set noexpandtab
set smartindent

" silent the bell/vbell
set visualbell
set t_vb=

" boost
set lazyredraw
set ttyfast

" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
" " }}}



" UI " {{{
syntax enable
syntax on

if has("gui")
  colorscheme molokai
elseif
  colorscheme desert
endif

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
" " }}}



" KEYMAPPING " {{{
" leader
let mapleader=","
nnoremap \ ,

" quick to quit
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

" quick to buffer
nnoremap <silent> <C-k> :b#<CR>
nnoremap <silent> <C-n> :bnext<CR>
nnoremap <silent> <C-h> :bprev<CR>

" toggle line wrap
nnoremap <silent> <leader><leader>w :set wrap!<CR>

" toggle proofing
nnoremap <silent> <leader><leader>p :set spell!<CR>

" highway to $MYVIMRC
nnoremap <silent> <leader>s :source $MYVIMRC<CR>
nnoremap <silent> <leader>e :tabnew $MYVIMRC<CR>
if has("gui")
  nnoremap <silent> <leader><leader>s :source $MYGVIMRC<CR>
  nnoremap <silent> <leader><leader>e :tabnew $MYGVIMRC<CR>
endif

" clean search highlights before redraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" bash-style cmdline editing shortcut
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-Right><C-w>
" restoring
cnoremap <C-x>  <C-a>

" nerdtree
nnoremap <silent> <F4> :NERDTreeToggle %<CR>

" ycm short-cut
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
    \ 't'  : 'Terminal '
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
    exe 'hi! User6 cterm=bold ctermfg=004 
		\ gui=bold guifg=Black guibg=#e4e4e4'
  elseif (mode() =~# '\v^[vV]')
    exe 'hi! User6 cterm=bold ctermfg=004 
		\ gui=bold guifg=Black guibg=#00ffff'
  elseif (mode() ==# 'i')
    exe 'hi! User6 cterm=bold ctermfg=004 ctermbg=004 
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
hi User5 cterm=bold gui=bold ctermbg=Gray guifg=#282828 guibg=#666666
hi User1 cterm=bold ctermfg=LightGray ctermbg=DarkGray
	    \ gui=bold guifg=#a4a4a4 guibg=#464646
hi User4 cterm=bold ctermfg=Black ctermbg=LightGray 
	    \ gui=bold guifg=#a4a4a4 guibg=#333333
hi User3 cterm=bold ctermfg=Black ctermbg=LightGray 
	    \ gui=bold guifg=#888888 guibg=#484848
hi User2 cterm=bold ctermfg=Black ctermbg=LightGray 
	    \ gui=bold guifg=#353535 guibg=#686868
hi User7 cterm=bold ctermfg=Black ctermbg=LightGray 
	    \ gui=bold guifg=Black guibg=#333333
hi User8 cterm=bold ctermfg=Black ctermbg=LightGray 
	    \ gui=bold guifg=#282828 guibg=#333333

augroup WinLocalStatline
  au!
  au BufWinEnter,WinEnter * if(&ft!=#'nerdtree') 
	\| let &l:statusline=g:statstyle 
  au WinLeave * if(&ft!=#'nerdtree') | let &l:statusline="%7*\ %="
augroup END


" jump to next/prev tag in vim help docs
augroup vimdoc
  au!
  au BufEnter *.txt if(&ft==#'help')
	\| nnoremap <silent><buffer> <C-j> 
	\:exe ":silent norm /\|.\\{-}\|\r:nohlsearch\r"<CR>
	\| nnoremap <silent><buffer> <C-g> 
	\:exe ":silent norm ?\|.\\{-}\|\r:nohlsearch\r"<CR>
augroup END
" " }}}
