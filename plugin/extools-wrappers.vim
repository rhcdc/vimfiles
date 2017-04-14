" external tools and wrappers, need tidying

" kjk@rhcdc 
" 2017-04-13 22:50:21 +0800



" gcc wrappers "{{{
" for testing toy c/cpp program
if has("win32")
  let s:extension = ".exe"
elseif has("unix")
  let s:extension = ".out"
endif

" gcc
func! ExComplierGcc()
  exec "w"
  exec "!gcc -Wall % -o %<" . s:extension
  exec "!" . expand("%:r") . s:extension
endfunc

" g++
func! ExComplierGpp()
  exec "w"
  exec "!g++ -Wall % -o %<" . s:extension
  exec "!" . expand("%:r") . s:extension
endfunc

" g++: c++ 11 version
func! ExComplierGpp11()
  exec "w"
  exec "!g++ -Wall -std=c++11 % -o %<" . s:extension
  exec "!" . expand("%:r") . s:extension
endfunc

" gcc then gdb
func! ExComplierGccDB()
  exec "w"
  exec "!gcc -Wall -g % -o %<.db" . s:extension
  exec "!gdb " . expand("%:r") . ".db" . s:extension
endfunc

" g++ then gdb
func! ExComplierGppDB()
  exec "w"
  exec "!g++ -Wall -g % -o %<.db" . s:extension
  exec "!gdb " . expand("%:r") . ".db" . s:extension
endfunc

" g++ then gdb
func! ExComplierGpp11DB()
  exec "w"
  exec "!g++ -Wall -std=c++11 -g % -o %<.db" . s:extension
  exec "!gdb " . expand("%:r") . ".db" . s:extension
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



" winmanager wrapper " {{{
" just want to enable wmanager to load current file's dir
" into the file explorer, brutal force used here... directly
" use the function from winmanager.vim

function! CurrentFileDirWMToggle()
  if IsWinManagerVisible()
    exec "normal! :WMToggle\<CR>"
  else
    let a:save_cwd=getcwd()
    let a:cur_file_dir=expand("%:p:h")
    silent exec "normal! :WMToggle\<CR>\:FirstExplorerWindow\<CR>"
    exec "lcd ".a:cur_file_dir
    exec "normal C"
    exec "lcd ".a:save_cwd
  endif
endfunction
" " }}}
