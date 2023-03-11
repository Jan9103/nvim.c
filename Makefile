.PHONY: all
all:
	cargo build --release
	cp target/release/libnvim_config.so lua/init.so

debug:
	cargo build
	cp target/debug/libnvim_config.so lua/init.so
