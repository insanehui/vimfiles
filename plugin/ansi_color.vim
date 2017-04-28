" 显示终端ansi颜色代码的插件
" 配色方案主要来自于
" AnsiEsc.vim，但由于该插件的syntax语法过时，故重新编写了本插件

" 注：
" 由于很多ansi颜色库产生的颜色码的规则不一致，暂时没办法兼顾所有情况
" 目前先应付好最近在nodejs中常用的debug, colors颜色

function! s:set_ansi()
    set conceallevel=3
    set concealcursor=n

    " 必须要指定matchgroup才能conceal

    " ======================= 只有字体色 =====================================
    syn region ansiRed matchgroup=ansiCode start=/\v\e\[31(;1)?m/ end=/\v\e\[(39|0)m/  concealends
    syn region ansiGreen matchgroup=ansiCode start=/\v\e\[32(;1)?m/ end=/\v\e\[(39|0)m/  concealends
    syn region ansiYellow matchgroup=ansiCode start=/\v\e\[33(;1)?m/ end=/\v\e\[(39|0)m/  concealends
    syn region ansiBlue matchgroup=ansiCode start=/\v\e\[34(;1)?m/ end=/\v\e\[(39|0)m/  concealends
    syn region ansiMagenta matchgroup=ansiCode start=/\v\e\[35(;1)?m/ end=/\v\e\[(39|0)m/  concealends
    syn region ansiCyan matchgroup=ansiCode start=/\v\e\[36(;1)?m/ end=/\v\e\[(39|0)m/  concealends

    " ======================= 字体色 + 背景色 =====================================
    syn region ansiWhiteRed matchgroup=ansiCode start=/\e\[41m\e\[37m/ end=/\e\[39m\e\[49m/  concealends

endf



" 这里gui界面不使用纯yellow，会刺眼看不清楚
hi ansiRed             ctermfg=red      guifg=red
hi ansiGreen             ctermfg=green      guifg=green                                        cterm=none         gui=none
hi ansiYellow            ctermfg=yellow     guifg=#666600
hi ansiBlue             ctermfg=blue      guifg=blue
hi ansiMagenta             ctermfg=magenta      guifg=magenta
hi ansiCyan             ctermfg=cyan      guifg=cyan

hi ansiWhiteRed          ctermfg=white      ctermbg=red        guifg=White      guibg=Red      cterm=none         gui=none

hi link ansiCode Quote


autocmd BufRead,BufNewFile * call s:set_ansi()
