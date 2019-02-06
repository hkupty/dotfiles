" Plugin Management
source $HOME/.config/nvim/dependencies.vim

" All plugin related configuration
source $HOME/.config/nvim/plugins.vim

" Config defaults
source $HOME/.config/nvim/config.vim

" Color stuff
source $HOME/.config/nvim/color.vim

" Filetype specific stuff
source $HOME/.config/nvim/ft.vim

" Keyboard stuff
source $HOME/.config/nvim/keybindings.vim

" Autostuff done automatically
source $HOME/.config/nvim/autocommands.vim

" FIXME path hack 'cause fedora sucks
source $HOME/.config/nvim/path.vim

" Config plugins in lua
luafile $HOME/.config/nvim/plugins.lua
luafile $HOME/.config/nvim/lua/project.lua

" impromptu + acid
luafile $HOME/.config/nvim/lua/jazz.lua
