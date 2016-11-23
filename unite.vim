" 据说这个函数可以设置一些统一的配置，no-split不管用？
" call unite#custom#profile('default', 'context', {
" \   'no-split': 1,
" \ })

autocmd FileType unite setlocal number
autocmd FileType unite nmap <buffer> <Esc> q
