" kjk@rhcdc
" some extra settings for c++ files

" indent setting: 'i8' style
"setlocal tabstop=8
"setlocal softtabstop=0
"setlocal shiftwidth=8
"setlocal noexpandtab
"setlocal cindent

" keymappings
nnoremap <buffer> <F5> :call ExComplierGpp()<CR>
nnoremap <buffer> <F6> :call ExComplierGppGdb()<CR>
