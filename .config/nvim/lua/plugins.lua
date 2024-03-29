vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
	local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

	local plugin_path = plugin_prefix .. plugin .. "/"
	--	print('test '..plugin_path)
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	--	print(ok, err, code)
	if ok then vim.cmd("packadd " .. plugin) end
	return ok, err, code
end

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
-- require('packer').init({display = {auto_clean = false}})

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
 	use 'jose-elias-alvarez/null-ls.nvim'
	use 'wbthomason/packer.nvim'

	-- LSP 
	use 'neovim/nvim-lspconfig'
 	use 'tamago324/nlsp-settings.nvim'
	use {
		'ChristianChiarulli/dashboard-nvim',
		event = "BufWinEnter",
		config = function()
			require('p-dashboard').setup()
		end
	}
	use 'glepnir/lspsaga.nvim'
	use {
		'kabouzeid/nvim-lspinstall',
		config = function ()
			require("p-lspinstall").setup()
		end
	}

	-- diagnostics visualization
	use {"folke/trouble.nvim"}

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		condig = function ()
			require("p-treesitter").setup()
		end
	}

	-- Autocomplete
	use {
		'hrsh7th/nvim-compe',
		config = function()
			local status_ok, p_compe = pcall(require, "p-compe")
			if not status_ok then
				return
			end
			p_compe.setup()
		end
	}

	use 'hrsh7th/vim-vsnip'
	use 'rafamadriz/friendly-snippets'

	-- Status Line and Bufferline
	use {
		"glepnir/galaxyline.nvim",
		config = function()
			require "p-galaxyline"
		end,
		event = "BufWinEnter",
	}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'nvim-lua/plenary.nvim'

	-- git utilitys
	use 'TimUntersberger/neogit'
	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'},
		config = function()
			require('p-gitsigns').setup()
		end
	}

	use {
		'sindrets/diffview.nvim',
		config = function()
			require('p-diffview')
		end
	}

	use 'kdheepak/lazygit.nvim'

	use 'tpope/vim-surround'

	-- Autopairs
	use {
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		after = "nvim-compe",
		config = function()
			require('nvim-autopairs')
			require('p-autopairs').setup()
		end
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		config = function()
			require("p-telescope").setup()
		end,
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}}
	}

	-- Comments
	use {
		"terrortylor/nvim-comment",
		event = "BufRead",
		config = function()
			local status_ok, nvim_comment = pcall(require, "nvim_comment")
			if not status_ok then
				return
			end
			nvim_comment.setup()
		end
	}

	-- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function ()
			require('p-nvimtree').setup()
		end
	}

  -- Icons

	-- color theme
	use 'folke/tokyonight.nvim'
	use 'rakr/vim-one'
	use 'kaicataldo/material.vim'

	-- color theme creator
	-- use 'rktjmp/lush.nvim'

	-- color previews
	use 'lilydjwg/colorizer'

	--floating terminal
	use {
		"numtostr/FTerm.nvim",
		config = function ()
			require('p-fterm').setup()
		end
	}

	-- project.nvim
	use {
		"ahmedkhalf/project.nvim",
		config = function()
			require("project").setup()
		end,
	}

	-- Debugging
	use ({
		"mfussenegger/nvim-dap",
		config = function()
			require('p-dap').setup()
		end
	})

	-- Debugger management
	use "Pocco81/DAPInstall.nvim"

	use ({
		"folke/zen-mode.nvim",
		config = function()
			require("p-zen").setup()
		end
	})

	-- whichkey
	use {
		"folke/which-key.nvim",
		config = function()
			require('p-whichkey').setup()
		end
	}

end)

