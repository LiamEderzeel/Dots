command! LspCodeAction lua require 'functions'.code_action()
command! LspDeclaration lua require 'functions'.declaration()
command! LspDefinition lua require 'functions'.definition()
command! LspDocumentSymbol lua require 'functions'.document_symbol()
command! LspFormatting lua require 'functions'.formatting()
command! LspFormattingSync lua require 'functions'.formatting_sync()
command! LspHover lua require 'functions'.hover()
command! LspImplementation lua require 'functions'.implementation()
command! LspRangeCodeAction lua require 'functions'.range_code_action()
command! LspRangeFormatting lua require 'functions'.range_formatting()
command! LspReferences lua require 'functions'.references()
command! LspRename lua require 'functions'.rename()
command! LspTypeDefinition lua require 'functions'.type_definition()
command! LspWorkspaceSymbol lua require 'functions'.workspace_symbol()
command! LspGotoNext lua require 'functions'.goto_next()
command! LspGotoPrev lua require 'functions'.goto_prev()
command! LspShowLineDiagnostics lua require 'functions'.show_line_diagnostics()
command! NextHunk lua require 'functions'.next_hunk()
command! PrevHunk lua require 'functions'.prev_hunk()
command! StageHunk lua require 'functions'.stage_hunk()
command! UndoStageHunk lua require 'functions'.undo_stage_hunk()
command! ResetHunk lua require 'functions'.reset_hunk()
command! ResetBuffer lua require 'functions'.reset_buffer()
command! PreviewHunk lua require 'functions'.preview_hunk()
command! BlameLine lua require 'functions'.blame_line()
command! W noa w

" Debugging
command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
command! DebugStart lua require'dap'.continue()
command! DebugContinue lua require'dap'.continue()
command! DebugStepOver lua require'dap'.step_over()
command! DebugStepOut lua require'dap'.step_out()
command! DebugStepInto lua require'dap'.step_into()
command! DebugToggleRepl lua require'dap'.repl.toggle()
command! DebugGetSession lua require'dap'.session()

" Available Debug Adapters:
"   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
"
" Adapter configuration and installation instructions:
"   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
"
" Debug Adapter protocol:
"   https://microsoft.github.io/debug-adapter-protocol/

" TODO Add full support later
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()

autocmd User GoyoEnter set laststatus=0
autocmd User GoyoLeave set laststatus=2

" autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
" autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()
