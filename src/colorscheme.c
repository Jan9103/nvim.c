#include "./nvim.h"

int luaopen_config_colorscheme() {
	KeyDict_highlight kd = {.fg = s("red"), .ctermfg = s("red")};
	hl("@comment", kd);
	return 1;
};
