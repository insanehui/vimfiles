" 用vimfiler来代替默认的 netrw
let g:vimfiler_as_default_explorer = 1

let g:vimfiler_ignore_pattern = ['^\.git$', '^\.DS_Store$']

autocmd FileType vimfiler call s:my_settings()
function! s:my_settings() "{{{
    nmap <buffer> <Esc> <Plug>(vimfiler_hide)
endfunction "}}}

