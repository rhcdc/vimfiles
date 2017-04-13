" gvimrc works with vimrc (unix/win32)
" kjk@rhcdc



" GENERAL " {{{
" silent the bell/vbell
set visualbell
set t_vb=
" " }}}



" GUI {{{
" window size
set lines=30
set columns=135

" font pick
set guifont=Consolas:h11.5

" freeze prompt caret
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
" " }}}



" AUTOCOMMANDS " {{{
" vimscript
augroup vimscript
    au!
    " auto-reload gvimrc after writen
    au BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END
" " }}}
