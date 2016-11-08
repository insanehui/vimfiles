" setlocal encoding=utf-8

setlocal foldmethod=syntax
setlocal foldtext=MyGoFoldText()

function! MyGoFoldText()
	let line = getline(v:foldstart)
    
    "以下操作对空格的处理只去掉一个，多余的空格将会保留
    "以后查看看有没有trim之类的函数自动去除两端空白字符

    "删掉折叠标记
    "以前的
	"let line = substitute(line, '//'.'< ', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
	let line = substitute(line, '{{'.'{', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
    "删掉各种语言的注释标记
    let line = substitute(line, '\t', '    ', 'g')
    let fend = getline(v:foldend)
    return line . '...' . fend
endf

nnoremap <buffer> <Leader>f :GoFmt<cr>
" nnoremap <buffer> <Leader>b <Plug>(go-build)
nnoremap <buffer> <Leader>b :GoBuild<cr>
