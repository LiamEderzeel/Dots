syntax on                               " Turn syntax highlighting on
set background=dark
filetype plugin on                      " Automatically detect file types.
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
