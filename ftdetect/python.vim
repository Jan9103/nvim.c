augroup pythonFtdetect
	au!
	au BufRead * if getline(1) =~# '^#!.* python3\?$' | set filetype=python | endif
augroup end
