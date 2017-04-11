" C filetype plugin
" Language:	C
" Maintainer:	kjk@rhcdc
" Last Change:  2017-01-02 11:40:10 +0800	

" indent setting: 'i8' style
"setlocal tabstop=8
"setlocal softtabstop=0
"setlocal shiftwidth=0
"setlocal noexpandtab
"setlocal cindent

" keymappings
nnoremap <silent> <buffer> <F5> :call ExComplierGcc()<CR>
nnoremap <silent> <buffer> <F6> :call ExComplierGccDB()<CR>
