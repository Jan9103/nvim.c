#include "../nvim.h"

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
  //o("numberwidth", i(2));

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

  //Dictionary listkeys = ARRAY_DICT_INIT;
  //PUT(listkeys, "tab", s("› "));
  //PUT(listkeys, "lead", s(" "));
  //PUT(listkeys, "trail", s("·"));
  //o("listchars", DICTIONARY_OBJ(listkeys));

  return 1;
}
