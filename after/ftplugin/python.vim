" Python filetype plugin
" Language:	Python
" Maintainer:	kjk@rhcdc
" Last Change:	2017-01-02 12:07:40 +0800

" keymappings
if has("python")
  nnoremap <buffer> <F5> :w<CR>:pyf %<CR>
endif

" work around: import statement failed with py3f
if has("python3")
  "nnoremap <buffer> <F6> :w<CR>:py3f %<CR>
  nnoremap <buffer> <F6> :w<CR>:!python %<CR>
endif
