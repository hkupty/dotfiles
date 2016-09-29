let g:magit_stage_hunk_mapping="-"
let g:magit_stage_file_mapping="f"
let g:magit_jump_next_hunk="<C-]>"
let g:magit_jump_prev_hunk="<C-[>"

autocmd User VimagitUpdateFile call sy#util#refresh_windows()
