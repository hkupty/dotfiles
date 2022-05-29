#!/usr/bin/env -S sed -n -f

/mode \"[^"]*\" {/{
  :a;
  N;
  /}/!ba;
  s/ *bindsym \(\w*\)[^#]*##\([^\n]*\)/\t<b>\1<\/b>\t\2/g ;
  p
}
