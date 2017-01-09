" Markdown filetype plugin
" Language:	Markdown
" Maintainer:	kjk@rhcdc
" Last Change:	2017-01-01 20:52:42 +0800

" keymappings
nmap <silent><buffer> <F5> <Plug>MarkdownPreview
imap <silent><buffer> <F5> <Plug>MarkdownPreview
nmap <silent><buffer> <F6> <Plug>StopMarkdownPreview
imap <silent><buffer> <F6> <Plug>StopMarkdownPreview

" user-defined commands
command! -buffer ToJekyllpost source md2jpost.vim
