" 默认的快捷键备忘
" insert mode:
" <c-l> 打开命令历史的unite

" 下面是抄的示例
let g:vimshell_prompt_expr =
\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" let g:vimshell_force_overwrite_statusline = 1

" 设置文件类型的打开方式
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
call vimshell#set_execute_file('doc', 'winword')

" .vimshrc的路径
let g:vimshell_vimshrc_path = expand('~/vimfiles/.vimshrc')

autocmd FileType vimshell call s:my_settings()
function! s:my_settings() "{{{
    " 测试
    call vimshell#altercmd#define('g', 'git')
endfunction "}}}
