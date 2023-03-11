use nvim_oxi::conversion::ToObject;
pub fn g<Var>(name: &str, value: Var) where Var: ToObject {
	nvim_oxi::api::set_var(name, value)
		.expect(format!("Unable to set g:{}", name).as_str());
}

pub fn o<Var>(name: &str, value: Var) where Var: ToObject {
	nvim_oxi::api::set_option(name, value)
		.expect(format!("Unable to set opt:{}", name).as_str())
}
