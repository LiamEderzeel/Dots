execute pathogen#infect()
syntax on                               " Turn syntax highlighting on
set nu                                  " Line numbers
set wrapmargin=5                        " Wraps lines in character spaces from the right
set ruler                               " Shows line and column of cursor
set cursorline                          " Highlight current line
set backspace=2                         " Backspace beyond insert point
set tabstop=4                           " Size of hard tbstop
set shiftwidth=4                        " Size of indent
set expandtab                           " Use space instead of tab characters
match ErrorMsg '\s\+$'
let g:indentLine_enabled = 1            " Enable indentLine plugin
let g:indentLine_char = '┆'             " Line indent type ¦ ┆ ︙│
let g:indentLine_color_term = 239       " Set lineindents to comment color
set clipboard=unnamed                " Set clipboard buffer to unnamed
colorscheme	monokai                     " Set theme to monokai
let g:monokai_italic = 1                " Enable italic
let g:monokai_thick_border = 1          " Set window border
let g:airline_powerline_fonts = 1       " airline uses powerline font
let g:airline_theme = 'base16'
let g:airline#extensions#tabline#enabled = 1
autocmd BufWritePre * :%s/\s\+$//e      " Removes traling spaces
let g:move_key_modifier = 'C'
let g:sonicpi_enable = 1

set nocompatible                        " be iMproved, required
filetype off                            " required
set rtp+=~/.vim/bundle/Vundle.vim       " set the runtime path to include Vundle and initialize
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'              " let Vundle manage Vundle, required

" All of your Plugins must be added before the following line

Plugin 'crusoexia/vim-monokai'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'mattn/emmet-vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'matze/vim-move'
Plugin 'dermusikman/sonicpi.vim'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" CtrlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Vim-javascript
set rtp+=/Users/raguay/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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

