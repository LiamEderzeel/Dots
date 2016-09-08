syntax on                               " Turn syntax highlighting on
set shell=/bin/zsh
" set nu                                  " Line numbers
set relativenumber number                                  " Line numbers
set wrapmargin=5                        " Wraps lines in character spaces from the right
set ruler                               " Shows line and column of cursor
set cursorline                          " Highlight current line
set backspace=2                         " Backspace beyond insert point
set tabstop=4                           " Size of hard tbstop
set shiftwidth=4                        " Size of indent
set expandtab                           " Use space instead of tab characters
match ErrorMsg '\s\+$'
let g:python_host_prog = '/path/to/python'
let g:UltiSnipsUsePythonVersion = 2
let g:indentLine_enabled = 1            " Enable indentLine plugin
let g:indentLine_char = '┆'             " Line indent type ¦ ┆ ︙│
let g:indentLine_color_term = 239       " Set lineindents to comment color
set cmdheight=1
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1     " Truecolor in terminal
set clipboard=unnamed                   " Set clipboard buffer to unnamed
colorscheme	monokai                     " Set theme to monokai
let g:monokai_italic = 1                " Enable italic
let g:monokai_thick_border = 1          " Set window border
let g:airline_powerline_fonts = 1       " airline uses powerline font
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
autocmd BufWritePre * :%s/\s\+$//e      " Removes traling spaces
let g:move_key_modifier = 'C'
let g:sonicpi_enable = 1
set undofile
set undodir="$HOME/.vim_unso_files"
let g:syntastic_loc_list_height = 4


set nocompatible                        " be iMproved, required
filetype off                            " required
call plug#begin('~/.vim/plugged')

Plug 'crusoexia/vim-monokai'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.sh --all
"   endif
" endfunction
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'Valloric/YouCompleteMe', { 'do': function('buildycm') }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --system-libclang --omnisharp-completer' }
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'OrangeT/vim-csharp'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'matze/vim-move'
Plug 'dermusikman/sonicpi.vim'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/ShaderHighLight'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'tomtom/tcomment_vim'
Plug 'dermusikman/sonicpi.vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/MatchTagAlways'
Plug 'edkolev/tmuxline.vim'
Plug 'crusoexia/vim-javascript-lib'

" Plug 'clausreinke/typescript-tools.vim', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make -f make_mac.mak'}
Plug 'Quramy/tsuquyomi'
call plug#end()

" CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|e2e)|(\.(swp|ico|git|svn))$'

" Vim-javascript
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set t_Co=256


if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

let g:user_emmet_mode='n'

if has("unix")
  let s:uname = system("uname")
  let g:python_host_prog='/usr/bin/python'
  if s:uname == "Darwin\n"
    let g:python_host_prog='/usr/local/bin/python' " found via `which python`
  endif
endif


" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=1

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden
let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

noremap L g_
noremap H ^
noremap J 5j
noremap K 5k
nnoremap ; :
vmap < <gv
vmap > >gv
vnoremap <c-/> :TComment<cr>

function WordCount()
  let s:old_status = v:statusmsg
  exe "silent normal g\<c-g>"
  let s:word_count = str2nr(split(v:statusmsg)[11])
  let v:statusmsg = s:old_status
  return s:word_count
endfunction

:set statusline=wc:%{WordCount()}

" nnoremap <leader>p :set ft=php<cr>
" nnoremap <leader>h :set ft=html<cr>

" typecript tools stuff
au BufRead,BufNewFile *.ts        setlocal filetype=typescript
set rtp+=<your_path_here>/typescript-tools.vim/

" YCM trigger voor typescript
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Quramy/tsuquyomi stuff
let g:gitgutter_async = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
