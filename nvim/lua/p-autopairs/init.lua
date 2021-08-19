local M = {}

function M.config()
  O.p.autopairs = {
    active = true,
    ---@usage  map <CR> on insert mode
    map_cr = true,
    ---@usage auto insert after select function or method item
    -- NOTE: This should be wrapped into a function so that it is re-evaluated when opening new files
    map_complete = vim.bo.filetype ~= "tex",
    ---@usage check treesitter
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false,
    },
  }
end

M.setup = function()
  -- skip it, if you use another global object
  _G.MUtils = {}
  local npairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"

  vim.g.completion_confirm_key = ""
  MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info()["selected"] ~= -1 then
        return vim.fn["compe#confirm"](npairs.esc "<cr>")
      else
        return npairs.esc "<cr>"
      end
    else
      return npairs.autopairs_cr()
    end
  end

  if package.loaded["compe"] then
    require("nvim-autopairs.completion.compe").setup {
      map_cr = O.p.autopairs.map_cr,
      map_complete = O.p.autopairs.map_complete,
    }
  end

  npairs.setup {
    check_ts = O.p.autopairs.check_ts,
    ts_config = O.p.autopairs.ts_config,
  }

  require("nvim-treesitter.configs").setup { autopairs = { enable = true } }

  local ts_conds = require "nvim-autopairs.ts-conds"

  -- TODO: can these rules be safely added from "config.lua" ?
  -- press % => %% is only inside comment or string
  npairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  }
end

return M
