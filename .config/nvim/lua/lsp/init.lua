local M = {}
-- local Log = require "log"
function M.config()
  vim.lsp.protocol.CompletionItemKind = O.lsp.completion.item_kind

  for _, sign in ipairs(O.lsp.diagnostics.signs.values) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  require("lsp.handlers").setup()
end

local function lsp_highlight_document(client)
  if O.lsp.document_highlight == false then
    return -- we don't need further
  end
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<cr>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<cr>")

local function add_lsp_buffer_keybindings(bufnr)
  local wk = require "which-key"
  local keys = {
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
    ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
    ["gp"] = { "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", "Peek definition" },
    ["gl"] = {
      "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>",
      "Show line diagnostics",
    },
  }
  wk.register(keys, { mode = "n", buffer = bufnr })
end

local function set_smart_cwd(client)
  local proj_dir = client.config.root_dir
  if O.lsp.smart_cwd and proj_dir ~= "/" then
    vim.api.nvim_set_current_dir(proj_dir)
    require("p-nvimtree").change_tree_dir(proj_dir)
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

function M.get_ls_capabilities(client_id)
  local client
  if not client_id then
    local buf_clients = vim.lsp.buf_get_clients()
    for _, buf_client in ipairs(buf_clients) do
      if buf_client.name ~= "null-ls" then
        client_id = buf_client.id
        break
      end
    end
  end
  if not client_id then
    error "Unable to determine client_id"
  end

  client = vim.lsp.get_client_by_id(tonumber(client_id))

  local enabled_caps = {}

  for k, v in pairs(client.resolved_capabilities) do
    if v == true then
      table.insert(enabled_caps, k)
    end
  end

  return enabled_caps
end

function M.common_on_init(client, bufnr)
  if O.lsp.on_init_callback then
		O.lsp.on_init_callback(client, bufnr)
    Log:get_default().info "Called lsp.on_init_callback"
    return
  end

  local formatters = O.lang[vim.bo.filetype].formatters
  if not vim.tbl_isempty(formatters) and formatters[1]["exe"] ~= nil and formatters[1].exe ~= "" then
    client.resolved_capabilities.document_formatting = false
    Log:get_default().info(
      string.format("Overriding language server [%s] with format provider [%s]", client.name, formatters[1].exe)
    )
  end
end

function M.common_on_attach(client, bufnr)
  if O.lsp.on_attach_callback then
    O.lsp.on_attach_callback(client, bufnr)
    Log:get_default().info "Called lsp.on_init_callback"
  end
  lsp_highlight_document(client)
  add_lsp_buffer_keybindings(bufnr)
  set_smart_cwd(client)
  require("lsp.null-ls").setup(vim.bo.filetype)
end

function M.setup(lang)
  local lsp = O.lang[lang].lsp
  if require("utils").check_lsp_client_active(lsp.provider) then
    return
  end

  local overrides = O.lsp.override

  if type(overrides) == "table" then
    if vim.tbl_contains(overrides, lang) then
      return
    end
  end

  local lspconfig = require "lspconfig"
  lspconfig[lsp.provider].setup(lsp.setup)
end

return M
