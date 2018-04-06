if executable('pyls-3')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls-3',
        \ 'cmd': {server_info->['pyls-3']},
        \ 'whitelist': ['python'],
        \ })
endif
