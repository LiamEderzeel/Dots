set completeopt-=preview
let g:OmniSharp_server_use_mono = 1
" let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 1

au FileType cs OmniSharpHighlightTypes

autocmd BufWritePost *.cs call OmniSharp#AddToProject()                         " Automatically add new cs files to the nearest project on save
" show type information automatically when the cursor stops moving
" autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

nnoremap [omnisharp] <nop>
nmap <leader>ooo [omnisharp]
nnoremap <silent> [omnisharp]i :OmniSharpFindImplementations<cr>
nnoremap <silent> [omnisharp]u :OmniSharpFindUsages<cr>
nnoremap <silent> [omnisharp]f :OmniSharpFindMembers<cr>
nnoremap <silent> [omnisharp]x :OmniSharpFixIssue<cr>
nnoremap <silent> [omnisharp]X :OmniSharpFixUsings<cr>
nnoremap <silent> [omnisharp]l :OmniSharpTypeLookup<cr>
nnoremap <silent> [omnisharp]r :OmniSharpRename<cr>
nnoremap <silent> [omnisharp]R :OmniSharpReloadSolution<cr>
nnoremap <silent> [omnisharp]F :OmniSharpCodeFormat<cr>
nnoremap <silent> [omnisharp]h :OmniSharpHighlightTypes<cr>
nnoremap <silent> [omnisharp]g :OmniSharp#GotoDefinition<cr>

" Override Vim Gotodefinition
" autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
"navigate up by method/property/field
" autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"navigate down by method/property/field
" autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 ORename :call OmniSharp#RenameTo("<args>")

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Not supported with denite yet
" nnoremap <silent> [omnisharp]t :OmniSharpFindType<cr>
" nnoremap <silent> [omnisharp]s :OmniSharpFindSymbol<cr>
" nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
"