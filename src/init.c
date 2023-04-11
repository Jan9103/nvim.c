#include "nvim.h"

int luaopen_init(lua_State *L) {
  char *lazypath = stdpaths_user_data_subpath("lazy/lazy.nvim");
  if (os_isdir(lazypath) == false) {
    if (system(concat_str(
      "git "
      "clone "
      "--filter=blob:none "
      "--single-branch "
      "https://github.com/folke/lazy.nvim.git "
      , lazypath)) == -1
    ){
      printf("Failed to git clone lazy!");
      return -1;
    }
  }
  //opt("runtimepath", runtimepath_default(false), lazypath);

  return 1;
}
