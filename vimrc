
# vim configuration file

" tabbing and indenting
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
" 4 spaces = tab (delete with one backspace)
set softtabstop=4

" colors
:color default

"mark text that is past the 80 column
if exists('+colurcolumn')
    colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" show line numbers
:set number

" swap files directory
set swapfile
