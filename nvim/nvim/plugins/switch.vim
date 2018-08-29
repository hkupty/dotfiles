
let g:switch_mapping = "\\"

augroup SWITCH
  au!
  au FileType lua let b:switch_custom_definitions = [
      \   {
      \     "'\(.\{-}\)'": "[[\1]]",
      \   },
      \ ]
augroup END
