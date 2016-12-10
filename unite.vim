
" 默认开启insert mode. 会影响所有sources
" 所以暂时不需要，仅用于演示配置的方法
" 这个 unite#custom#profile 可以设置很多东西，详见帮助
"
" call unite#custom#profile('default', 'context', {
" \   'start_insert' : 1
" \ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{

    " 设置行号，方便定位
    setlocal number
    " 相当于q
    nmap <buffer> <Esc> <Plug>(unite_exit)

    " 数字键快速选择
    nmap <buffer> ,1 1G<cr>
    nmap <buffer> ,2 2G<cr>
    nmap <buffer> ,3 3G<cr>
    nmap <buffer> ,4 4G<cr>
    nmap <buffer> ,5 5G<cr>
    nmap <buffer> ,6 6G<cr>
    nmap <buffer> ,7 7G<cr>
    nmap <buffer> ,8 8G<cr>
    nmap <buffer> ,9 9G<cr>

    " 预览功能开关
    nmap <buffer> <C-p>     <Plug>(unite_toggle_auto_preview)

    " 查看关键字的记录
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)

    " s 打开vimshell
    nnoremap <silent><buffer><expr> s  unite#smart_map('s', unite#do_action('vimshell'))
    nnoremap <silent><buffer><expr> f  unite#smart_map('f', unite#do_action('vimfiler'))

    " let unite = unite#get_current_unite()
    " if unite.profile_name ==# 'search'
    " nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    " else
    " nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    " endif

    " nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    " nnoremap <buffer><expr> S      unite#mappings#set_current_sorters(
    "       \ empty(unite#mappings#get_current_sorters()) ?
    "       \ ['sorter_reverse'] : [])

    " " Runs "split" action by <C-s>.
    " imap <silent><buffer><expr> <C-s>     unite#do_action('split')

endfunction"}}}
