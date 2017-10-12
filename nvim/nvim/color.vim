function! s:defn(var, val)
  if !exists(a:var)
    exec 'let '.a:var."='".a:val."'"
  endif
endfunction

hi! TermCursor guifg=e8e8d3 guibg=1d1f21
call s:defn("g:terminal_color_0", "#282a2e")
call s:defn("g:terminal_color_1", "#a54242")
call s:defn("g:terminal_color_2", "#8c9440")
call s:defn("g:terminal_color_3", "#de935f")
call s:defn("g:terminal_color_4", "#5f819d")
call s:defn("g:terminal_color_5", "#85678f")
call s:defn("g:terminal_color_6", "#5e8d87")
call s:defn("g:terminal_color_7", "#707880")
call s:defn("g:terminal_color_8", "#373b41")
call s:defn("g:terminal_color_9", "#cc6666")
call s:defn("g:terminal_color_10", "#b5bd68")
call s:defn("g:terminal_color_11", "#f0c674")
call s:defn("g:terminal_color_12", "#81a2be")
call s:defn("g:terminal_color_13", "#b294bb")
call s:defn("g:terminal_color_14", "#8abeb7")
call s:defn("g:terminal_color_15", "#c5c8c6")
call s:defn("g:terminal_color_background", "#1d1f21")
call s:defn("g:terminal_color_foreground", "#c5c8c6")

"function! s:configure_winhighlight()
  "let ft = &filetype
  "let bt = &buftype
  "" Check white/blacklist.
  "if index(['dirvish'], ft) == -1
        "\ && (index(['nofile', 'nowrite', 'acwrite', 'quickfix', 'help'], bt) != -1
        "\     || index(['startify'], ft) != -1)
    "set winhighlight=Normal:MyNormalWin,NormalNC:MyNormalWin
    "" echom "normal" winnr() &winhighlight 'ft:'.&ft 'bt:'.&bt
  "else
    "set winhighlight=Normal:MyNormalWin,NormalNC:MyInactiveWin
    "" echom "inactive" winnr() &winhighlight 'ft:'.&ft 'bt:'.&bt
  "endif
"endfunction
"augroup inactive_win
  "au!
  ""au ColorScheme * hi link MyInactiveWin ColorColumn | hi link MyNormalWin Normal
  ""au FileType,BufWinEnter * call s:configure_winhighlight()
  ""au FocusGained * hi link MyNormalWin Normal
  ""au FocusLost * hi link MyNormalWin MyInactiveWin
"augroup END
