require("astronauta.keymap")
mapper = function(opt)
  vim.keymap.nnoremap { opt.lhs or opt[1], function()
      (opt.fn or opt[2])(opt.arg or opt[3] or {})
  end
  }
end

local cv2 = require("cartographer.v2")

mapper{"<C-M-p>", cv2.project}
mapper{"<C-f>", cv2.cd}
mapper{"<C-p>", cv2.files}
mapper{"<C-g>", cv2.dirty}
mapper{"<C-s>", cv2.checkout}
mapper{"<C-l>", cv2.buffers}
mapper{"<M-v>", cv2.files, {open_cmd = "leftabove vnew"}}
mapper{"<M-h>", cv2.files, {open_cmd = "rightbelow new"}}
mapper{"<C-t>", cv2.todo, {open_cmd = "rightbelow new"}}

vim.keymap.nnoremap{"<localleader>/", grep}
