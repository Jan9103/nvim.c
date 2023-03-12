files := lua/init.so lua/config/options.so lua/config/keymaps.so

.PHONY: all
all: $(files)

lua/init.so: src/init.c
	gcc -o lua/init.so -std=gnu11 -O2 src/init.c -shared -fPIC

lua/config/options.so: src/config/options.c
	gcc -o lua/config/options.so -std=gnu11 -O2 src/config/options.c -shared -fPIC

lua/config/keymaps.so: src/config/keymaps.c
	gcc -o lua/config/keymaps.so -std=gnu11 -O2 src/config/keymaps.c -shared -fPIC


.PHONY: clean
clean:
	rm $(files)
