set nocompatible

" {{{ vundle配置
" vundle要求filetype off，具体原因不详
filetype off

" 在这之前要先下载vundle，从github克隆即可
" 官方建议: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 当然不克隆到建议的目录，也是可以的。
" 由于~/.vim/bunble/是vundle的默认工作目录，这样方便vundle自己管理自己
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'phd'

call vundle#end()
" 在vundle end之后，开启plugin indent syntax on，这样实际上filetype也相当于是on的？
" }}}

filetype plugin indent on
syntax on

" {{{ 主题设置
" 同一个主题，似乎背景也可以有dark和light的模式
" colorscheme desert
" set background=light 
" }}}

set tabstop=4
set shiftwidth=4
set nobackup
set expandtab
set ignorecase
set smartcase
set incsearch

" 光标的坐标线
" set cursorline
" set cursorcolumn

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
set showcmd

" 快捷复制和粘贴到系统剪贴板
" 但好像还是有问题
map <Leader>y "+y
map <Leader>p "+p


" {{{ 折叠
" set foldlevel=99
set foldmethod=marker
set foldcolumn=8
set fillchars=vert:\|,fold:\ 
set foldtext=MyFoldText()

function! MyFoldText()
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

" 定义成Ex命令
command! -nargs=+ -complete=command TabCmd call TabCmd(<q-args>) 
" }}}

" {{{ 其他一些供参考的配置 

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 全屏函数
" fun! ToggleFullscreen()
"     call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
" endf

"  }}}


