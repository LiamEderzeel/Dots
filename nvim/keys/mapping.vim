" Key mapping {
	" let mapleader = "\<Space>"
	noremap L g_
	noremap H ^
	noremap J 5j
	noremap K 5k
	nnoremap ; :
	nnoremap <silent> <c-p> :Files<CR>
	vmap < <gv
	vmap > >gv
	nnoremap <Enter> za                             " Toggel folds
	map R <Nop>                                     " Unmap replace mode
	map r <Nop>                                     " Unmap virtual replace mode
" }
