" extools and wrappers, need tidying

" kjk@rhcdc 
" 2017-04-10 16:24:01 +0800



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



" winmanager custom-settings " {{{
" intercept 'WMToggle' command
function! WMToggle()
  if !exists("t:wm_switch")
    let t:wm_switch=0
  endif
  if t:wm_switch == 1
    exec "normal! :WMClose\<CR>"
  elseif t:wm_switch == 0
    exec "normal! :WManager\<CR>"
  endif
  let t:wm_switch=!t:wm_switch
endfunction

" open current file's directory in file explorer
function! CurrentFileWMToggle()
  if !exists("t:wm_switch")
    let t:wm_switch=0
  endif
  if t:wm_switch == 0
    let a:save_work_dir=getcwd()
    let a:cur_file_dir=expand("%:p:h")
    exec "normal! :WMToggle\<CR>\:FirstExplorerWindow\<CR>"
    exec "lcd ".a:cur_file_dir
    exec "normal C"
    exec "lcd ".a:save_work_dir
  elseif t:wm_switch == 1
    exec "normal! :WMToggle\<CR>"
  endif
endfunction
" " }}}
