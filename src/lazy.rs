pub fn bootstrap() {
	let lazypath = format!(
		"{}/.local/share/nvim/lazy/lazy.nvim",
		std::env::var_os("HOME").expect("Unable to get home-directory")
			.to_str().expect("Unable to decode home-directory env-var")
	);
	if !std::path::Path::new(lazypath.as_str()).is_dir() {
		std::process::Command::new("git")
			.arg("clone")
			.arg("--filter=blob:none")
			.arg("--single-branch")
			.arg("https://github.com/folke/lazy.nvim.git")
			.arg(&lazypath)
			.spawn()
			.expect("Failed to git clone lazy.nvim");
	}
	let runtimepath: String = nvim_oxi::api::get_option("runtimepath")
		.expect("unable to get runtimepath");
	nvim_oxi::api::set_option("runtimepath", format!("{},{}", &lazypath, runtimepath))
		.expect("Unable to set runtimepath to lazypath");
}
