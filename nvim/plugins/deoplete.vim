"
let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#enable_smart_case = 1
"         " let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
"         let g:deoplete#sources = {}
"         let g:deoplete#sources._=['buffer', 'ultisnips', 'file', 'dictionary']
"         let g:deoplete#sources.cs = ['cs', 'ultisnips', 'buffer']
"         let g:deoplete#sources.python = ['jedi', 'ultisnips', 'buffer']
"         let g:deoplete#omni#input_patterns = {}
"         let g:deoplete#omni#input_patterns.cs = ['\w*']
"         let g:deoplete#omni#input_patterns.rust = '[(\.)(::)]'
"         let g:deoplete#keyword_patterns = {}
"         let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
"
"         let g:deoplete#sources#dictionary#dictionaries = {
"             \ 'default' : '',
"             \ 'vimshell' : $HOME.'/.vimshell_hist',
"             \ 'scheme' : $HOME.'/.gosh_completions'
"                 \ }
"
"         let g:deoplete#omni_patterns = get(g:, 'deoplete#omni_patterns', {})
"         let g:deoplete#omni_patterns.html = '<[^>]*'
"
"         let g:deoplete#omni_patterns.javascript = '[^. *\t]\.\w*'
"         let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%\(\h\w*\)\?'
"         let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"     "     " Use Tab
"     "     " imap <silent><expr> <TAB>
"     "     "     \ pumvisible() ? "\<C-n>" :
"     "     "     \ <SID>check_back_space() ? "\<TAB>" :
"     "     "     \ deoplete#mappings#manual_complete()
"     "
"         function! s:check_back_space() abort
"             let col = col('.') - 1
"             return !col || getline('.')[col - 1]  =~ '\s'
"         endfunction
"     "
"         " Close window on finish
"         autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"     "
"         au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css
"     "
"     aug omnicomplete
"         au!
"         au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
"         au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
"         au FileType python setl omnifunc=pythoncomplete#Complete
"         au FileType xml setl omnifunc=xmlcomplete#CompleteTags
"     aug END
"     "