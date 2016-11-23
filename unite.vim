" unite的快捷键设置
" 参考其帮助文档的方法
nnoremap    [unite]   <Nop>
nmap   <Leader> [unite]

nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -no-split -start-insert everything<CR>
nnoremap <silent> [unite]o  :<C-u>Unite -no-split file_mru<CR>
nnoremap <silent> <space>  :<C-u>Unite -no-split -start-insert line<CR>

" 据说这个函数可以设置一些统一的配置，no-split不管用？
" call unite#custom#profile('default', 'context', {
" \   'no-split': 1,
" \ })

autocmd FileType unite setlocal number
