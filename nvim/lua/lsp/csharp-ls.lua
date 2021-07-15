local pid = vim.fn.getpid()
local omnisharp_bin = DATA_PATH.."/lspinstall/csharp/omnisharp/run"

require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    -- filetypes = { "cs", "vb" },
    -- init_options = {},
    -- root_dir = require('lspconfig').util.root_pattern(".csproj", ".sln")
}

