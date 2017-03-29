" Python filetype plugin
" Language:	Python
" Maintainer:	kjk@rhcdc
" Last Change:	2017-01-02 12:07:40 +0800

" keymappings
nnoremap <buffer> <F5> :w<CR>:!python %<CR>
inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
nnoremap <buffer> <F6> :w<CR>:!python3 %<CR>
inoremap <buffer> <F6> <Esc>:w<CR>:!python3 %<CR>
