use crate::util::g;
use nvim_oxi::api::{
	opts::SetKeymapOpts,
	types::Mode,
	set_keymap,
};

fn map(mode: Mode, key: &str, cmd: &str, args: &SetKeymapOpts) {
	set_keymap(mode, key, cmd, args)
		.expect(format!("Failed to map {} to {}", key, cmd).as_str());
}

fn map_fn<F>(mode: Mode, key: &str, function: F, remap: bool)
where F: nvim_oxi::api::ToFunction<(), ()> {
	set_keymap(mode, key, "",
			&SetKeymapOpts::builder()
				.noremap(remap)
				.callback(function)
				.nowait(true)
				.build()
	).expect(format!("Failed to map {} to a function", key).as_str());	
}

pub fn init() {
	g("mapleader", "f");
	let noremap = SetKeymapOpts::builder().noremap(true).nowait(true).build();
	let remap = SetKeymapOpts::builder().noremap(false).nowait(true).build();

	map(Mode::Normal, "q", ":q<CR>", &noremap);
	map(Mode::Normal, "<F3>", ":set nornu nonu list!<CR>", &noremap);
	map(Mode::Normal, "<leader>s", ":sor i<CR>", &noremap);

	// half-insert-mode
	map(Mode::Normal, " ", "i <Esc>l", &noremap);
	map(Mode::Normal, "<Return>", "o<Esc>", &noremap);
	map(Mode::Normal, "<BackSpace>", "hx", &noremap);
	
	// move lines
	map(Mode::Normal, "<S-up>", ":m .-2<CR>==", &noremap);
	map(Mode::Normal, "<S-down>", ":m .+1<CR>==", &noremap);

	// split navigation
	map(Mode::Normal, "<C-left>", "<C-w>h", &noremap);
	map(Mode::Normal, "<C-right>", "<C-w>l", &noremap);
	map(Mode::Normal, "<C-down>", "<C-w>j", &noremap);
	map(Mode::Normal, "<C-up>", "<C-w>j", &noremap);
	map(Mode::Terminal, "<C-left>", "<C-w>h", &noremap);
	map(Mode::Terminal, "<C-right>", "<C-w>l", &noremap);
	map(Mode::Terminal, "<C-down>", "<C-w>j", &noremap);
	map(Mode::Terminal, "<C-up>", "<C-w>j", &noremap);

	// fast (un-)indent
	map(Mode::Normal, ">>", "", &remap);
	map(Mode::Normal, "<<", "", &remap);
	map(Mode::Normal, "<Tab>", ">>", &noremap);
	map(Mode::Normal, "<S-Tab>", "<<", &noremap);
	map(Mode::Visual, ">>", "", &remap);
	map(Mode::Visual, "<<", "", &remap);
	map(Mode::Visual, "<Tab>", ">>", &noremap);
	map(Mode::Visual, "<S-Tab>", "<<", &noremap);

	// Telescope
	map(Mode::Normal, "<leader>tf", ":Telescope find_files<CR>", &noremap);
	map(Mode::Normal, "<leader>tg", ":Telescope live_grep<CR>", &noremap);
	map(Mode::Normal, "<leader>b", ":Telescope buffers<CR>", &noremap);
}
