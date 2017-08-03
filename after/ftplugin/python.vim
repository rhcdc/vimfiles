" kjk@rhcdc
" some extra settings for python files

" keymappings
if has("python")
  nnoremap <buffer> <F5> :w<CR>:pyf %<CR>
endif

" work around: import statement failed with py3f
if has("python3")
  "nnoremap <buffer> <F6> :w<CR>:py3f %<CR>
  nnoremap <buffer> <F6> :w<CR>:!python %<CR>
endif
