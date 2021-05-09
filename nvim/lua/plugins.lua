vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(
	function(use)
		use 'neovim/nvim-lspconfig'
		use 'glepnir/lspsaga.nvim'
		use 'kabouzeid/nvim-lspinstall'

		-- Packer can manage itself as an optional plugin
		use 'wbthomason/packer.nvim'

		--Status Line
		use 'glepnir/galaxyline.nvim'

		-- Icons
		use 'kyazdani42/nvim-web-devicons'
		use 'ryanoasis/vim-devicons'

		use 'mhinz/vim-startify'
		use 'lilydjwg/colorizer'

		use 'kaicataldo/material.vim'

		--fzf searchers from project root
		use 'airblade/vim-rooter'
		use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

		use 'TimUntersberger/neogit'
		use 'liuchengxu/vim-which-key'
		use 'folke/which-key.nvim'
		use 'tpope/vim-surround'

		use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-media-files.nvim'}}
		}
		use 'terrortylor/nvim-comment'
		use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
		use 'sindrets/diffview.nvim'
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'rakr/vim-one'
end
)
