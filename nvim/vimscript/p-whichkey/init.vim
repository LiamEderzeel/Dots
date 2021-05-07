" Leader Key Maps

" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['/'] = 'comment toggle'
let g:which_key_map['e'] = [ ':NvimTreeToggle'                        , 'explorer' ]
let g:which_key_map['f'] = [ ':Telescope find_files'                  , 'find files' ]

" a is for actions
let g:which_key_map.a = {
			 \ 'name' : '+actions' ,
			 \ 'c' : [':ColorizerToggle'        					  , 'colorizer'],
			 \ 'h' : [':let @/ = ""'            					  , 'remove search highlight'],
			 \ 'i' : [':IndentBlanklineToggle'  					  , 'toggle indent lines'],
			 \ 'n' : [':set nonumber!'          					  , 'line-numbers'],
			 \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   					  , 'surround'],
			 \ 'r' : [':set norelativenumber!'  					  , 'relative line nums'],
			 \ 'v' : [':Codi'                   					  , 'virtual repl on'],
			 \ 'V' : [':Codi!'                  					  , 'virtual repl off'],
			 \ }
" t is for terminal
let g:which_key_map.t = {
			\ 'name' : '+terminal' ,
			\ ';' : [':FloatermNew --wintype=normal --height=6'       , 'terminal'],
			\ 'f' : [':FloatermNew fzf'                               , 'fzf'],
			\ 'g' : [':FloatermNew lazygit'                           , 'git'],
			\ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
			\ 'n' : [':FloatermNew node'                              , 'node'],
			\ 'N' : [':FloatermNew nnn'                               , 'nnn'],
			\ 'p' : [':FloatermNew python'                            , 'python'],
			\ 'm' : [':FloatermNew lazynpm'                           , 'npm'],
			\ 't' : [':FloatermToggle'                                , 'toggle'],
			\ 'y' : [':FloatermNew ytop'                              , 'ytop'],
			\ 'u' : [':FloatermNew ncdu'                              , 'ncdu'],
			\ }

call which_key#register('<Space>', "g:which_key_map")
