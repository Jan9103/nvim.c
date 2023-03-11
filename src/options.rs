use crate::util::o;

pub fn init() {
	o("foldlevel", 99);
	o("encoding", "utf8");

	// controls
	o("mouse", "nv");
	o("backspace", "eol,start,indent");
	o("whichwrap", "<>[]hlb,s");

	// design
	o("wrap", true);
	o("number", true);
	o("relativenumber", true);
	o("errorbells", false);
	o("visualbell", false);

	// search
	o("incsearch", true);
	o("hlsearch", true);
	o("ignorecase", true);
	o("smartcase", true);
}
