" C++ filetype plugin
" Language:	C++
" Maintainer:	kjk@rhcdc
" Last Change:  2017-04-10 17:35:14 +0800	

" indent setting: 'i8' style
"setlocal tabstop=8
"setlocal softtabstop=0
"setlocal shiftwidth=0
"setlocal noexpandtab
"setlocal cindent

" keymappings
nnoremap <buffer> <F5> :call ExComplierGpp()<CR>
nnoremap <buffer> <F6> :call ExComplierGpp11()<CR>
nnoremap <buffer> <F7> :call ExComplierGppDB()<CR>
nnoremap <buffer> <F8> :call ExComplierGpp11DB()<CR>
