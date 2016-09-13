set nocompatible
filetype off
syntax on

set tabstop=4
set shiftwidth=4
set nobackup
set expandtab
set ignorecase
set smartcase
set incsearch

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


function! TabCmd(cmd) " {{{
  redir => message

  " 如果不用silent的话，会产生需要和用户交互的环节（比如“按Enter键继续”等）
  silent execute a:cmd

  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    " 如果不设置以下选项，会出现一些不方便的情况
    " 比如，关闭时要询问是否保存
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabCmd call TabCmd(<q-args>) 
" }}}

