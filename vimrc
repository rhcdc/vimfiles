" vimrc
" kjk@rhcdc



" PLUGINS " {{{
" vundle
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'


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
" set path for viminfo file
set viminfo+=n~/.vim/viminfo

" remove splash screen
set shortmess+=I

" reinforce backspace
set backspace=indent,eol,start

" case-insensitive
set ignorecase

" wildmenu on
set wildmenu

" global indent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" silent the bell/vbell
set visualbell
set t_vb=
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
set nowrap
set textwidth=78

" tabline
set showtabline=2
highlight TabLineFill ctermfg=DarkGrey guifg=Black 

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
highlight ColorColumn term=reverse ctermbg=Black guibg=DarkGrey
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

" clean search highlights before redraw
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" time stamp settings
" set timestamp language
language time en_US.utf8
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
