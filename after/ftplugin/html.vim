" kjk@rhcdc
" some extra settings for html files

" indent setting
setlocal tabstop=8
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab

" browser setting
if executable("google-chrome")
  nnoremap <buffer> <F5> :w<cr>:!google-chrome %<cr>
  inoremap <buffer> <F5> :w<cr>:!google-chrome %<cr>
elseif executable("chrome")
  nnoremap <buffer> <F5> :w<cr>:!chrome %<cr>
  inoremap <buffer> <F5> :w<cr>:!chrome %<cr>
endif
