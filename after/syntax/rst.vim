scriptencoding 'UTF-8'

let g:rst_use_emphasis_colors=1

syn region rstVarLabelValue start="`" end="`" contained
hi def link rstVarLabelValue Identifier
syn region rstLabelValue start="`" end="`" contained
hi def link rstLabelValue Number

syn match rstEnvvarLabel /:envvar:/ cchar= conceal nextgroup=rstVarLabelValue
syn match rstGuilabelLabel /:guilabel:/ cchar= conceal nextgroup=rstLabelValue
syn match rstFileLabel /:file:/ cchar= conceal nextgroup=rstLabelValue
syn match rstCommandLabel /:command:/ cchar= conceal nextgroup=rstLabelValue
" syn match rstCommandLabel /:command:/ cchar=גּ conceal nextgroup=rstLabelValue
syn match rstProgramLabel /:program:/ cchar= conceal nextgroup=rstLabelValue
syn match rstRefLabel /:ref:/ cchar= conceal nextgroup=rstLabelValue
syn match rstMenuselectionLabel /:menuselection:/ cchar= conceal nextgroup=rstLabelValue
"syn match rstSampLabel /:samp:/ cchar= conceal nextgroup=rstLabelValue
" (גּraboof


syn match rstListMarker /^* /
hi def link rstListMarker Tag


" syn region rstBold matchgroup=rstBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend concealends
" hi def link rstBoldDelimiter rstBold
" hi def rstBold term=bold cterm=bold gui=bold ctermfg=226
syn region rstItalic matchgroup=rstItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend concealends
hi def link rstItalicDelimiter rstItalic
hi def rstItalic term=italic cterm=italic gui=italic ctermfg=229

" exe 'syn region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend contains=markdownLineStart' . s:concealends
" syn region markdownItalic matchgroup=markdownItalicDelimiter start="\S\@<=\*\|\*\S\@=" end="\S\@<=\*\|\*\S\@=" keepend concealends
" exe 'syn region markdownBold matchgroup=markdownBoldDelimiter start="\S\@<=\*\*\|\*\*\S\@=" end="\S\@<=\*\*\|\*\*\S\@=" keepend contains=markdownLineStart,markdownItalic' . s:concealends
" hi def markdownItalic cterm=italic ctermfg=3
