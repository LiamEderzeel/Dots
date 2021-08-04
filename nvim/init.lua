 --[[
                   __
    __          __/\ \__               __
   /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
   \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
    \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
     \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
      \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/

       author: Liam Ederzeel
]]--

require('variables')
require('config')
require('plugins')
require('keymappings')
require('settings')
require('functions')

require('lsp')
require('p-lspinstall')
require('p-galaxyline')
require('p-gitsigns')
require('p-telescope')
require('p-comment')
require('p-diffview')
require('p-nvimtree')
require('p-fterm')
require('p-compe')
require('p-lsp-rooter')
 require('p-autopairs')

require('lsp.efm-general-ls')
require('lsp.js-ts-ls')
require('lsp.lua-ls')
require('lsp.vue-ls')
require('lsp.docker-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.csharp-ls')

vim.cmd('source ~/.config/nvim/vimscript/p-startify/init.vim')
vim.cmd('source ~/.config/nvim/vimscript/functions.vim')
