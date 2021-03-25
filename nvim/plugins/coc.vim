let g:coc_filetypes = []

function IsCocEnabled()
    return index(g:coc_filetypes, &filetype) >= 0
endfunction

augroup vimrc-coc
    autocmd!
    autocmd FileType * if IsCocEnabled()
                \|let &l:formatexpr = "CocAction('formatSelected')"
                \|let &l:keywordprg = ":call CocAction('doHover')"
                \|endif
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" formatting {
function s:CocFormat(range, line1, line2) abort
    if a:range == 0
        call CocAction('format')
    else
        call cursor(a:line1, 1)
        normal! V
        call cursor(a:line2, 1)
        call CocAction('formatSelected', 'V')
    endif
endfunction
command! -nargs=0 -range -bar CocFormat call s:CocFormat(<range>, <line1>, <line2>)
" }

call coc#add_extension('coc-snippets')
call coc#config('diagnostic', { 'virtualText': v:true, 'enableMessage': 'jump' })

set keywordprg=:call\ <SID>show_documentation()     " preview function arguments in status line

" Language {
    " json {
    call coc#add_extension('coc-json')
    let g:coc_filetypes += ['json']

    augroup vimrc-languages-json
        autocmd!
        autocmd FileType json syntax match Comment +\/\/.\+$+
    augroup END
    " }

    " javascript {
    call coc#add_extension('coc-tsserver', 'coc-eslint', 'coc-prettier')
    let g:coc_filetypes += ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx']
    call coc#config('eslint', {
                \ 'filetypes': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
                \ 'autoFixOnSave': v:true,
                \ })
    call coc#config('prettier', {
                \ 'singleQuote': v:true,
                \ 'trailingComma': 'all',
                \ 'jsxBracketSameLine': v:true,
                \ 'eslintIntegration': v:true,
                \ })
    " }

    " markdown {
    let g:livedown_autorun = 1
    let g:livedown_open = 1
    " }
" }