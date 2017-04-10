" gcc
func! ExComplierGcc()
  exec "w"
  exec "!gcc -Wall % -o %<"
  exec "! %<"
endfunc

" gcc then gdb
func! ExComplierGccDB()
  exec "w"
  exec "!gcc -Wall -g % -o %<-db"
  exec "!gdb %<-db"
endfunc

" g++
func! ExComplierGpp()
  exec "w"
  exec "!g++ % -o %<"
  exec "! %<"
endfunc

" g++: c++ 11 version
func! ExComplierGpp11()
  exec "w"
  exec "!g++ -std=c++11 % -o %<"
  exec "! %<"
endfunc

" latex preview
func! LatexPreview()
  exec "w"
  exec "LLPStartPreview"
endfunc

" pdflatex output to ./output~
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
  exec "!mkdir output~"
  exec "!pdflatex -output-directory=output~/ %"
  exec "!".s:pdfviewer." ./output~/".expand("%:t:r").".pdf"
endfunc
