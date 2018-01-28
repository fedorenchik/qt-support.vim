" Vim indent file
" Language:             QML
" Current Maintainer:   Leonid V. Fedorenchik <leonid@fedorenchik.com>
" Previous Maintainer:  Robert Keiffer
" URL:                  https://github.com/fedorenchik/qt-support.vim
" Latest Revision:      2018 Jan 28

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetJsIndent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,*<Return>,=*/

" Only define functions once per session
if exists("*GetJsIndent")
  finish
endif

" Clean up a line of code by removing trailing '//' comments, and trimming
" whitespace
function! Trim(line)
  return substitute(substitute(a:line, '// .*', '', ''), '^\s*\|\s*$', '', 'g')
endfunction

function! GetJsIndent()
  let num = v:lnum
  let line = Trim(getline(num))

  let pnum = prevnonblank(num - 1)
  if pnum == 0
    return 0
  endif
  let pline = Trim(getline(pnum))

  let ind = indent(pnum)

  " bracket/brace/paren blocks
  if pline =~ '[{[(]$'
    let ind += &sw
  endif
  if line =~ '^[}\])]'
    let ind -= &sw
  endif

  " '/*' comments
  if pline =~ '^/\*.*\*/'
    " no indent for single-line form
  elseif pline =~ '^/\*'
    let ind += 1
  elseif pline =~ '^\*/'
    let ind -= 1
  endif

  return ind
endfunction
