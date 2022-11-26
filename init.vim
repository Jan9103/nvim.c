set encoding=utf8
scriptencoding utf8

set title titlestring=""

filetype plugin indent on
syntax on
set mouse=
set backspace=eol,start,indent " fix backspace for some devices

set wrap "Wrap lines
set shiftwidth=4
set noerrorbells novisualbell " no sounds
set number rnu " hybrid line numbers

set foldmethod=indent foldlevel=99

" Reopen In Same Line
augroup reopenOnSameLine
	au!
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup end

set incsearch hlsearch
set ignorecase " ignorecase in search
set smartcase " When searching try to be smart about cases

set softtabstop=0
set noexpandtab expandtab!
set tabstop=4

set copyindent preserveindent autoindent smartindent
let &listchars = 'tab:» ,trail:·,precedes:…,extends:…'

set list
set wildmode=longest,list,full
set wildmenu
set pastetoggle=<F2>
set laststatus=2
set whichwrap+=<,>,[,] " go to prev line with left or next with right

" Persistent Undo
" requires .vim_runtime/temp_dirs/undodir/ to exist
"try
"    set undodir=~/.vim_runtime/temp_dirs/undodir
"    set undofile
"catch
"endtry

lua require('init')

if &term =~# 'kitty'
	set termguicolors
elseif &term =~# '^\(screen\|xterm\)$'
	set t_Co=256
endif

colorscheme dracula

hi TreesitterContextBottom gui=underline guisp=Grey
hi TreesitterContext guibg=#303242
hi BookmarkSign guifg=#BD93F9

" vim: fdm=marker fdl=0 noet:
