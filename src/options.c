// `o()` is broken - probably another api change

#include "./nvim.h"
#include <stdlib.h>

int luaopen_config_options() {
  o("foldlevel", i(99));
  o("encoding", s("utf8"));

  // design
  o("list", True);
  o("wrap", True);
  o("errorbells", False);
  o("visualbell", False);
  o("background", s("dark"));
  o("number", True);
  o("relativenumber", True);
  o("numberwidth", i(2));

  // search
  o("incsearch", True);
  o("hlsearch", True);
  o("ignorecase", True);
  o("smartcase", True);

  // Controls
  o("mouse", s("nv"));
  o("whichwrap", s("<>[]hlb,s"));
  o("backspace", s("eol,start,indent"));

  // Filetypes
  g("python_recommended_style", i(0));


  if (getenv("DISPLAY") != 0) {
    // within X
    o("clipboard", s("unnamedplus"));  // sync system and vim clipboard
  }

  return 1;
}
