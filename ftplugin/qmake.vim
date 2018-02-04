" Vim filetype plugin file
" Language:	Qmake
" Maintainer:	Leonid V. Fedorenchik <leonid@fedorenchik.com>
" URL:	https://github.com/fedorenchik/qt-support.vim
" Last Change:	2018 Jan 28

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl fo< com< commentstring< expandtab< tabstop< shiftwidth<"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" Set 'comments' to format dashed lists in comments
setlocal com=sO:#\ -,mO:#\ \ ,b:#

setlocal expandtab tabstop=4 shiftwidth=4

setlocal commentstring=#%s
