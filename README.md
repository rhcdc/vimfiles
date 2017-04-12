I'm now working on machines with both linux/unix and windows os installed.
Try to figure out how to use *vim*. It's tricky. Never mess around with
any *modal editor* before. But it's also joyful.

So...here is a place to pile the vimfiles stuff, wish I could keep it clean

# 
### TODO
- [ ] fix ycm clang semantic complete on windows
  - [x] c-lang semantic complete 
  - [x] when comes to stl objects, still has problem: there is headers, but
	can't locate objects' declarations, thus can't complete
  - [ ] some c++ headers such like 'iostream' or 'string' from MinGW will
	crash ycmserver upon re-opening the .cpp file while the other like
	'vector' will not
- [x] latex preview on windows
- [ ] markdown preview on windows
- [ ] fix time stamp language on windows
