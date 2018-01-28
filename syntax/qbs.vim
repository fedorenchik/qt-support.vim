" Vim syntax file
" Language:	Qbs
" Current Maintainer:	Leonid V. Fedorenchik <leonid@fedorenchik.com>
" Previous Maintainer:	John Kaul <john.kaul@outlook.com>
" URL:		https://github.com/fedorenchik/qt-support.vim
" Last Change:	2018 Jan 28

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword qbsCommentTodo      TODO FIXME TBD contained
syn match   qbsLineComment      "\/\/.*" contains=@Spell,qbsCommentTodo
" syn region  qbsCommentL         start="//" skip="\\$" end="$"  keepend contains=@qbsCommentTodo,@Spell
syn match   qbsCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  qbsComment	        start="/\*"  end="\*/" contains=@Spell,qbsCommentTodo

syn match   qbsSpecial	       "\\\d\d\d\|\\."
syn keyword qbsSpecial         import   debug   release
syn region  qbsStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=qbsSpecial,@htmlPreproc
syn region  qbsStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=qbsSpecial,@htmlPreproc

syn match   qbsSpecialCharacter "'\\.'"
syn match   qbsNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  qbsRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword qbsConditional	if else switch
syn keyword qbsRepeat		while for do in
" syn keyword qbsBranch		
syn keyword qbsOperator		concat

syn match qbsOperator           "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=[-!#$%&\*\+<=>\?@\\^|~.][-!#$%&\*\+<=>\?@\\^|~:.]*"

" Reserved symbols--cannot be overloaded.
syn match qbsBrace  "(\|)\|\[\|\]\|,\|:\|;\|_\|{\|}"

"---[ Types ]-----------------------------------------------------------
"---[ A ]---------------------------------------------------------------
syn keyword qbsType             Application
"---[ B ]---------------------------------------------------------------
syn keyword qbsType             bool
"---[ C ]---------------------------------------------------------------
syn keyword qbsType             CppAppliction
"---[ D ]---------------------------------------------------------------
syn keyword qbsType             DynamicLibrary
"---[ E ]---------------------------------------------------------------
"---[ F ]---------------------------------------------------------------
"---[ G ]---------------------------------------------------------------
"---[ H ]---------------------------------------------------------------
"---[ I ]---------------------------------------------------------------
"---[ J ]---------------------------------------------------------------
"---[ K ]---------------------------------------------------------------
"---[ L ]---------------------------------------------------------------
"---[ M ]---------------------------------------------------------------
"---[ N ]---------------------------------------------------------------
syn keyword qbsType             new
"---[ O ]---------------------------------------------------------------
"---[ P ]---------------------------------------------------------------
syn keyword qbsType		property
"---[ Q ]---------------------------------------------------------------
"---[ R ]---------------------------------------------------------------
"---[ S ]---------------------------------------------------------------
syn keyword qbsType		string  stringList
"---[ T ]---------------------------------------------------------------
"---[ U ]---------------------------------------------------------------
"---[ V ]---------------------------------------------------------------
syn keyword qbsType             var
"---[ W ]---------------------------------------------------------------
"---[ X ]---------------------------------------------------------------
"---[ Z ]---------------------------------------------------------------

syn keyword qbsStatement	return  break 
syn keyword qbsBoolean		true    false
syn keyword qbsNull		null    undefined
syn keyword qbsIdentifier	qbs     as
" syn keyword qbsLabel		
" syn keyword qbsException	
" syn keyword qbsMessage		
syn keyword qbsGlobal		Project         project         Product         FileTagger      SubProject      AutotestRunner  
syn keyword qbsGlobal		Properties      Depends         Application     Module          Rule            Artifact
syn keyword qbsMember		filePath        environment     qbsSearchPaths
syn keyword qbsMember	        type            condition       files   fileTags        name    files   references      enviroment
syn keyword qbsMember	        patterns        overrideTags    id      inputs          auxiliaryInputs prepare
"" syn keyword qbsDeprecated	

"---[ Reserved ]--------------------------------------------------------
"---[ A ]---------------------------------------------------------------
syn keyword qbsReserved         additionalLibs  additionalTools
"---[ B ]---------------------------------------------------------------
syn keyword qbsReserved         buildVariant    baseDir
"---[ C ]---------------------------------------------------------------
" syn keyword qbsReserved         cpp     contains Command        compilerPath
syn keyword qbsReserved         cpp     contains
syn keyword qbsReserved         Command         compiler
"---[ D ]---------------------------------------------------------------
syn keyword qbsReserved		debugInformation        Depends description
"---[ E ]---------------------------------------------------------------
"---[ F ]---------------------------------------------------------------
syn keyword qbsReserved         FileTagger      fileName
"---[ G ]---------------------------------------------------------------
syn keyword qbsReserved         Group   getHash
"---[ H ]---------------------------------------------------------------
syn keyword qbsReserved         hostOS  highlight
"---[ I ]---------------------------------------------------------------
syn keyword qbsReserved         input
"---[ J ]---------------------------------------------------------------
"---[ K ]---------------------------------------------------------------
"---[ L ]---------------------------------------------------------------
syn keyword qbsReserved         length
"---[ M ]---------------------------------------------------------------
syn keyword qbsReserved		minimumQbsVersion       moduleProperty moduleProperties ModUtils
"---[ N ]---------------------------------------------------------------
" syn keyword qbsReserved         new
"---[ O ]---------------------------------------------------------------
syn keyword qbsReserved		optimization    output
"---[ P ]---------------------------------------------------------------
syn keyword qbsReserved         parent  push    pathList        product
"---[ Q ]---------------------------------------------------------------
"---[ R ]---------------------------------------------------------------
" syn keyword qbsReserved         Rule
"---[ S ]---------------------------------------------------------------
syn keyword qbsReserved         startsWith      substring
"---[ T ]---------------------------------------------------------------
 syn keyword qbsReserved        targetOS
"---[ U ]---------------------------------------------------------------
"---[ V ]---------------------------------------------------------------
"---[ W ]---------------------------------------------------------------
"---[ X ]---------------------------------------------------------------
"---[ Z ]---------------------------------------------------------------


" syn region qbsFold start="{" end="}" transparent fold
"

"" syn sync fromstart
"" syn sync maxlines=100

"" if main_syntax == "qbs"
""   syn sync ccomment qbsComment
"" endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_qbs_syn_inits")
  if version < 508
    let did_qbs_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink qbsComment		Comment
  HiLink qbsLineComment		Comment
  HiLink qbsCommentTodo		Todo
  HiLink qbsSpecial		Special
  HiLink qbsStringS		String
  HiLink qbsStringD		String
  HiLink qbsCharacter		Character
  HiLink qbsSpecialCharacter	Special
  HiLink qbsNumber		Value
  HiLink qbsConditional		Conditional
  HiLink qbsRepeat		Repeat
  HiLink qbsBranch		Conditional
  HiLink qbsOperator		Operator
  HiLink qbsBrace               Special
  HiLink qbsType		Type
  HiLink qbsStatement		Statement
  HiLink qbsFunction		Function
  HiLink qbsError		Error
  HiLink qbsNull		Keyword
  HiLink qbsBoolean		Boolean
  HiLink qbsRegexpString	String

  HiLink qbsIdentifier		Identifier
  HiLink qbsLabel		Label
  HiLink qbsException		Exception
  HiLink qbsMessage		Keyword
  HiLink qbsGlobal		Keyword
  HiLink qbsMember		Keyword
  HiLink qbsDeprecated		Exception 
  HiLink qbsReserved		Keyword
  HiLink qbsDebug		Debug
  HiLink qbsConstant		Label
  HiLink qbsCommentL		Comment

  delcommand HiLink
endif

let b:current_syntax = "qbs"

let &cpo = s:cpo_save
unlet s:cpo_save
