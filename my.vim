set tabstop=4
set shiftwidth=4
set nobackup
set expandtab
set ignorecase
set smartcase
" 显示行号
set number 
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix,dos
set encoding=prc
" 自动缩进
set autoindent
set nowrap
set nowrapscan
set autoread "文件被修改后自动加载"

" {{{ 折叠
" set foldlevel=99
set foldmethod=marker
set foldcolumn=8
set fillchars=vert:\|,fold:\ 
set foldtext=MyFoldText()

fu MyFoldText()
	let line = getline(v:foldstart)
    
    "以下操作对空格的处理只去掉一个，多余的空格将会保留
    "以后查看看有没有trim之类的函数自动去除两端空白字符

    "删掉折叠标记
    "以前的
	"let line = substitute(line, '//'.'< ', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
	let line = substitute(line, '{{'.'{', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
    "删掉各种语言的注释标记
    let line = substitute(line, '<!--\|-->\|^"\|//\|#\|/\*\|\*/', '', 'g')
	return line . ']'
endf
" }}}
