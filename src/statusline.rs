// currently diagnostic hasnt been implemented -> nor really useful
use nvim_oxi::api as oxi;

#[allow(dead_code)] // passed as arg in `init`
fn apply_to_win(
	_args: oxi::types::AutocmdCallbackArgs,
) -> Result<bool, oxi::Error> {
	Ok(true)
}

pub fn init() {
	oxi::set_option("laststatus", 2).expect("unable to set opt:laststatus=2 for statusline");
	let augroup: u32 = oxi::create_augroup(
		"MY_STATUSLINE_AU",
		&oxi::opts::CreateAugroupOpts::builder().clear(true).build()
	).expect("unable to create statusline augroup");
	oxi::create_autocmd(
		vec![],
		&oxi::opts::CreateAutocmdOpts::builder()
			.callback(apply_to_win)
			.group(augroup)
			.build()
	).expect("failed to create statusline attach autocommand");
}
