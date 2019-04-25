" Vim support file to add Qt support to the syntax selection menu.
" This file is normally sourced from menu.vim.
"
" Maintainer:	Leonid V. Fedorenchik <leonid@fedorenchik.com>
" Last Change:	2018 Jan 28

" <> notation is used here, remove '<' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

an 50.90.535 &Syntax.PQ.Qbs :cal SetSyn("qbs")<CR>
an 50.90.538 &Syntax.PQ.qmake :cal SetSyn("qmake")<CR>
an 50.90.539 &Syntax.PQ.QML :cal SetSyn("qml")<CR>
an 50.90.545 &Syntax.PQ.qrc :cal SetSyn("qrc")<CR>

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
