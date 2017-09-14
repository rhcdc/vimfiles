" kjk@rhcdc
" some extra settings for c files

" indent setting: 'i8' style
"setlocal tabstop=8
"setlocal softtabstop=0
"setlocal shiftwidth=8
"setlocal noexpandtab
"setlocal cindent

" keymappings
nnoremap <silent> <buffer> <F5> :call ExComplierGcc()<CR>
nnoremap <silent> <buffer> <F6> :call ExComplierGccGdb()<CR>
