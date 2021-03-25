call plug#begin('~/.vim/plugged')

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}   " Status Line
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'ryanoasis/vim-devicons' " vimscript
Plug 'mhinz/vim-startify'                             " Start Screen
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file finder
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Language server
Plug 'kyazdani42/nvim-web-devicons'                   " nvim tree icons
Plug 'kyazdani42/nvim-tree.lua'                       " tree

Plug 'lilydjwg/colorizer'                             " Preview colors
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'airblade/vim-rooter'                            " fzf searchers from project root

Plug 'TimUntersberger/neogit'
Plug 'tpope/vim-surround'                             " Surround

Plug 'nvim-lua/plenary.nvim'                            " gitsigns dependancy
Plug 'lewis6991/gitsigns.nvim'                          " git gutter signs

call plug#end()
