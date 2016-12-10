" 用vimfiler来代替默认的 netrw
let g:vimfiler_as_default_explorer = 1

let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '\.swp$', '\.swo$' ]

" 关闭默认的安全模式
call vimfiler#custom#profile('default', 'context', {
            \ 'safe' : 0,
            \ })

autocmd FileType vimfiler call s:my_settings()
function! s:my_settings() "{{{
    nmap <buffer> <Esc> <Plug>(vimfiler_hide)

    " 注：不能通过以下方法来阻止默认的映射
    " nunmap Cc
    " nunmap Cm
    " nunmap Cp
    nmap <buffer> <c-c>			<Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer> <c-x>			<Plug>(vimfiler_clipboard_move_file)
    nmap <buffer> <c-v>			<Plug>(vimfiler_clipboard_paste)
endfunction "}}}

