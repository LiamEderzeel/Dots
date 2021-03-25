" nnoremap <silent> <c-p> :call fzf#run({
"     \   'down': '40%',
"     \   'sink': 'botright split' })<CR>

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'