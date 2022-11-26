scriptencoding 'UTF-8'

hi markdownHighlight ctermfg=255

hi Conceal ctermbg=NONE

" Todo List Addon: {{{
syn match EmptyTodoMarker /^[	 ]*- \[ \] / contains=EmptyCheckBox
syn match EmptyCheckBox ". \[\ \]" conceal cchar= contained
syn match CompletedTodoMarker /^[	 ]*- \[x\] / nextgroup=CompletedTodoText contains=CheckedBox
syn match CheckedBox ". \[x\]" conceal cchar= contained
syn match CompletedTodoText /.*$/ contained
hi def CompletedTodoText cterm=strikethrough
" }}}

" Conceal Links: {{{
" syn region markdownLinkText matchgroup=markdownLinkTextDelimiter
"     \ start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@="
"     \ nextgroup=markdownLink,markdownId skipwhite
"     \ contains=@markdownInline,markdownLineStart
"     \ concealends
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" keepend contained conceal cchar= contains=markdownUrl
syn region markdownId matchgroup=markdownIdDelimiter start="\[" end="\]" keepend contained conceal cchar=
" }}}
