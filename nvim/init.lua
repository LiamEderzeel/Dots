local utils = require('utils')

require('variables')
require('config')
require('plugins')
require('keymappings')
require('settings')

require('lsp')
require('p-diffview')

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
