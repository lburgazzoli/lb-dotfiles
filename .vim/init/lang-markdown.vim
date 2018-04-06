" if no filetype specified, set ft=markdown (alternative would be text)
autocmd BufEnter * if &filetype == "" | setlocal ft=markdown | endif

let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'ruby', 'python', 'bash=sh', 'yaml', 'json']

