local M = {}

M.config = function()
	local cb = require'diffview.config'.diffview_callback

	O.p.diffview = {
		diff_binaries = false,    -- Show diffs for binaries
		file_panel = {
			width = 35,
			use_icons = true        -- Requires nvim-web-devicons
		},
		key_bindings = {
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is a Diffview.
			view = {
				["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
				["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
				["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
				["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
			},
			file_panel = {
				["j"]         = cb("next_entry"),         -- Bring the cursor to the next file entry
				["<down>"]    = cb("next_entry"),
				["k"]         = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
				["<up>"]      = cb("prev_entry"),
				["<cr>"]      = cb("select_entry"),       -- Open the diff for the selected entry.
				["o"]         = cb("select_entry"),
				["R"]         = cb("refresh_files"),      -- Update stats and entries in the file list.
				["<tab>"]     = cb("select_next_entry"),
				["<s-tab>"]   = cb("select_prev_entry"),
				["<leader>e"] = cb("focus_files"),
				["<leader>b"] = cb("toggle_files"),
			}
		}
	}
end

M.setup = function()
	local status_ok, diffview = pcall(require, "diffview")
	if not status_ok then
		return
	end

	diffview.setup(O.p.diffview)
end

return M

