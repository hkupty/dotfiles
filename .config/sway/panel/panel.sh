#!/usr/bin/env bash
BASE=$(dirname "$0")
nwg-wrapper -t <("${BASE}/out.sed" "${1}") -c ~/.config/sway/panel/panel.css -p right -mr 200 -l 2 -sq 8
