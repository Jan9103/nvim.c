" Suckless sent (presentation format)
" https://tools.suckless.org/sent/

if exists('b:current_syntax')
	finish
endif
let b:current_syntax = 'sent'

syn match Comment /^#.*$/
syn match Constant /^@.*$/ " image
