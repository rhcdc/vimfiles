" kjk@rhcdc 
" wrappers of some cmdline tools



" gcc wrappers "{{{
" compile standalone .c/.cpp
if has("win32")
  let s:outspec = " -o %<.exe %"
  let s:goutspec = " -g -o %<-debug.exe %"
elseif has("unix")
  let s:outspec = " -o %<.out %"
  let s:goutspec = " -g -o %<-debug.out %"
endif

let s:cflag = "-std=c1x -Wall -Wextra"
let s:ccflag = "-std=c++14 -Wc++11-compat -Wc++14-compat -Wall -Wextra"

" gcc
func! ExComplierGcc()
  exec "w"
  exec "!gcc " . s:cflag . s:outspec
  exec "!" . expand("%:p:r")
endfunc

" gcc then gdb
func! ExComplierGccGdb()
  exec "w"
  exec "!gcc " . s:cflag . s:goutspec
  exec "!gdb " . expand("%:p:r") . "-debug"
endfunc

" g++
func! ExComplierGpp()
  exec "w"
  exec "!g++ ". s:ccflag . s:outspec
  exec "!" . expand("%:p:r")
endfunc

" g++ then gdb
func! ExComplierGppGdb()
  exec "w"
  exec "!g++ " . s:ccflag . s:goutspec
  exec "!gdb " . expand("%:p:r") . "-debug"
endfunc
" " }}}



" pdflatex wrapper "{{{
" pdflatexing current .tex file and pump the outputs into ./output~

" this piece of code assuming that:
" 1. pdflatex tool is accessible
" 2. a pdfviewer is possible available for viewing the output

for possible_viewer in [
      \ 'evince',
      \ 'okular',
      \ 'SumatraPDF' ]
  if executable(possible_viewer)
    let s:pdfviewer = possible_viewer
    break
  endif
endfor

func! LatexOuput()
  exec "w"
  silent exec "!mkdir output~"
  exec "!pdflatex -output-directory=output~/ %"
  if exists("s:pdfviewer")
    silent  exec "!".s:pdfviewer." ./output~/".expand("%:t:r").".pdf"
  else
    echo "no available pdfviewer"
  endif
endfunc
" " }}}
