mod colorscheme;
mod lazy;
mod mappings;
mod options;
pub mod util;
//mod statusline;

#[no_mangle]
pub extern "C" fn luaopen_init() -> i32 {
	colorscheme::init();
	lazy::bootstrap();
	mappings::init();
	options::init();
	//statusline::init();
	1
}
