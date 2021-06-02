local functions = {}

function functions.define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    -- just like how they would normally be defined from Vim itself
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end

        vim.cmd('augroup END')
    end
end

-- lsp

function functions.add_to_workspace_folder()
    vim.lsp.buf.add_workspace_folder()
end

function functions.clear_references()
    vim.lsp.buf.clear_references()
end

function functions.code_action()
    vim.lsp.buf.code_action()
end

function functions.declaration()
    vim.lsp.buf.declaration()
    vim.lsp.buf.clear_references()
end

function functions.definition()
    vim.lsp.buf.definition()
    vim.lsp.buf.clear_references()
end

function functions.document_highlight()
    vim.lsp.buf.document_highlight()
end

function functions.document_symbol()
    vim.lsp.buf.document_symbol()
end

function functions.formatting()
    vim.lsp.buf.formatting()
end

function functions.formatting_sync()
    vim.lsp.buf.formatting_sync()
end

function functions.hover()
    vim.lsp.buf.hover()
end

function functions.implementation()
    vim.lsp.buf.implementation()
end

function functions.incoming_calls()
    vim.lsp.buf.incoming_calls()
end

function functions.list_workspace_folders()
    vim.lsp.buf.list_workspace_folders()
end

function functions.outgoing_calls()
    vim.lsp.buf.outgoing_calls()
end

function functions.range_code_action()
    vim.lsp.buf.range_code_action()
end

function functions.range_formatting()
    vim.lsp.buf.range_formatting()
end

function functions.references()
    vim.lsp.buf.references()
    vim.lsp.buf.clear_references()
end

function functions.remove_workspace_folder()
    vim.lsp.buf.remove_workspace_folder()
end

function functions.rename()
    vim.lsp.buf.rename()
end

function functions.signature_help()
    vim.lsp.buf.signature_help()
end

function functions.type_definition()
    vim.lsp.buf.type_definition()
end

function functions.workspace_symbol()
    vim.lsp.buf.workspace_symbol()
end

-- diagnostic

function functions.get_all()
    vim.lsp.diagnostic.get_all()
end

function functions.get_next()
    vim.lsp.diagnostic.get_next()
end

function functions.get_prev()
    vim.lsp.diagnostic.get_prev()
end

function functions.goto_next()
    vim.lsp.diagnostic.goto_next()
end

function functions.goto_prev()
    vim.lsp.diagnostic.goto_prev()
end

function functions.show_line_diagnostics()
    vim.lsp.diagnostic.show_line_diagnostics()
end

-- git signs

function functions.next_hunk()
    require('gitsigns').next_hunk()
end

function functions.prev_hunk()
    require('gitsigns').prev_hunk()
end

function functions.stage_hunk()
    require('gitsigns').stage_hunk()
end

function functions.undo_stage_hunk()
    require('gitsigns').undo_stage_hunk()
end

function functions.reset_hunk()
    require('gitsigns').reset_hunk()
end

function functions.reset_buffer()
    require('gitsigns').reset_buffer()
end

function functions.preview_hunk()
    require('gitsigns').preview_hunk()
end

function functions.blame_line()
    require('gitsigns').blame_line()
end

-- misc
function functions.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

_G.functions = functions

return functions
