" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:

"   _      _                   ______    _                        _
"  | |    (_)                 |  ____|  | |                      | |
"  | |     _  __ _ _ __ ___   | |__   __| | ___ _ __ _______  ___| |
"  | |    | |/ _` | '_ ` _ \  |  __| / _` |/ _ \ '__|_  / _ \/ _ \ |
"  | |____| | (_| | | | | | | | |___| (_| |  __/ |   / /  __/  __/ |
"  |______|_|\__,_|_| |_| |_| |______\__,_|\___|_|  /___\___|\___|_|

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }
" }

" Plug {

    " Config {
        if &compatible
          set nocompatible  " Be iMproved
        endif

        " Required:
        set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

        " Required:
        if dein#load_state('~/.vim/bundle')
          call dein#begin('~/.vim/bundle')

          " Let dein manage dein
          " Required:
          call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

          " Add or remove your plugins here:
          " call dein#add('Shougo/neosnippet.vim')
          " call dein#add('Shougo/neosnippet-snippets')

            " UI {
                call dein#add('freeo/vim-kalisi')
                call dein#add('AlxHnr/clear_colors')
                call dein#add('rakr/vim-one')
                call dein#add('crusoexia/vim-monokai')
                call dein#add('frankier/neovim-colors-solarized-truecolor-only')
                call dein#add('bling/vim-airline')
                call dein#add('airblade/vim-gitgutter')
                call dein#add('vim-airline/vim-airline-themes')
                call dein#add('edkolev/tmuxline.vim')
            " }

        " Utilities{
            " call dein#add('scrooloose/syntastic')
            call dein#add('tpope/vim-dispatch')
            call dein#add('tpope/vim-pathogen')
            call dein#add('Valloric/MatchTagAlways')
            call dein#add('tomtom/tcomment_vim')
            call dein#add('mattn/emmet-vim')
            call dein#add('matze/vim-move')
            call dein#add('dermusikman/sonicpi.vim')
            call dein#add('Shougo/deoplete.nvim')
            call dein#add('mhinz/vim-startify')
            call dein#add('neomake/neomake')
            " call dein#add('kien/ctrlp.vim')
            call dein#add('Yggdroot/indentLine')
            call dein#add('junegunn/fzf', { 'build': './install --all' })
            call dein#add('junegunn/fzf.vim')
            call dein#add('brooth/far.vim')
        " }

        " Language {
            call dein#add('vim-polyglot')
            call dein#add('leafgarland/typescript-vim')
            call dein#add('vim-scripts/ShaderHighLight')
            call dein#add('JulesWang/css.vim')
            call dein#add('OrangeT/vim-csharp')
            call dein#add('cakebaker/scss-syntax.vim')
            call dein#add('pangloss/vim-javascript')
            call dein#add('crusoexia/vim-javascript-lib')
            if OSX()
                call dein#add('OmniSharp/omnisharp-vim', {
                        \ 'build': 'sh -c "cd server/ && xbuild"',
                        \ 'on_ft': 'cs'
                        \ })
                call dein#add('Robzz/deoplete-omnisharp/',{
                        \ 'on_ft': 'cs',
                        \ 'depends': 'omnisharp-vim'
                        \ })
            endif
        " }

          " You can specify revision/branch/tag.
          " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

          " Required:
          call dein#end()
          call dein#save_state()
        endif

        " Required:
        filetype plugin indent on

        " If you want to install not installed plugins on startup.
        "if dein#check_install()
        "  call dein#install()
        "endif
    " }

    " Plug {
    " call plug#begin('~/.vim/plugged')
    "
    " " UI {
    "     Plug 'freeo/vim-kalisi'
    "     Plug 'AlxHnr/clear_colors'
    "     Plug 'rakr/vim-one'
    "     Plug 'crusoexia/vim-monokai'
    "     " Plug 'frankier/neovim-colors-solarized-truecolor-only'
    "     Plug 'bling/vim-airline'
    "     Plug 'airblade/vim-gitgutter'
    "     Plug 'vim-airline/vim-airline-themes'
    "     Plug 'edkolev/tmuxline.vim'
    " " }
    "
    " " Utilities{
    "     " Plug 'scrooloose/syntastic'
    "     Plug 'tpope/vim-dispatch'
    "     Plug 'tpope/vim-pathogen'
    "     Plug 'Valloric/MatchTagAlways'
    "     Plug 'tomtom/tcomment_vim'
    "     Plug 'mattn/emmet-vim'
    "     Plug 'matze/vim-move'
    "     Plug 'dermusikman/sonicpi.vim'
    "     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "     Plug 'mhinz/vim-startify'
    "     Plug 'neomake/neomake'
    "     Plug 'kien/ctrlp.vim'
    "     " function! BuildYCM(info)
    "     "   if a:info.status == 'installed' || a:info.force
    "     "     !./install.py --all
    "     "   endif
    "     " endfunction
    "     " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    "     Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    "     Plug 'Yggdroot/indentLine'
    " " }
    "
    " " Language {
    "     Plug 'vim-polyglot'
    "     Plug 'leafgarland/typescript-vim'
    "     Plug 'vim-scripts/ShaderHighLight'
    "     Plug 'JulesWang/css.vim'
    "     Plug 'OrangeT/vim-csharp'
    "     Plug 'cakebaker/scss-syntax.vim'
    "     Plug 'pangloss/vim-javascript'
    "     Plug 'crusoexia/vim-javascript-lib'
    "     Plug 'OmniSharp/omnisharp-vim'
    " " }
    "
    " function! Installjshint(info)
    "   if a:info.status == 'installed' || a:info.force
    "     !npm install -g jshint
    "   endif
    " endfunction
    " Plug 'scrooloose/syntastic', { 'do': function('Installjshint') }
    "
    " call plug#end()
    " }
" }

" General {
    set background=dark
    filetype plugin indent on               " Automatically detect file types.
    " syntax enable
    syntax on                               " Turn syntax highlighting on
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    set complete-=i             " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    set nrformats-=octal        " Ctrl A considers numbers starting with 0 octal
    set autoread
    scriptencoding utf-8
    set clipboard=unnamed                   " Set clipboard buffer to unnamed

    " Ignore files {
        set wildignore+=vendor/bundle/**,
        set wildignore+=node_modules/**,
        set wildignore+=bower_components/**,
        set wildignore+=.git/**,
        set wildignore+=*.meta,
        set wildignore+=*.prefab,
        set wildignore+=*.sample,
        set wildignore+=*.asset,
        set wildignore+=*.unity,
        set wildignore+=*.anim,
        set wildignore+=*.controller,
        set wildignore+=*.jpg,
        set wildignore+=*.png,
        set wildignore+=*.mp3,
        set wildignore+=*.wav,
        set wildignore+=*.ttf,
        set wildignore+=*.pdf,
        set wildignore+=*.psd,
        set wildignore+=*.shader,
        set wildignore+=*.dll,
        set wildignore+=*.mat,
        set wildignore+=*.file,
        set wildignore+=*.unitypackage,
        set wildignore+=debug/,
        set wildignore+=Debug/,
        set wildignore+=temp/,
        set wildignore+=Temp/,
        set wildignore+=temp/,
    " }
" }

" Vim GUI {
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    endif

    if has('termguicolors')
        set termguicolors
    endif

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode

    if has('nvim')
        set inccommand=nosplit
    endif

    colorscheme	kalisi                         " Set theme to one
    " colorscheme	one                         " Set theme to one
    " set background=dark                     " Set Them to dark
    " let g:one_allow_italics = 1             " I love italic for comments

    " colorscheme monokai                     " Set theme to monokai
    " let g:monokai_italic = 1                " Enable italic
    " let g:monokai_thick_border = 1          " Set window border

    set cursorline                          " Highlight current line
    set ruler                               " Shows line and column of cursor
    set relativenumber number               " Line numbers
    set backspace=2                         " Backspace beyond insert point
    set cmdheight=1
    set laststatus=2                        " Always display the statusline in all windows
    set guifont=Inconsolata\ for\ Powerline:h14
    set noshowmode                          " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" }

" Formatting {
    set wrap
    set linebreak
    set nolist                              " list disables linebreak
    set shiftwidth=4                        " Size of indent
    set tabstop=4                           " Size of hard tbstop
    " set autoindent
    set noexpandtab
    set shiftwidth=4
    set splitright                          " Puts new vsplit windows to the right of the current
    set splitbelow                          " Puts new split windows to the bottom of the current
" }

" Key mapping {
    noremap L g_
    noremap H ^
    noremap J 5j
    noremap K 5k
    nnoremap ; :
    vmap < <gv
    vmap > >gv
    vnoremap <c-/> :TComment<cr>
    " nnoremap <leader>p :set ft=php<cr>
    " nnoremap <leader>h :set ft=html<cr>
" }

match ErrorMsg '\s\+$'
let g:python_host_prog = '/path/to/python'
let g:UltiSnipsUsePythonVersion = 2

" neomake stuff no qlu
autocmd! BufWritePost * Neomake

set nocompatible                        " be iMproved, required
" filetype off                            " required

" if ! has('gui_running')
"     set ttimeoutlen=10
"     augroup FastEscape
"         autocmd!
"         au InsertEnter * set timeoutlen=0
"         au InsertLeave * set timeoutlen=1000
"     augroup END
" endif

let g:user_emmet_mode='n'

if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/local/bin/python' " found via `which python`
    endif
endif

" Plugins {

" Vim-airline {
let g:airline_powerline_fonts = 1       " airline uses powerline font
let g:airline_theme = 'one'
let g:airline#extensions#tabline#enabled = 1
autocmd BufWritePre * :%s/\s\+$//e      " Removes traling spaces
let g:move_key_modifier = 'C'
let g:sonicpi_enable = 1
set undofile
set undodir="$HOME/.vim_unso_files"
let g:syntastic_loc_list_height = 5
" }

    " OmniSharp {
        " " OmniSharp won't work without this setting
        " filetype plugin on
        "
        " "This is the default value, setting it isn't actually necessary
        " let g:OmniSharp_host = "http://localhost:2000"
        "
        " "Set the type lookup function to use the preview window instead of the status line
        " "let g:OmniSharp_typeLookupInPreview = 1
        "
        " "Timeout in seconds to wait for a response from the server
        " let g:OmniSharp_timeout = 1
        "
        " "Showmatch significantly slows down omnicomplete
        " "when the first match contains parentheses.
        " set noshowmatch
        "
        " "Super tab settings - uncomment the next 4 lines
        " "let g:SuperTabDefaultCompletionType = 'context'
        " "let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
        " "let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
        " "let g:SuperTabClosePreviewOnPopupClose = 1
        "
        " "don't autoselect first item in omnicomplete, show if only one item (for preview)
        " "remove preview if you don't want to see any documentation whatsoever.
        " set completeopt=longest,menuone,preview
        " " Fetch full documentation during omnicomplete requests.
        " " There is a performance penalty with this (especially on Mono)
        " " By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
        " " you need it with the :OmniSharpDocumentation command.
        " " let g:omnicomplete_fetch_documentation=1
        "
        " "Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
        " "You might also want to look at the echodoc plugin
        " set splitbelow
        "
        " " Get Code Issues and syntax errors
        " let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
        " " If you are using the omnisharp-roslyn backend, use the following
        " " let g:syntastic_cs_checkers = ['code_checker']
        " augroup omnisharp_commands
        "     autocmd!
        "
        "     "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
        "     autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
        "
        "     " Synchronous build (blocks Vim)
        "     "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
        "     " Builds can also run asynchronously with vim-dispatch installed
        "     autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
        "     " automatic syntax check on events (TextChanged requires Vim 7.4)
        "     autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
        "
        "     " Automatically add new cs files to the nearest project on save
        "     autocmd BufWritePost *.cs call OmniSharp#AddToProject()
        "
        "     "show type information automatically when the cursor stops moving
        "     autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
        "
        "     "The following commands are contextual, based on the current cursor position.
        "
        "     autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
        "     autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
        "     autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
        "     autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
        "     autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
        "     "finds members in the current buffer
        "     autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
        "     " cursor can be anywhere on the line containing an issue
        "     autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
        "     autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
        "     autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
        "     autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
        "     "navigate up by method/property/field
        "     autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
        "     "navigate down by method/property/field
        "     autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
        "
        " augroup END
        "
        "
        " " this setting controls how long to wait (in ms) before fetching type / symbol information.
        " set updatetime=500
        " " Remove 'Press Enter to continue' message when type information is longer than one line.
        " set cmdheight=1
        "
        " " Contextual code actions (requires CtrlP or unite.vim)
        " nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
        " " Run code actions with text selected in visual mode to extract method
        " vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
        "
        " " rename with dialog
        " nnoremap <leader>nm :OmniSharpRename<cr>
        " nnoremap <F2> :OmniSharpRename<cr>
        " " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
        " command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
        "
        " " Force OmniSharp to reload the solution. Useful when switching branches etc.
        " nnoremap <leader>rl :OmniSharpReloadSolution<cr>
        " nnoremap <leader>cf :OmniSharpCodeFormat<cr>
        " " Load the current .cs file to the nearest project
        " nnoremap <leader>tp :OmniSharpAddToProject<cr>
        "
        " " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
        " nnoremap <leader>ss :OmniSharpStartServer<cr>
        " nnoremap <leader>sp :OmniSharpStopServer<cr>
        "
        " " Add syntax highlighting for types and interfaces
        " nnoremap <leader>th :OmniSharpHighlightTypes<cr>
        " "Don't ask to save when changing buffers (i.e. when jumping to a type definition)
        " set hidden
        " let g:OmniSharp_selector_ui = 'fzf'  " Use ctrlp.vim
        "
        " set statusline+=%#warningmsg#
        " set statusline+=%{SyntasticStatuslineFlag()}
        " set statusline+=%*
        "
        " let g:syntastic_always_populate_loc_list = 1
        " let g:syntastic_auto_loc_list = 1
        " let g:syntastic_check_on_open = 1
        " let g:syntastic_check_on_wq = 0

        " OmniSharp {
        if dein#tap("omnisharp-vim")
            let g:OmniSharp_server_type = 'v1'
            " let g:OmniSharp_server_type = 'roslyn'
            let g:OmniSharp_timeout = 100

            au FileType cs OmniSharpHighlightTypes
            " Automatically add new cs files to the nearest project on save
            autocmd BufWritePost *.cs call OmniSharp#AddToProject()
            "show type information automatically when the cursor stops moving
            " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

            nnoremap [omnisharp] <nop>
            nmap <leader>o [omnisharp]
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

            " Override Vim Gotodefinition
            autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
            "navigate up by method/property/field
            autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
            "navigate down by method/property/field
            autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
            " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
            command! -nargs=1 ORename :call OmniSharp#RenameTo("<args>")

            autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

            " Not supported with denite yet
            let g:OmniSharp_selector_ui = 'fzf'  " Use unite.vim
            " nnoremap <silent> [omnisharp]t :OmniSharpFindType<cr>
            " nnoremap <silent> [omnisharp]s :OmniSharpFindSymbol<cr>
            " nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
            " vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
        endif
    " }
    " }

    " Vim-javascript {
    set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
    " }

    " " CtrlP {
    "     set runtimepath^=~/.vim/plugged/ctrlp.vim
    " " let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'
    " " }

    " indentLine {
        let g:indentLine_enabled = 1            " Enable indentLine plugin
        let g:indentLine_char = '┆'             " Line indent type ¦ ┆ ︙│
        let g:indentLine_color_term = 239       " Set lineindents to comment color
    " }

    " Pathogen {
        execute pathogen#infect()
    "
    " Neomake {
        autocmd! BufWritePost,BufEnter * Neomake
    " }
" }

    " fzf {
        nnoremap <silent> <c-p> :call fzf#run({
            \   'down': '40%',
            \   'sink': 'botright split' })<CR>
    " }

    " Deoplete {
        if dein#tap("deoplete.nvim")
            let g:deoplete#enable_at_startup = 1
            let g:deoplete#enable_smart_case = 1
            let g:deoplete#sources = {}
            let g:deoplete#sources._=['buffer', 'ultisnips', 'file', 'dictionary']
            let g:deoplete#sources.cs = ['cs', 'ultisnips', 'buffer']
            let g:deoplete#sources.python = ['jedi', 'ultisnips', 'buffer']
            let g:deoplete#omni#input_patterns = {}
            let g:deoplete#omni#input_patterns.cs = ['\w*']
            let g:deoplete#omni#input_patterns.rust = '[(\.)(::)]'
            let g:deoplete#keyword_patterns = {}
            let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'

            let g:deoplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }
            " Use Tab
            " imap <silent><expr> <TAB>
            "     \ pumvisible() ? "\<C-n>" :
            "     \ <SID>check_back_space() ? "\<TAB>" :
            "     \ deoplete#mappings#manual_complete()

            function! s:check_back_space() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~ '\s'
            endfunction

            " Close window on finish
            autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

            au BufNewFile,BufRead *.{stylus,styl} set ft=stylus.css

            aug omnicomplete
                au!
                au FileType css,sass,scss,stylus,less setl omnifunc=csscomplete#CompleteCSS
                au FileType html,htmldjango,jinja,markdown setl omnifunc=emmet#completeTag
                au FileType python setl omnifunc=pythoncomplete#Complete
                au FileType xml setl omnifunc=xmlcomplete#CompleteTags
            aug END
        endif
    " }
" }

