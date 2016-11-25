" 据说这个函数可以设置一些统一的配置，no-split不管用？
" call unite#custom#profile('default', 'context', {
" \   'no-split': 1,
" \ })

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings() "{{{

    " 设置行号，方便定位
    setlocal number
    " 相当于q
    nmap <buffer> <Esc> <Plug>(unite_exit)

    " 预览功能开关
    nmap <buffer> <C-p>     <Plug>(unite_toggle_auto_preview)

    " 查看关键字的记录
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)

    " s 打开vimshell
    nnoremap <silent><buffer><expr> s  unite#smart_map('s', unite#do_action('vimshell'))

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
