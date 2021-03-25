"                   __
"    __          __/\ \__               __
"   /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
"   \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"    \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"     \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"      \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/

"       author: Liam Ederzeel

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/keys/mapping.vim


" Plugins
if exists('g:vscode')
    source ~/.config/nvim/plugins/vscode.vim
endif
source ~/.config/nvim/plugins/startify.vim

lua require('statusline')
lua require('p-gitsigns')

" Plugins {

" Tmux Navigation {
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
" }


" EditorConfig {
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }

"}


" Files {
    " fix whitespace {
    function s:FixWhitespaceOnSave()
        let l:pos = getpos('.')
        " remove trailing whitespace
        %s/\s\+$//e
        " remove trailing newlines
        %s/\($\n\s*\)\+\%$//e
        call setpos('.', l:pos)
    endfunction
    " }

    " auto-format with Coc.nvim {
    let g:coc_format_on_save_ignore = []
    function s:FormatOnSave()
        if index(g:coc_format_on_save_ignore, &filetype) < 0 && IsCocEnabled()
            silent CocFormat
        endif
    endfunction
    " }

    function s:OnSave()
        call s:FixWhitespaceOnSave()
        " call s:FormatOnSave()
        " call s:CreateDirOnSave()
    endfunction

    augroup vimrc-on-save
        autocmd!
        autocmd BufWritePre * call s:OnSave()
    augroup END
" }

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
