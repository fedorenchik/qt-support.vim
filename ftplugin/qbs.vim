" Vim filetype plugin file
" Language:	Qbs
" Maintainer:	Leonid V. Fedorenchik <leonid@fedorenchik.com>
" URL:	https://github.com/fedorenchik/qt-support.vim
" Last Change:	2018 Jan 28

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl formatoptions< comments< commentstring<"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal formatoptions-=t formatoptions+=croql

" Set 'comments' to format dashed lists in comments. Behaves just like C.
setlocal comments& comments^=sO:*\ -,mO:*\ \ ,exO:*/

setlocal commentstring=//%s
