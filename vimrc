set nocompatible

"{{{ vundle配置 
" vundle要求filetype off，具体原因不详
filetype off

" 在这之前要先下载vundle，从github克隆即可
" 官方建议: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 当然不克隆到建议的目录，也是可以的。
" 由于~/.vim/bunble/是vundle的默认工作目录，这样方便vundle自己管理自己
set rtp+=~/.vim/bundle/Vundle.vim 

" 如果是linux
if !has('win32')
    set rtp+=~/vimfiles
endif

" vundle用let来代替set rtp，见下：
" 参考自：https://github.com/VundleVim/Vundle.vim/wiki/Tips-and-Tricks 
" let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
" let vimDir = win_shell ? '$HOME/.vim' : '$HOME/.vim' "这里windows和linux一样
" let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')


" call vundle#begin(expand(vimDir . '/bundle'))

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'neo4j-contrib/cypher-vim-syntax'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'ekalinin/Dockerfile.vim'

Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" 以下这个fork支持函数
Plugin 'LeszekSwirski/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimfiler.vim'
" Plugin 'Shougo/vinarise.vim'

Plugin 'sgur/unite-everything'
Plugin 'Konfekt/FastFold'
Plugin 'insanehui/bufexplorer.zip'
" tpope大神也写了一个
" Plugin 'plasticboy/vim-markdown'

Plugin 't9md/vim-choosewin'

" Plugin 'amerlyq/nou.vim'
" Plugin 'vimoutliner/vimoutliner'
Plugin 'insanehui/vimoutliner'
Plugin 'utl.vim'
let g:utl_cfg_hdl_mt_text_html='VIM'

" 这个怎么不起作用？
"let g:utl_cfg_hdl_mt_application_gp5 = ':silent !start "%P"'

" 试了之后没有作用啊
" Plugin 'AnsiEsc.vim'

" 每次保存都要弹出一个cmd框，故去掉
" Plugin 'mhinz/vim-signify'

" 这个插件居然要vim 8？
" Plugin 'chrisbra/changesPlugin'

" Plugin 'kana/vim-textobj-entire'
" Plugin 'textobj-entire'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'TabBar'
" Plugin 'FavEx'
" Plugin 'mru.vim'
" Plugin 'bufexplorer.zip'

"{{{ vim-go 
Plugin 'fatih/vim-go'
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
"
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0

" 缺省用guru全能工具来转到定义，但仅仅是找定义这一块，还是godef做得更好
let g:go_def_mode = 'godef'

"}}}

"{{{ snippets
Plugin 'SirVer/ultisnips'

" snips太多不方便管理，这个库仅供参考，自己的snips自己维护更好
" Plugin 'honza/vim-snippets'

let g:UltiSnipsJumpForwardTrigger        = "<c-k>"
let g:UltiSnipsJumpBackwardTrigger       = "<c-j>"

" 手动建了该目录之后，貌似默认会设为该路径
let g:UltiSnipsSnippetsDir = "~/vimfiles/UltiSnips"

"}}}

"{{{ vimproc 
" 好像使用了vim8之后，应该就不需要vimproc了
Plugin 'Shougo/vimproc.vim'
"}}}

"{{{ vimshell 
" Plugin 'Shougo/vimshell.vim'
"}}}

"{{{ neocomplete 
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
"}}}

"{{{ nerdtree 
" Plugin 'scrooloose/nerdtree'

" 自动打开nerdtree，并打开书签
" autocmd vimenter * NERDTree | set number | exec 'normal B' 

" 启动空vim的时候，打开nerdtree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | set number | exec 'normal Bj' | endif
" 只剩nerdtree的时候，自觉退出vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree相关
" noremap <C-n> :NERDTreeToggle<CR>
""}}}

"{{{ 状态栏 
" 由于不支持prc的编码，只能不用该插件
" Plugin 'vim-airline/vim-airline'
"}}}

"{{{ 前端 
" 平时用得不多，注释掉
" Plugin 'maksimr/vim-jsbeautify'
Plugin 'elzr/vim-json'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

"}}}

"{{{ 主题配色
" 暂时注释了这些主题，因为目前使用的是~/vimfiles/colors/vs.vim

" 大合集
" Plugin 'flazz/vim-colorschemes'

" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
" Plugin 'phd'
"}}}

"{{{ markdown预览的插件 
" Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 1
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令
"}}}

call vundle#end()
" 在vundle end之后，开启plugin indent syntax on，这样实际上filetype也相当于是on的？
" }}}

"{{{ 插件的配置
source ~/vimfiles/unite-everything.vim
source ~/vimfiles/unite.vim
" source ~/vimfiles/vimshell.vim
source ~/vimfiles/vimfiler.vim
"}}}

filetype plugin indent on
syntax on

"{{{ 小程序的js文件类型设置，在jsx基础上添加一些扩展
" 
" 按道理说类型的识别应该是放在 ftdetect
" 目录下，但是会被jsx的插件给覆盖，所以只能写到vimrc下了
au BufRead,BufNewFile */WeChatProjects/*.js set filetype=javascript.jcx.wxjs
" }}}

"{{{ 主题设置
" 同一个主题，似乎背景也可以有dark和light的模式
if has('win32')
    colorscheme vs
endif
" set background=light 
" }}}

set viewdir=~/.vimview
set backspace =indent,eol,start "使插入状态下能正常使用退格键
set tabstop=4
set shiftwidth=4
set smarttab
set nobackup
set expandtab
set ignorecase
set smartcase
set incsearch
set shiftround
set guifont=fixedsys:h12 "设置字体大小

" 显示坐标、当前位置百分比
set ruler
" 切换buffer不需要保存
set hidden

" 光标的坐标线
" set cursorline
" set cursorcolumn

" 显示行号
set number 
set relativenumber

"{{{ 编码设置 

set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
" windows gvim忽略该选项
set termencoding=utf-8
set fileformats=unix,dos

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 以下这两行据说是解决菜单问题，但是没起作用，也不知道是什么含义
" set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8


"}}}

" 自动缩进
set autoindent
set nowrap
set nowrapscan
set autoread "文件被修改后自动加载"
set showcmd

" 自动读、自动加载（不再弹出文件已经被修改，是否重新加载的提示框）
set autoread
" 自动写，比如在make，next等命令等待的时候，可以保存文件
set autowrite
set scrolloff=3


"{{{ 折叠 
" set foldlevel=99
set foldmethod=marker
set foldcolumn=8
set fillchars=vert:\|,fold:\ 
set foldtext=MyFoldText20161203()

function! MyFoldText20161203()
	let line = getline(v:foldstart)
    
    "以下操作对空格的处理只去掉一个，多余的空格将会保留
    "以后查看看有没有trim之类的函数自动去除两端空白字符

    "删掉折叠标记
    let line = substitute(line, '{{'.'{', '[', 'g') "这里使用.来连接字符串于是为了防止产生折叠
    "删掉各种语言的注释标记
    let line = substitute(line, '<!--\|-->\|^"\|//\|#\|/\*\|\*/', '', 'g')
	return line . ' ]'
endf

function! SyntaxFoldText()
	let begin = getline(v:foldstart)

    " 似乎没有必要把\t转成空格吧
    " let line = substitute(line, '\t', '    ', 'g')
    let fend = getline(v:foldend)
    let fend = substitute(fend, '^\s*', '', 'g') 

    return begin . '...' . fend
endf

" }}}

"{{{ 自动命令 ======================================
"
"{{{ graduate.otl 回车键自动发送当前句子
"autocmd BufRead graduate.otl nnoremap <cr> ^v$hypa，
" 跟上句是等价的
autocmd BufRead graduate.otl nnoremap <buffer> <cr> ^v$hy<c-w><c-w>pa，<esc><c-w><c-w>
"}}}
"
"
" 全屏 -------------------------------------
" （for Linux）
" fun! ToggleFullscreen()
"     call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
" endf

"{{{ 启动时最大化
fun! Maximize() "for Windows
    call system("nircmdc win max class Vim")
endf
autocmd GUIEnter * call Maximize()
"}}}

" 自动CD到当前目录 --------------------------
" set autochdir
autocmd BufEnter * silent! lcd %:p:h

" 自动保存和加载view
autocmd BufRead *.otl loadview
autocmd BufWritePost *.otl mkview
" autocmd FileType help echo 'haha'


" 如果是index.js，定义一些快捷命令
function! IndexJsCopy() 
    call system('xcopy ' . expand('%:p:h') . '\*.* ' . expand('~/react_playground2/src') . ' /e /y')
endfunction
" 快速拷贝到playground目录的快捷键
autocmd BufRead,BufNewFile index.js nnoremap <buffer> <s-cr> :call IndexJsCopy()<cr>

" 暂时注释掉，因为通常build操作都由make脚本来完成
" function! IndexJsBuild() 
"     call IndexJsCopy()
"     execute ('!cd ' . expand('~/react_playground/src') . '&& npm run build ')
" endfunction
" autocmd BufRead index.js nnoremap <buffer> ,b :call IndexJsBuild()<cr>

" nodejs快速执行一个文件
function! NodeRunFile() 
    " 把当前文件拷到playground
    call system('copy ' . expand('%') . ' ' . expand('~/react_playground/src/'))
    " 执行babel-node
    " call system('cd ' . expand('~/node_playground/') . ' & babel-node ' . expand('%') . ' & pause') "这种方式无法显示输出并且与用户交互
    execute '!start cmd /k cd ' . expand('~/react_playground/') . ' & babel-node src/' . expand('%')
endfunction
autocmd BufRead,BufNewFile *.js nnoremap <buffer> <F5> :call NodeRunFile()<cr>

" nodejs快速执行一个文件带参数
function! NodeRunFileWithArgs() 
    " 把当前文件拷到playground
    call system('copy ' . expand('%') . ' ' . expand('~/react_playground/src/'))
    call inputsave()
    let args = input('Enter args: ')
    call inputrestore()
    execute '!start cmd /k cd ' . expand('~/react_playground/') . ' & babel-node src/' . expand('%') . ' ' . args
endfunction
autocmd BufRead,BufNewFile *.js nnoremap <buffer> <C-F5> :call NodeRunFileWithArgs()<cr>

" nodejs快速执行一个工程. 并以当前文件作为入口
function! NodeRunProj() 
    call system('xcopy ' . expand('%:p:h') . '\*.* ' . expand('~/react_playground/src') . ' /e /y')
    execute '!start cmd /k cd ' . expand('~/react_playground/') . ' & babel-node src/' . expand('%')
endfunction
autocmd BufRead,BufNewFile *.js nnoremap <buffer> <S-F5> :call NodeRunProj()<cr>

" react快速执行一个文件
function! ReactRunFile()
    " 这是临时用法，后续完善起来
    " if getline(1) =~# '\<React\>'
    nnoremap <buffer> <F6> :call system('copy ' . expand('%') . ' ' . expand('~/react_playground2/src/index.js'))<cr>
    " endif
endfun

autocmd BufNewFile,BufRead *.js call ReactRunFile()

" 将msc文件转为jcx文件
function! Msc2Jcx()
    execute 'w'
    execute '!start cmd /c msc2jcx2 < ' . expand('%') . ' \| iconv -f UTF-8 -t GBK >' . expand('%:t:r'). '.jcx & clip < ' . expand('%:t:r') . '.jcx & refreshMuse.ahk'
endfun

function! SetMscFileHotkey()
    " 心得：这里用call system的话好像不能正确地执行管道
    " 所以改用!start，并且要用cmd /c，这样会自动关闭黑窗口
    " 经尝试，要使用GBK，GB2312不好用
    " nnoremap <buffer> <s-cr> :execute '!start cmd /c msc2jcx < ' . expand('%') . ' \| iconv -f UTF-8 -t GB2312 >' . expand('%:t:r'). '.jcx'<cr>
    " nnoremap <buffer> <s-cr> :execute '!start cmd /c msc2jcx2 < ' . expand('%') . ' \| iconv -f UTF-8 -t GBK >' . expand('%:t:r'). '.jcx & clip < ' . expand('%:t:r') . '.jcx ' <cr>
    nnoremap <buffer> <s-cr> :call Msc2Jcx()<cr>
endfun

autocmd BufNewFile,BufRead *.msc call SetMscFileHotkey()

"}}}

"{{{ ahk（autohotkey）文件执行快捷键
autocmd BufNewFile,BufRead *.ahk nnoremap <buffer> <F5> :!start %<cr>
"}}}

"{{{ 将mc3的相关设置

" 转jcx并刷新muse
function! Msc2Jcx3()
    execute 'wa'
    execute '!start cmd /c msc2jcx3 ' . expand('%') . ' \| iconv -f UTF-8 -t GBK >' . expand('%:t:r'). '.jcx & clip < ' . expand('%:t:r') . '.jcx & refreshMuse.ahk'
    "execute '!start cmd /c msc2jcx3 ' . expand('%') . ' \| iconv -f UTF-8 -t GBK >' . expand('%:t:r'). '.jcx'
endfun

" 转jcx并刷新有谱么
function! Msc2Yoopume()
    execute 'wa'
    execute '!start cmd /c msc2jcx3 ' . expand('%') . ' \| iconv -f UTF-8 -t GBK >' . expand('%:t:r'). '.jcx & refreshYoopume.ahk '. expand('%:t:r'). '.jcx' 
endfun

" mc3转gp5
function! Msc2Gp5()
    execute 'wa'
    "execute '!start cmd /c msc2gp5 ' . expand('%') . ' >' . expand('%:t:r'). '.gp5 & start ' .expand('%:t:r') . '.gp5' 
    execute '!start cmd /c msc2gp5 ' . expand('%') . ' >' . expand('%:t:r'). '.gp5'
endfun

function! SetMc3Hotkey()
    nnoremap <buffer> <s-cr> :call Msc2Jcx3()<cr>

    " alt键 alt+enter
    nnoremap <buffer> <F6> :call Msc2Yoopume()<cr>
    nnoremap <buffer> <F5> :call Msc2Gp5()<cr>
endfun

autocmd BufNewFile,BufRead *.mc3 call SetMc3Hotkey()
"}}}

"{{{ 全局命令

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

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

" }}}
command! -nargs=+ -complete=command TabCmd call TabCmd(<q-args>) 
command! -nargs=* -complete=command Pi PluginInstall <args>

" 加载vimrc
command! -complete=command Vc e $MYVIMRC
command! -complete=command Sc so $MYVIMRC

" ultisnips
command! -complete=command Use UltiSnipsEdit

function! SwitchWindowByClass(name) " {{{ 根据窗口类切换windows的窗口
    call vimproc#system("nircmdc win activate class " . a:name)
    call vimproc#system("nircmdc win max class " . a:name)
endfunction
" }}}

function! SwitchWindowByName(name) " {{{ 根据进程名切换windows的窗口
    call vimproc#system("nircmdc win activate process " . a:name)
    call vimproc#system("nircmdc win max process " . a:name)
endfunction
" }}}

function! SwitchWindowById(name) " {{{ 根据窗口id切换windows的窗口
    call vimproc#system("nircmdc win activate class " . a:name)
    call vimproc#system("nircmdc win max class " . a:name)
endfunction
" }}}

function! SwitchWindowByTitle(name) " {{{ 根据窗口标题切换windows的窗口
    call vimproc#system("nircmdc win activate ititle " . a:name)
    call vimproc#system("nircmdc win max ititle " . a:name)
endfunction
" }}}

function! SwitchWindowByHandle(h) " {{{ 根据窗口句柄切换windows的窗口
    " 注：h是变量的名字，还不代表变量的值（相当于"指针"的"指针"的关系）
    " 故用exe来得到真正传入的变量
    execute 'let handle_name=g:' . a:h 
    " echo handle_name
    call vimproc#system("nircmdc win activate handle 0x" . handle_name)
    " call vimproc#system("nircmdc win max class " . a:name)
endfunction
" }}}

" 切换到QQBrowser
command! -complete=command Qb call SwitchWindowByClass('QQBrowser_WidgetWin_1')

" 切换到chrome
command! -complete=command Cr call SwitchWindowByName('chrome.exe')

" 用法示例：let app='000A0324' 这里是用工具查到其句柄
" :W app
" 则切换到app对应的窗口，这对同时打开多个同类型的窗口（比如终端界面）时比较有用
command! -nargs=+ -complete=command W call SwitchWindowByHandle(<q-args>)
command! -nargs=+ -complete=command T call SwitchWindowByTitle(<q-args>)


" vimshell
" 后面根据需要再映射 当前目录，buffer目录等
" nnoremap <silent> <Leader>sp   :<C-u>:VimShell -project<CR>
" nnoremap <silent> <Leader>sc   :<C-u>:VimShellCurrentDir<CR>
" command! -complete=command S VimShellCurrentDir -buffer-name=sss

"}}}

"{{{ 全局快捷键 keymaps ================================
" 非全局的快捷键建议放在对应插件的文件中
" 注：可以用来作leader的按键有：
" <Bslash>, <bspace>, F1~F12, -, <tab>, <Enter>等

" 体验一下用jk来代替<esc>
" 好像在ex command中这样映射会有问题，所以只映射插入模式
" 但好像jk不能体验<esc>那种强迫症的狂按的感觉，想想还是取消吧
" imap <esc> <Nop>
" inoremap jk <esc>

" 对于一些使用到 localleader 的插件，比如vimoutliner, 暂时将leader定为","
let maplocalleader=','

" 用于vimoutliner ------------------------------
nmap ,x ,cb,cx
" 在行尾增加一个时间戳
" nmap T A<space>[<C-R>=strftime("%c")<CR>]<Esc>
nmap T A<space>[<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>]<Esc>
" 打上[x]，并加上时间戳，这里,T 和 ,D是otl里的映射
nmap X I]<space><Esc>,Tx,DI[<Esc>,x

" utl ------------------------------
nnoremap <c-cr> :Utl<cr>

" bufexplorer
" 仅取消 \be, \bs等
let g:bufExplorerDisableDefaultKeyMapping=1
nnoremap <silent> <Leader>b :BufExplorer<CR>
nnoremap <silent> <Leader>fb :BufExplorer<CR>


" unite
" nnoremap <silent> <Leader>f  :<C-u>Unite -vertical-preview -no-split file<CR>
" bookmark可以指定多个收藏夹，缺省为default。暂时用一个default够用
nnoremap <silent> <Leader>m  :<C-u>Unite -vertical-preview -no-split -default-action=vimfiler bookmark<CR>
nnoremap <silent> <Leader>x  :<C-u>Unite -vertical-preview -no-split -start-insert everything<CR>
nnoremap <silent> <Leader>o  :<C-u>Unite -vertical-preview -no-split file_mru<CR>
nnoremap <silent> <space>    :<C-u>Unite -vertical-preview -no-split -start-insert line<CR>
nnoremap <silent> <Leader>d  :<C-u>Unite -buffer-name=directory -no-split -start-insert -default-action=vimfiler neomru/directory<CR>
nnoremap <silent> <Leader>r  :<C-u>UniteResume<CR>
" 直接用Unite grep，在windows上不支持
nnoremap <silent> <Leader>g  :<C-u>Unite -vertical-preview -no-split vimgrep<CR><CR>

" vimfiler
nnoremap <silent> <Leader>f  :<C-u>VimFilerCurrentDir -auto-cd -buffer-name=vimfiler<CR>
nnoremap <silent> <Leader>p  :<C-u>VimFiler -project  -auto-cd -buffer-name=vimfiler<CR>

" fugitive
nnoremap <silent> gs  :<C-u>Gstatus<CR>
nnoremap <silent> gh  :<C-u>Gpush<CR>

" commentary.vim 
map <Leader><Bslash> gc
" !!注：与 tabular 排版的快捷键重复，但其是在visual mode，因此不冲突
nmap <Leader><Space> gcc

" choosewin -------------------
" ctrl加-
" nmap   <Plug>(choosewin)
nmap - <Plug>(choosewin)
" 大字号的标签，用起来感觉很晃眼，暂时禁掉
" let g:choosewin_overlay_enable = 1

" 将词移到右边（交换两个词的位置）
nnoremap <silent> gr "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

" 快捷复制和粘贴到系统剪贴板
" 但好像还是有问题
noremap <Leader>y "+y
" 用 shift + insert 粘贴，不用\p
" noremap <Leader>p "+p

" tabular，生成表格
" ？现在暂时不会如何映射成operator pending的模式
vnoremap <Leader>t :Tabularize /
" !!注：与 注释 的快捷键重复，但其是normal mode
vnoremap <Leader><Space> :Tabularize /<Bar><cr>

" 切换查找高亮
nnoremap <F3> :set hls!<CR>

" 左右移屏
nnoremap <c-h> zh
nnoremap <c-l> zl

" 查看oldfiles
" noremap <Leader>o :browse old<cr>

" 打开当前文件，这里传到vimproc#system处要转义一次"\"
" noremap ge :call vimproc#system('explorer /select,' . substitute(expand('%:p'), '\\', '\\\\', 'g'))<cr>
noremap ge :execute '!start explorer /select,' . expand('%:p')<cr>

" 打开git bash
noremap gb :call vimproc#system_bg('C:\\Program\ Files\\Git\\git-bash.exe --cd=' . substitute(expand('%:p:h'), '\\', '\\\\', 'g'))<cr>

" 打开cmd
noremap <Leader>c :execute '!start cmd /k cd ' . expand('%:p:h')<cr>

"{{{ 切换字符编码
function! ToggleEncoding()
    if &encoding == "utf-8"
        set encoding=prc
    else
        set encoding=utf-8
    endif
endf
"}}}
nnoremap <c-q> :call ToggleEncoding()<cr>

"}}}

"{{{ 其他一些供参考的配置 

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" autocmd BufWritePost ~/vimfiles/*.vim source %
"  }}}

