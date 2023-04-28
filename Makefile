files := lua/config/lazy.so lua/config/options.so lua/config/keybinds.so

.PHONY: all
all: $(files)

lua/config/lazy.so: src/lazy.c src/nvim.h
	gcc -o lua/config/lazy.so -std=gnu11 -O2 src/lazy.c -shared -fPIC

lua/config/options.so: src/options.c src/nvim.h
	gcc -o lua/config/options.so -std=gnu11 -O2 src/options.c -shared -fPIC

lua/config/keybinds.so: keybinds.csv generate_keymap.nu
	nu ./generate_keymap.nu


.PHONY: clean
clean:
	rm $(files)
