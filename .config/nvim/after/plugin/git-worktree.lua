require("git-worktree").setup{ change_directory_command = "tcd" }

require("telescope").load_extension("git_worktree")
