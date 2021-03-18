" Key mapping {
	let mapleader = "\\"
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
