" kjk@rhcdc
" some extra settings for markdown files

" keymappings
nmap <silent><buffer> <F5> <Plug>MarkdownPreview
imap <silent><buffer> <F5> <Plug>MarkdownPreview
nmap <silent><buffer> <F6> <Plug>StopMarkdownPreview
imap <silent><buffer> <F6> <Plug>StopMarkdownPreview

" user-defined commands
command! -buffer ToJekyllpost source md2jpost.vim
