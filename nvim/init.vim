"                   __
"    __          __/\ \__               __
"   /\_\    ___ /\_\ \ ,_\      __  __ /\_\    ___ ___
"   \/\ \ /' _ `\/\ \ \ \/     /\ \/\ \\/\ \ /' __` __`\
"    \ \ \/\ \/\ \ \ \ \ \_  __\ \ \_/ |\ \ \/\ \/\ \/\ \
"     \ \_\ \_\ \_\ \_\ \__\/\_\\ \___/  \ \_\ \_\ \_\ \_\
"      \/_/\/_/\/_/\/_/\/__/\/_/ \/__/    \/_/\/_/\/_/\/_/

"       author: Liam Ederzeel

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

" Bundles {
"
			function! BuildComposer(info)
				if a:info.status != 'unchanged' || a:info.force
					if has('nvim')
						!cargo build --release
					else
						!cargo build --release --no-default-features --features json-rpc
					endif
				endif
			endfunction

    set runtimepath+=~/.vim/plugged/repos/github.com/Shougo/dein.vim
	if dein#load_state(expand('~/.vim/plugged'))
		call dein#begin(expand('~/.vim/plugged'))
       	call dein#add('Shougo/dein.vim')

        " Utilities{
            " call dein#add('Shougo/vimproc.vim', {'build': 'make'})
            call dein#add('editorconfig/editorconfig-vim')
            call dein#add('tpope/vim-surround')                             " Sorroundings
            " call dein#add('tpope/vim-repeat')                             " More . command
            " call dein#add('tpope/vim-abolish')                            " Better replace
            " call dein#add('tpope/vim-unimpaired')                         " Key mappings for [
            " call dein#add('tommcdo/vim-exchange')                         " Exchange motion
            " call dein#add('AndrewRadev/splitjoin.vim')                    " Split onelinners with gS
            call dein#add('SirVer/ultisnips')                               " Snippets
            call dein#add('marcweber/vim-addon-mw-utils')
            " call dein#add('honza/vim-snippets')
            " call dein#add('wellle/targets.vim')                           " Better motions
            call dein#add('Raimondi/delimitMate')                           " Auto close quotes parentesis etc
            call dein#add('mhinz/vim-grepper')                              " Multiple grep support
            " call dein#add('sjl/gundo.vim')                                " Undo tree
            call dein#add('godlygeek/tabular')                              " Align code
            " call dein#add('vim-scripts/BufOnly.vim')                      " Close All other buffers
            call dein#add('airblade/vim-rooter')
            call dein#add('tpope/vim-dispatch')                             " Asynchronous build and test dispatcher
            call dein#add('tomtom/tcomment_vim')
            call dein#add('mattn/emmet-vim')
            call dein#add('dermusikman/sonicpi.vim')
            call dein#add('Shougo/deoplete.nvim')
            call dein#add('mhinz/vim-startify')                             " Start Screen
            " call dein#add('neomake/neomake')                              " Async Syntax check
            " call dein#add('Yggdroot/indentLine')
            call dein#add('junegunn/fzf', { 'build': './install --all' })   " Fuzzy finder
            call dein#add('junegunn/fzf.vim')                               " fzf vim plugin
            call dein#add('brooth/far.vim')
            call dein#add('christoomey/vim-tmux-navigator')
            call dein#add('tpope/vim-fugitive')                             " Git wrapper
            call dein#add('euclio/vim-markdown-composer', {'build': 'cargo build --release'})                   " Markdown live previewer

            if OSX()
                call dein#add('wakatime/vim-wakatime')                      " register time
            endif
        " }
        " Prose {
            call dein#add('reedes/vim-pencil', {'on_ft': ['markdown', 'text']})
            call dein#add('reedes/vim-lexical', {'on_ft': ['markdown', 'text']})
            call dein#add('reedes/vim-wordy', {'on_ft': ['markdown', 'text']})
            call dein#add('dbmrq/vim-ditto', {'on_ft': ['markdown', 'text']})
            call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown', 'text']})
            call dein#add('junegunn/limelight.vim', {'on_ft': ['markdown', 'text']})
        " }
        " VCS {
            call dein#add('tpope/vim-fugitive')                           " Git wrapper
            call dein#add('airblade/vim-gitgutter')                       " Git gutter simbols
        " }
        " UI {
            call dein#add('hzchirs/vim-material')
            call dein#add('AlxHnr/clear_colors')
            call dein#add('mhartington/oceanic-next')
            call dein#add('liamederzeel/solo.vim')
            call dein#add('rakr/vim-one')
            call dein#add('crusoexia/vim-monokai')
            call dein#add('frankier/neovim-colors-solarized-truecolor-only')
            call dein#add('bling/vim-airline')
            call dein#add('vim-airline/vim-airline-themes')
            call dein#add('edkolev/tmuxline.vim')
            call dein#add('Valloric/MatchTagAlways')
            " call dein#add('altercation/vim-colors-solarized')
            " call dein#add('w0ng/vim-hybrid')
            " call dein#add('whatyouhide/vim-gotham')
            " call dein#add('morhetz/gruvbox')
        " }
        " Language {
            call dein#add('lilydjwg/colorizer')                     " Preview colors
            call dein#add('vim-scripts/vim-polyglot')
            " call dein#add('garbas/vim-snipmate')
            " call dein#add('rust-lang/rust.vim', {})
            " call dein#add('racer-rust/vim-racer', {})
            " call dein#add('cespare/vim-toml', { 'on_ft': 'toml' })
            " call dein#add('mattn/emmet-vim', {})
            " call dein#add('shime/vim-livedown')					" Markdown previewer
            " call dein#add('jaawerth/nrun.vim', {})
            " " Yaml
            " call dein#add('mrk21/yaml-vim')
            " " C#
            call dein#add('OrangeT/vim-csharp')
            " " JS
            " call dein#add('pangloss/vim-javascript')
            " call dein#add('mxw/vim-jsx')
            " call dein#add('leafgarland/typescript-vim')
            " call dein#add('crusoexia/vim-javascript-lib')
            " call dein#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
            " " JSON
            " call dein#add('elzr/vim-json', { 'on_ft': 'json' })
            call dein#add('vim-scripts/ShaderHighLight')            " Shader lab
            " " HTML
            " call dein#add('othree/html5.vim', { 'on_ft': ['html', 'markdown' ]})
            " " CSS
            " call dein#add('JulesWang/css.vim')
            " call dein#add('hail2u/vim-css3-syntax')
            " call dein#add('cakebaker/scss-syntax.vim')

            if OSX()
                call dein#add('OmniSharp/omnisharp-vim', {
                        \ 'build': 'sh -c "cd server/ && xbuild"',
                        \ 'on_ft': 'cs'
                        \ })
                " call dein#add('Robzz/deoplete-omnisharp',{
                "         \ 'on_ft': 'cs',
                "         \ 'depends': 'omnisharp-vim'
                "         \ })
            endif
        " }

        " programming {
            call dein#add('neoclide/coc.nvim', { 'build': 'yarn install' })
        " }

        call dein#end()

        if dein#check_install()
            call dein#install()
        endif
        call dein#check_lazy_plugins()
        call dein#save_state()
    endif
" }

" General {
    set background=dark
    filetype plugin on                      " Automatically detect file types.
    syntax on                               " Turn syntax highlighting on
    set mouse=a                             " Automatically enable mouse usage
    set mousehide                           " Hide the mouse cursor while typing
    set complete-=i                         " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
    set ffs=unix,dos
    set ff=unix                             " Change DOS line endings to unix
    set nrformats-=octal                    " Ctrl A considers numbers starting with 0 octal
    set autoread
    scriptencoding utf-8
    set clipboard=unnamed                   " Set clipboard buffer to unnamed
    set undofile                            " turn on the feature
    set undodir=$HOME/.vim/undo             " directory where the undo files will be stored

    " Ignore files {
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

" UI {
    if has('nvim')
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    endif

    if has('termguicolors')
        set termguicolors
    endif

    highlight clear SignColumn                      " SignColumn should match background
    highlight clear LineNr                          " Current line number row will have same background color in relative mode

    if has('nvim')
        set inccommand=nosplit
    endif

    let g:material_style='oceanic'
    set background=dark
    colorscheme vim-material                        " Set theme to one

    set guicursor=a:blinkon0
    set cursorline                                  " Highlight current line
    set ruler                                       " Shows line and column of cursor
    set relativenumber number                       " Line numbers
    set backspace=2                                 " Backspace beyond insert point
    set cmdheight=1
    set laststatus=2                                " Always display the statusline in all windows
    set guifont=Inconsolata\ for\ Powerline:h14
    set noshowmode                                  " Hide the default mode text (e.g. -- INSERT -- below the statusline)
    set fillchars+=vert:┆

    augroup VimCSS3Syntax
        autocmd!

        autocmd FileType scss setlocal iskeyword+=-
    augroup END
" }

" Formatting {
    autocmd BufWritePre * :%s/\s\+$//e              " Removes traling spaces on buffer write
    set wrap
    set linebreak
    set nolist                                      " list disables linebreak
    set shiftwidth=4                                " Size of indent
    set tabstop=4                                   " Size of hard tbstop
    set splitright                                  " Puts new vsplit windows to the right of the current
    set splitbelow                                  " Puts new split windows below the current
    set foldmethod=syntax
    set foldlevel=10
" }

" Key mapping {
    let mapleader = "\<Space>"
    noremap L g_
    noremap H ^
    noremap J 5j
    noremap K 5k
    nnoremap ; :
    vmap < <gv
    vmap > >gv
    vnoremap <c-/> :TComment<cr>
    nnoremap <Enter> za                             " Toggel folds
    map R <Nop>                                     " Unmap replace mode
    map r <Nop>                                     " Unmap virtual replace mode
" }

" Plugins {

    " sonicpi {
        " let g:sonicpi_enable = 1
    " }

    " Vim-airline {
        let g:airline_powerline_fonts = 1               " airline uses powerline font
        let g:solo_airline = 1                          " airline uses powerline font
        let g:airline_theme='material'
        let g:airline#extensions#tabline#enabled = 1    " nice buffer top bar
    " }

        " OmniSharp {
        if dein#tap("omnisharp-vim")
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
        endif
        " }

    " " Vim-javascript {
    "     set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
    " " }

    " " indentLine {
    "     let g:indentLine_enabled = 1            " Enable indentLine plugin
    "     let g:indentLine_char = '┆'             " Line indent type ¦ ┆ ︙│
    "     let g:indentLine_color_term = 239       " Set lineindents to comment color
    "     let g:indentLine_setColors = 0
    " " }

    " " Neomake {
    "     autocmd! BufWritePost,BufEnter * Neomake
    "
    "     " neomake stuff no qlu
    "     autocmd! BufWritePost * Neomake
    "     " autocmd! BufWritePost,BufEnter * Neomake
    "     " autocmd! BufWritePost,BufReadPost * Neomake
    "     let g:neomake_open_list = 2
    "     let g:neomake_list_height = 5
    "     " let g:neomake_warning_sign = {
    "     "   \ 'text': 'W',
    "     "   \ 'texthl': 'WarningMsg',
    "     "   \ }
    "     " let g:neomake_error_sign = {
    "     "   \ 'text': 'E',
    "     "   \ 'texthl': 'ErrorMsg',
    "     "   \ }
    " " }

    " fzf {
        " nnoremap <silent> <c-p> :call fzf#run({
        "     \   'down': '40%',
        "     \   'sink': 'botright split' })<CR>

        nnoremap <silent> <c-p> :Files<CR>


        function! s:find_git_root()
          return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
        endfunction

        command! ProjectFiles execute 'Files' s:find_git_root()
        let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
    " }

    " Deoplete {
        if dein#tap("deoplete.nvim")
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
        endif
    " }

    " Tmux Navigation {
        nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
    " }

    " Startify {

        let g:startify_custom_header = [
            \ '                    __                   ',
            \ '      ___   __  __ /\_\    ___ ___       ',
            \ '    /'' _ `\/\ \/\ \\/\ \ /'' __` __`\     ',
            \ '    /\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \    ',
            \ '    \ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\   ',
            \ '     \/_/\/_/\/__/    \/_/\/_/\/_/\/_/   ',
            \ ]

        let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, {'cc': '~/.zshrc'} ]
    " }

    " EditorConfig {
        let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
    " }

    " Lexical {
        augroup lexical
            autocmd!
            autocmd FileType markdown,mkd call lexical#init()
            autocmd FileType textile call lexical#init()
            autocmd FileType text call lexical#init({ 'spell': 0 })
        augroup END
    " }

"}

" Completion {

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
" }

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
        call s:FormatOnSave()
        " call s:CreateDirOnSave()
    endfunction

    augroup vimrc-on-save
        autocmd!
        autocmd BufWritePre * call s:OnSave()
    augroup END
" }

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

" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
