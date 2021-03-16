/* trim.c - based on http://lua-users.org/lists/lua-l/2009-12/msg00951.html
            from Sean Conner */
#include <stddef.h>
#include <ctype.h>
#include <lua.h>
#include <lauxlib.h>

int trim(lua_State* L) {
   const char* front;
   const char* end;
   size_t size;

   front = luaL_checklstring(L,1,&size);
   end = &front[size - 1];

   while (size && isspace(*front)) {
      size--;
      front++;
   }

   while (size && isspace(*end)) {
      size--;
      end--;
   }

   lua_pushlstring(L,front,(size_t)(end - front) + 1);
   return 1;
}

int luaopen_trim(lua_State* L) {
  lua_pushcfunction(L, trim);
  lua_setglobal(L, "trim");
   return 0;
}
