local M = {}

M.config = function()
	O.p.fterm = {
		dimensions  = {
			height = 0.9,
			width = 0.9,
			x = 0.5,
			y = 0.5
		},
		border = 'single' -- or 'double'
	}
end

M.setup = function ()
	require("FTerm").setup(O.p.fterm)

	local term = require("FTerm.terminal")

	-- Opening bashtop
	local lazygit = term:new()

	lazygit:setup({
		cmd = "lazygit"
	})

	function _G.__fterm_lazygit()
		vim.api.nvim_get_current_buf()
		lazygit:toggle()
	end

	-- Opening gitui
	local lazydocker = term:new()

	lazydocker:setup({cmd = "lazydocker"})

	function _G.__fterm_lazydocker()
		vim.api.nvim_get_current_buf()
		lazydocker:toggle()
	end
end

return M
