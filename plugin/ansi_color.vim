" 显示终端ansi颜色代码的插件
" 配色方案主要来自于
" AnsiEsc.vim，但由于该插件的syntax语法过时，故重新编写了本插件

function! s:set_ansi()
    set conceallevel=3
    " 必须要指定matchgroup才能conceal
    syn region ansiGreen matchgroup=ansiCode start=/\e\[32m/ end=/\e\[39m/  concealends
endf

hi ansiGreen             ctermfg=green      guifg=green                                        cterm=none         gui=none
hi link ansiCode Quote


autocmd BufRead,BufNewFile * call s:set_ansi()
