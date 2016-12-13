" 用vimfiler来代替默认的 netrw
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1

let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$', '\.swp$', '\.swo$' ]

" 关闭默认的安全模式
call vimfiler#custom#profile('default', 'context', {
            \ 'safe' : 0,
            \ })

autocmd FileType vimfiler call s:my_settings()
function! s:my_settings() "{{{

    " 默认快捷键
    " 上一级    <Bspace>
    " 新建目录  K

    nmap <buffer> <Esc> <Plug>(vimfiler_hide)

    " 数字键快速选择
    nmap <buffer> ,1 1j<cr>
    nmap <buffer> ,2 2j<cr>
    nmap <buffer> ,3 3j<cr>
    nmap <buffer> ,4 4j<cr>
    nmap <buffer> ,5 5j<cr>
    nmap <buffer> ,6 6j<cr>
    nmap <buffer> ,7 7j<cr>
    nmap <buffer> ,8 8j<cr>
    nmap <buffer> ,9 9j<cr>

    nmap <buffer> m1 1k<cr>
    nmap <buffer> m2 2k<cr>
    nmap <buffer> m3 3k<cr>
    nmap <buffer> m4 4k<cr>
    nmap <buffer> m5 5k<cr>
    nmap <buffer> m6 6k<cr>
    nmap <buffer> m7 7k<cr>
    nmap <buffer> m8 8k<cr>
    nmap <buffer> m9 9k<cr>


    " 注：不能通过以下方法来阻止默认的映射
    " nunmap Cc
    " nunmap Cm
    " nunmap Cp
    nmap <buffer> <c-c>			<Plug>(vimfiler_clipboard_copy_file)
    nmap <buffer> <c-x>			<Plug>(vimfiler_clipboard_move_file)
    nmap <buffer> <c-v>			<Plug>(vimfiler_clipboard_paste)


endfunction "}}}

