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
		use 'wbthomason/packer.nvim'

		-- LSP and Treesitter
		use 'neovim/nvim-lspconfig'
		use 'glepnir/lspsaga.nvim'
		use 'kabouzeid/nvim-lspinstall'
  		use {"folke/trouble.nvim"}

 		-- Treesitter
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use {"windwp/nvim-ts-autotag"}
 		use {'andymass/vim-matchup'}

		-- Autocomplete
		use 'hrsh7th/nvim-compe'
        use 'hrsh7th/vim-vsnip'
        use 'rafamadriz/friendly-snippets'

		--Status Line
		use 'glepnir/galaxyline.nvim'

		-- Icons
		use 'kyazdani42/nvim-web-devicons'
		use 'ryanoasis/vim-devicons'

		-- start screen
		use 'mhinz/vim-startify'

		--fzf searchers from project root
		use 'airblade/vim-rooter'

		-- git utilitys
		use 'TimUntersberger/neogit'
		use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
		use 'sindrets/diffview.nvim'
		use 'kdheepak/lazygit.nvim'

		-- commnet utility
		use {"windwp/nvim-autopairs"}
		use 'tpope/vim-surround'

		use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}}
		}

		-- comment
		use 'terrortylor/nvim-comment'
		use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}

		-- file tree
		use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
 		use {"ahmedkhalf/lsp-rooter.nvim"} -- with this nvim-tree will follow you

		-- color theme
		use 'rakr/vim-one'
		use 'kaicataldo/material.vim'

		-- color theme creator
		use 'rktjmp/lush.nvim'

		-- whichkey
		use 'folke/which-key.nvim'

		-- color previews
		use 'lilydjwg/colorizer'

		--floating terminal
		use "numtostr/FTerm.nvim"

		-- -- Debugging
		-- use {
		-- 	"mfussenegger/nvim-dap",
		-- 	config = function()
		-- 		require "lv-dap"
		-- 	end,
		-- }
		--
		use {
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			event = "BufRead",
			config = function()
				require("core.zen").setup()
			end,
			-- disable = not O.plugin.zen.active,
		}

		require_plugin("nvim-ts-context-commentstring")

	end
)

