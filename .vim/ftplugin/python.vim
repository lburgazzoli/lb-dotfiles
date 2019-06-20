set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

nnoremap <buffer> <F10> :exec '!clear; python3' shellescape(@%, 1)<cr>
