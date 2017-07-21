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

" rendering opt
"set renderoptions=type:directx,renmode:5,taamode:1 
" " }}}



" KEYMAPPING " {{{
" tab nav (work for gvim, fail for vim in some (most) term simulators)
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" toggle fullscreen for gvim : no wimproved.vim
"nnoremap <F11> <Esc>:WToggleFullscreen<CR>
" " }}}



" AUTOCOMMANDS " {{{
" vimscript
augroup vimscript
  au!
  " auto-reload gvimrc after writen
  au BufWritePost $MYGVIMRC source $MYGVIMRC
augroup END


" GUI entering
augroup guienter
  au!
  " set GUI window's init position to {X, Y}
  au GUIEnter * winpos 100 50
augroup END
" " }}}
