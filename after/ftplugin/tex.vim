" LaTeX filetype plugin
" Language:	LaTeX (ft=tex)
" Maintainer:	kjk@rhcdc
" Last Change:	2017-01-02 12:17:07 +0800

" keymappings
nnoremap <buffer> <F5> :call LatexPreview()<CR>
inoremap <buffer> <F5> <ESC>:call LatexPreview()<CR>li
nnoremap <buffer> <F6> :call LatexOuput()<CR>
inoremap <buffer> <F6> <ESC>:call LatexOuput()<CR>li 
