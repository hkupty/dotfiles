#!/usr/bin/env bash

# Copyright 2017 Metaist LLC <http://metaist.com/>
# MIT License <https://opensource.org/licenses/mit-license>

set -uo pipefail
IFS=$'\n\t'

SCRIPT_SOURCE=$(readlink -f ${BASH_SOURCE[0]})
SCRIPT_NAME=$(basename $SCRIPT_SOURCE)
SCRIPT_VERSION='0.1.0'

# Display the script usage.
usage() {
  printf "\
$SCRIPT_NAME ($SCRIPT_VERSION) - Extract executable code from Markdown files.

Usage:
  $SCRIPT_NAME [INPUT] [-h|--help] [-v|--version] [-l|--lang LANG] [-p|--print]

Options:
  INPUT                 markdown file to parse (default: STDIN)
  -h, --help            show this message and exit
  -v, --version         print script version and exit
  -l, --lang LANG       language name to extract from fenced blocks
  -p, --print           print the script instead of executing
"
}

REGEX_SHEBANG='^#!([ /a-zA-Z]*)'
REGEX_BLOCK='^\s\s\s\s'
REGEX_FENCE='^```([a-zA-Z]*)'

# Process a single file.
process_file() {
  local in_path=${1:-''}
  local in_lang=${2:-''}

  local fence_start=false
  local fence_lang=''

  while read -ru 10 line; do
    if [[ $line =~ $REGEX_FENCE ]]; then
      fence_lang="${BASH_REMATCH[1]}"
      if $fence_start; then fence_start=false; else fence_start=true; fi
      continue
    fi # fence detected

    if [[ "$in_lang" == "" || "$in_lang" == "$fence_lang" ]]; then
      if $fence_start; then
        echo $line
      elif [[ $line =~ $REGEX_BLOCK ]]; then
        echo $line | sed "s/$REGEX_BLOCK//"
      fi
    fi
  done 10<$in_path
}

ARG_INPUT='/dev/stdin'
ARG_LANG=''
ARG_PRINT=false

while [[ "$#" > 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0;;
    -v|--version) echo "$SCRIPT_NAME $SCRIPT_VERSION"; exit 0;;
    -l|--lang) ARG_LANG="$2"; shift 2;;
    -p|--print) ARG_PRINT=true; shift 1;;
    *)
      if [[ "$ARG_INPUT" == "/dev/stdin" ]]; then
        ARG_INPUT="$1"
        shift 1
      else
        echo "unknown option: [$1]" >&2
        usage
        exit 1
      fi;;
  esac
done # args parsed

CONTENT=$(process_file "$ARG_INPUT" "$ARG_LANG")
SHEBANG=''
if [[ $CONTENT =~ $REGEX_SHEBANG ]]; then
  SHEBANG="${BASH_REMATCH[1]}"
fi # extracted the shebang

if [[ "$ARG_PRINT" == "true" || "$SHEBANG" == "" ]]; then
  echo "$CONTENT"
else
  echo "$CONTENT" | eval $SHEBANG
fi # printed or executed the script
