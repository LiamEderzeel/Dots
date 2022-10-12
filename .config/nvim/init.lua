vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else

-- local utils = require('utils')

-- require('variables')
-- require('config')
-- require('plugins')
-- require('keymappings')
-- require('settings')

-- require('lsp')

-- local autocmds = require('autocmds')

-- autocmds.define_augroups(O.autocommands)

-- require("lsp").config()

-- local null_status_ok, null_ls = pcall(require, "null-ls")
-- if null_status_ok then
--   null_ls.config {}
--   require("lspconfig")["null-ls"].setup {}
-- end

-- local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
-- if lsp_settings_status_ok then
--   lsp_settings.setup {
--     config_home = os.getenv "HOME" .. "/.config/lvim/lsp-settings",
--   }
-- end

-- utils.toggle_autoformat()
