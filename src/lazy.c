#include "nvim.h"
#include <stdlib.h>

#define LAZY_CONFIG "{ \
  \"defaults\": { \
    \"lazy\": true \
  }, \
  \"ui\": { \
    \"border\": \"rounded\" \
  }, \
  \"change_detection\": { \
    \"enabled\": false \
  }, \
  \"performance\": { \
    \"rtp\": { \
      \"disabled_plugins\": [ \
        \"gzip\", \
        \"matchit\", \
        \"netrwPlugin\", \
        \"tarPlugin\", \
        \"tohtml\", \
        \"tutor\", \
        \"zipPlugin\" \
      ] \
    } \
  }, \
  \"readme\": { \
    \"enabled\": false \
  } \
}"

int luaopen_config_lazy(lua_State *L) {
  if (getenv("VIM_NOPLUGIN") != 0) return 1;

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
  opt("runtimepath", runtimepath_default(false), lazypath);

  lua_getfield(L, LUA_GLOBALSINDEX, "require");
  lua_pushliteral(L, "lazy");
  lua_call(L, 1, 1);
  lua_pushliteral(L, "setup");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  const int lc3 = lua_gettop(L);
  lua_pushliteral(L, "config.plugins");

  lua_getfield(L, LUA_GLOBALSINDEX, "vim");
  lua_pushliteral(L, "json");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lua_pushliteral(L, "decode");
  lua_gettable(L, -2);
  lua_remove(L, -2);
  lua_pushliteral(L, LAZY_CONFIG);
  lua_call(L, 1, LUA_MULTRET);

  lua_call(L, (lua_gettop(L) - lc3), 0);

  return 1;
}
