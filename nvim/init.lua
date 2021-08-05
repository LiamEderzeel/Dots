local utils = require('utils')

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
require('p-diffview')
require('p-compe')
require('p-lsp-rooter')

require('lsp.efm-general-ls')
require('lsp.js-ts-ls')
require('lsp.lua-ls')
require('lsp.vue-ls')
require('lsp.docker-ls')
require('lsp.json-ls')
require('lsp.yaml-ls')
require('lsp.csharp-ls')

local autocmds = require('autocmds')

autocmds.define_augroups(O.autocommands)

utils.toggle_autoformat()
