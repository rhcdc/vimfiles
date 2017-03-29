" vimrc (unix/win32)
" kjk@rhcdc



" PLUGINS " {{{
" vundle
set nocompatible
filetype off

if has("unix")
  set runtimepath+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
elseif has("win32")
  set runtimepath+=$HOME/vimfiles/bundle/Vundle.vim
  call vundle#begin('$USERPROFILE/vimfiles/bundle')
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

" ycm
if has("unix")
  let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
elseif has("win32")
  let g:ycm_global_ycm_extra_conf = '$HOME/vimfiles/.ycm_extra_conf.py'
endif
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
au VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=LightGrey guibg=LightGrey
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=DarkGrey guibg=DarkGrey 


" markdown-preview
let g:mkdp_auto_close = 0
" " }}}



" GENERAL " {{{
" viminfo path
if has("unix")
  set viminfo+=n~/.vim/viminfo
elseif has("win32")
  set viminfo+=n$HOME/vimfiles/viminfo
endif

" remove splash screen
set shortmess+=I

" fix backspace
set backspace=indent,eol,start

" case-insensitive
set ignorecase

" wildmenu on
set wildmenu

" global indention
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

" silent the bell/vbell
set visualbell
set t_vb=
" " }}}



" UI " {{{
syntax enable
syntax on

if has("gui_win32")
  colorscheme molokai
else
  colorscheme desert
end

set cursorline
set hlsearch
set incsearch
set number
set showcmd
set nowrap
set textwidth=78

" tabline
set showtabline=2
highlight TabLineFill ctermfg=DarkGrey guifg=DarkGrey 

" statusline
set laststatus=2
set statusline=%.20f
set statusline+=\  
set statusline+=%y
set statusline+=%=
set statusline+=COL:
set statusline+=%3c-%-3v
set statusline+=\    
set statusline+=LN:
set statusline+=%4l/%-4L
set statusline+=\ \ \  
set statusline+=%%%-3p

" 80th char indicator
highlight ColorColumn term=reverse ctermbg=Black guibg=Black
set colorcolumn=80
" " }}}



" KEYMAPPING " {{{
" leader
let mapleader=","
nnoremap \ ,

" be quick to quit
inoremap jk <Esc>

" toggle line wrap
nnoremap <silent> <leader><leader>w :set wrap!<CR>

" highway to $MYVIMRC
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>e :tabnew $MYVIMRC<CR>
if has("gui")
  nnoremap <leader><leader>s :source $MYGVIMRC<CR>
  nnoremap <leader><leader>e :tabnew $MYGVIMRC<CR>
endif

" clean search highlights before redraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" time stamp settings
" set timestamp language
if has("unix")
  language time en_US.utf8
elseif has("win32")
  language time English_United States.1252
endif
" format: year-mon-day HH:MM:SS +/-hhmm
nnoremap <F3> i<c-r>=strftime("%Y-%m-%d %T %z")<CR><Esc>
inoremap <F3> <c-r>=strftime("%Y-%m-%d %T %z")<CR>
" format: long 
"nnoremap <F3> i<c-r>=strftime("%c")<CR><Esc>
"inoremap <F3> <c-r>=strftime("%c")<CR>
" " }}}



" AUTOCOMMANDS " {{{
" vimscript
augroup vimscript
  au!
  " auto-reload vimrc after writen
  au BufWritePost $MYVIMRC source $MYVIMRC    
augroup END
" " }}}
