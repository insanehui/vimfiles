" 显示终端ansi颜色代码的插件
" 配色方案主要来自于
" AnsiEsc.vim，但由于该插件的syntax语法过时，故重新编写了本插件

" 注：
" 由于很多ansi颜色库产生的颜色码的规则不一致，暂时没办法兼顾所有情况
" 目前先应付好最近在nodejs中常用的debug, colors颜色

function! s:set_ansi()
    setlocal conceallevel=3
    setlocal concealcursor=n

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
    syn region ansiWhiteGreen matchgroup=ansiCode start=/\e\[42m\e\[37m/ end=/\e\[39m\e\[49m/  concealends
    syn region ansiWhiteYellow matchgroup=ansiCode start=/\e\[43m\e\[37m/ end=/\e\[39m\e\[49m/  concealends
    syn region ansiWhiteBlue matchgroup=ansiCode start=/\e\[44m\e\[37m/ end=/\e\[39m\e\[49m/  concealends
    syn region ansiWhiteMagenta matchgroup=ansiCode start=/\e\[45m\e\[37m/ end=/\e\[39m\e\[49m/  concealends
    syn region ansiWhiteCyan matchgroup=ansiCode start=/\e\[46m\e\[37m/ end=/\e\[39m\e\[49m/  concealends

endf



" 这里gui界面不使用纯yellow，会刺眼看不清楚
hi ansiRed             ctermfg=red      guifg=red
hi ansiGreen             ctermfg=green      guifg=green                                        cterm=none         gui=none
hi ansiYellow            ctermfg=yellow     guifg=#666600
hi ansiBlue             ctermfg=blue      guifg=blue
hi ansiMagenta             ctermfg=magenta      guifg=magenta
hi ansiCyan             ctermfg=cyan      guifg=cyan

hi ansiWhiteRed          ctermfg=white      ctermbg=red        guifg=White      guibg=Red      cterm=none         gui=none
hi ansiWhiteGreen          ctermfg=white      ctermbg=green        guifg=White      guibg=Green
hi ansiWhiteYellow          ctermfg=white      ctermbg=yellow        guifg=White      guibg=#666600
hi ansiWhiteBlue          ctermfg=white      ctermbg=blue        guifg=White      guibg=Blue
hi ansiWhiteMagenta          ctermfg=white      ctermbg=magenta        guifg=White      guibg=Magenta
hi ansiWhiteCyan          ctermfg=white      ctermbg=cyan        guifg=White      guibg=Cyan

hi link ansiCode Quote


autocmd BufRead,BufNewFile * call s:set_ansi()
