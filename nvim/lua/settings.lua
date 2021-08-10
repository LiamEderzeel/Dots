vim.cmd('syntax on') -- syntax highlighting
vim.o.title = true
-- vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.mouse = "a" -- enable mouse
vim.cmd[[colorscheme tokyonight]]
vim.g.tokyonight_style = "night"
vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR = 1')
vim.cmd('highlight clear SignColumn')
vim.o.cmdheight = 2 -- more space in the neovim command line for displaying messages
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.smartcase = true -- smart case
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.fillchars = 'eob: ' -- set ~ mark as end of file filler to nothing
vim.o.guifont = "RobotoMono Nerd Font Mono:h17"
vim.o.updatetime = 300 -- Faster completion
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.completeopt = "menuone,noselect"
vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.tabstop = 2 -- insert 2 spaces for a tab
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 -- always show tabs
vim.o.scrolloff = 8 -- minimum amount of screen lines to show while scrolling
vim.o.sidescrolloff = 8
vim.o.undofile = true -- enable persistent undo
vim.o.swapfile = false -- creates a swapfile
-- vim.o.undodir = CACHE_PATH .. "/undo" -- set an undo directory
-- vim.o.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.o.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.o.hlsearch = true -- highlight all matches on previous search pattern
vim.o.foldmethod = "manual" -- folding, set to "expr" for treesitter based folding
vim.o.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.colorcolumn = "99999" -- fixes indentline for now
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.showtabline = 2 -- always show tabs
vim.o.wrap = false -- display lines as one long line
vim.o.spell = false
vim.o.spelllang = "en"


-- vim.cmd([[
-- " syntax on                               " Turn syntax highlighting on
-- " set background=dark
-- filetype plugin on                      " Automatically detect file types.
-- set mouse=a                             " Automatically enable mouse usage
-- set mousehide                           " Hide the mouse cursor while typing
-- set complete-=i                         " Complete only on current buffer http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
-- set ffs=unix,dos
-- set ff=unix                             " Change DOS line endings to unix
-- set nrformats-=octal                    " Ctrl A considers numbers starting with 0 octal
-- set autoread
-- " scriptencoding utf-8
-- " set clipboard=unnamed                   " Set clipboard buffer to unnamed
-- set clipboard^=unnamed
-- set undofile                            " turn on the feature
-- set undodir=$HOME/.vim/undo             " directory where the undo files will be stored
-- set guicursor=a:blinkon0
-- set cursorline                          " Highlight current line
-- set ruler                               " Shows line and column of cursor
-- set relativenumber number               " Line numbers
-- set backspace=2                         " Backspace beyond insert point
-- set cmdheight=1
-- set laststatus=2                        " Always display the statusline in all windows
-- set guifont=Inconsolata\ for\ Powerline:h14
-- set fillchars+=vert:┆
--
-- if (has('nvim'))
-- 	let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
-- 	endif
-- 	" if (has('termguicolors'))
-- 	"  set termguicolors
-- 	" endif
--
-- 	highlight clear SignColumn                      " SignColumn should match background
-- 	highlight clear LineNr                          " Current line number row will have same background color in relative mode
--
-- 	set wildignore+=node_modules/**,
-- 	set wildignore+=bower_components/**,
-- 	set wildignore+=.git/**,
-- 	set wildignore+=*.meta,
-- 	set wildignore+=*.prefab,
-- 	set wildignore+=*.sample,
-- 	set wildignore+=*.asset,
-- 	set wildignore+=*.unity,
-- 	set wildignore+=*.anim,
-- 	set wildignore+=*.controller,
-- 	set wildignore+=*.jpg,
-- 	set wildignore+=*.png,
-- 	set wildignore+=*.mp3,
-- 	set wildignore+=*.wav,
-- 	set wildignore+=*.ttf,
-- 	set wildignore+=*.pdf,
-- 	set wildignore+=*.psd,
-- 	set wildignore+=*.shader,
-- 	set wildignore+=*.dll,
-- 	set wildignore+=*.mat,
-- 	set wildignore+=*.file,
-- 	set wildignore+=*.unitypackage,
-- 	set wildignore+=debug/,
-- 	set wildignore+=Debug/,
-- 	set wildignore+=temp/,
-- 	set wildignore+=Temp/,
-- 	set wildignore+=temp/,
--
-- 	autocmd BufWritePre * :%s/\s\+$//e              " Removes traling spaces on buffer write
-- 	set wrap
-- 	set linebreak
-- 	set nolist                                      " list disables linebreak
-- 	set shiftwidth=4                                " Size of indent
-- 	set tabstop=4                                   " Size of hard tbstop
-- 	set splitright                                  " Puts new vsplit windows to the right of the current
-- 	set splitbelow                                  " Puts new split windows below the current
-- 	set foldmethod=syntax
-- 	set foldlevel=10
-- 					]])
