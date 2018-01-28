" Vim syntax file
" Language:	QML
" Current Maintainer:	Leonid V. Fedorenchik <leonid@fedorenchik.com>
" Previous Maintainer:	Warwick Allison <warwick.allison@nokia.com>
" URL:		https://github.com/fedorenchik/qt-support.vim
" Last Change:	2018 Jan 28
" Comments:	Based on javascript syntax (as is QML)

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn case ignore

syn keyword qmlCommentTodo      TODO FIXME XXX TBD contained
syn match   qmlLineComment      "\/\/.*" contains=@Spell,qmlCommentTodo
syn match   qmlCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  qmlComment	       start="/\*"  end="\*/" contains=@Spell,qmlCommentTodo
syn match   qmlSpecial	       "\\\d\d\d\|\\."
syn region  qmlStringD	       start=+"+  skip=+\\\\\|\\"\|\\$+  end=+"\|$+  contains=qmlSpecial,@htmlPreproc
syn region  qmlStringS	       start=+'+  skip=+\\\\\|\\'\|\\$+  end=+'\|$+  contains=qmlSpecial,@htmlPreproc

syn match   qmlCharacter        "'\\.'"
syn match   qmlNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  qmlRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syn match   qmlObjectLiteralType "[A-Za-z][_A-Za-z0-9]*\s*\({\)\@="
syn match   qmlNonBindingColon "?[^;]*:"
syn match   qmlBindingProperty "\<[A-Za-z][_A-Za-z.0-9]*\s*:"
syn match   qmlIdProperty "\<id\s*:\s*[A-Za-z][_A-Za-z.0-9]*"

syn keyword qmlConditional	if else switch
syn keyword qmlRepeat		while for do in
syn keyword qmlBranch		break continue
syn keyword qmlOperator		new delete instanceof typeof
syn keyword qmlType		Array Boolean Date Function Number Object String RegExp
syn keyword qmlStatement		return with
syn keyword qmlBoolean		true false
syn keyword qmlNull		null undefined
syn keyword qmlIdentifier	arguments this var
syn keyword qmlLabel		case default
syn keyword qmlException		try catch finally throw
syn keyword qmlMessage		alert confirm prompt status
syn keyword qmlGlobal		self
syn keyword qmlReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

if exists("qml_fold")
    syn match	qmlFunction      "\<function\>"
    syn region	qmlFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match qmlSync	grouphere qmlFunctionFold "\<function\>"
    syn sync match qmlSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword	qmlFunction      function
    syn match	qmlBraces	   "[{}\[\]]"
    syn match	qmlParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "qml"
  syn sync ccomment qmlComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_qml_syn_inits")
  if version < 508
    let did_qml_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink qmlComment		Comment
  HiLink qmlLineComment		Comment
  HiLink qmlCommentTodo		Todo
  HiLink qmlSpecial		Special
  HiLink qmlStringS		String
  HiLink qmlStringD		String
  HiLink qmlCharacter		Character
  HiLink qmlNumber		Number
  HiLink qmlConditional		Conditional
  HiLink qmlRepeat		Repeat
  HiLink qmlBranch		Conditional
  HiLink qmlOperator		Operator
  HiLink qmlType			Type
  HiLink qmlObjectLiteralType	Type
  HiLink qmlStatement		Statement
  HiLink qmlFunction		Function
  HiLink qmlBraces		Function
  HiLink qmlError		Error
  HiLink qmlNull			Keyword
  HiLink qmlBoolean		Boolean
  HiLink qmlRegexpString		String

  HiLink qmlIdentifier		Identifier
  HiLink qmlLabel		Label
  HiLink qmlException		Exception
  HiLink qmlMessage		Keyword
  HiLink qmlGlobal		Keyword
  HiLink qmlReserved		Keyword
  HiLink qmlDebug		Debug
  HiLink qmlConstant		Label
  HiLink qmlNonBindingColon	NONE
  HiLink qmlBindingProperty	Label
  HiLink qmlIdProperty		Identifier

  delcommand HiLink
endif

let b:current_syntax = "qml"

let &cpo = s:cpo_save
unlet s:cpo_save
