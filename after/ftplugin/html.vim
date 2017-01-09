" HTML filetype plugin
" Language:	HTML
" Maintainer:	kjk@rhcdc
" Last Change:	2017-01-02 11:51:20 +0800

" indent setting
setlocal softtabstop=2
setlocal shiftwidth=2

" browser setting
if has("unix")
  nnoremap <buffer> <F5> :w<cr>:!google-chrome %<cr>
  inoremap <buffer> <F5> :w<cr>:!google-chrome %<cr>
elseif has("win32")
endif
