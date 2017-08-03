# README
> dotfiles for vim

## TODO
### unsolved
- [ ] ycm pop a dialog with assertion failure upon .cpp files, Windows only
  - idea: only after using '**for mingw-distro**' includes in `.ycm_extra_conf.py` 
- [ ] w0rp/ale report cpp headers missing on Windows
  - idea: add `-I`, `-isystem` flags for the problematic linters
  - workaround: no
- [ ] after re-sourcing $MYVIMRC, little problems arise with ycm completer:
  cannot input more than 2 characters in the ^X mode
  - idea: nah
  - workaround: change to another buffer and back...
- [ ] py2, py3 dynamical import problem
  - idea: nope
  - workaround: poor

### solved
- [x] big file (tex in my case) scroll lag
  - `set lazyredraw | set ttyfast` help a little
- [x] wrap strategy
 - hard wrap at 80, `gq` for reflowing
- [x] statusine customization
  - local statline for each window
  - nerdtree statline
  - mode change lag
  - second entering broken

### *need to summary*
  - mksession
  - window/tab events; bufwinenter and winenter
  - let local/global opt
  - redraw/redrawstatus
  - put statusline setting into plugin
  - `gq` : format operator 
