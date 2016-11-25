" 开启之后，可以对文件的路径信息进行筛选。否则（缺省状态）只针对文件名筛选
let g:unite_source_everything_full_path_search = 1
let g:unite_source_everything_limit = 500

" 黑名单还不是很会用，先用着默认的
" let g:unite_source_everything_ignore_pattern='\.svn\|\.git'

let g:unite_source_everything_sort_by_full_path = 1

" 这个选项不知道怎么用，而且选了之后变得慢
" let g:unite_source_everything_posix_regexp_search = 1
