" gcc
func! ExComplierGcc()
  exec "w"
  exec "!gcc -Wall % -o %<"
  exec "! ./%<"
endfunc

" gcc then gdb
func! ExComplierGccDB()
  exec "w"
  exec "!gcc -Wall -g % -o %<-db"
  exec "!gdb ./%<-db"
endfunc

" g++
func! ExComplierGpp()
  exec "w"
  exec "!g++ % -o %<"
  exec "! ./%<"
endfunc

" latex preview
func! LatexPreview()
  exec "w"
  exec "LLPStartPreview"
endfunc

" pdflatex output to ./output~
func! LatexOuput()
  exec "w"
  exec "!mkdir output~"
  exec "!pdflatex -output-directory=output~/ % && evince ./output~/%:.:r.pdf"
endfunc
