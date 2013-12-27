" set background=light
colorscheme solarized

set lines=47
set columns=146

set guioptions-=T " no toolbar, tearoff menu items and menu bar at all

" OS Specific
if has("gui_macvim")

	set guioptions-=r
	set guifont=Monaco\ for\ Powerline:h12

	set transparency=5

	" PeepOpen settings
	macmenu &File.Open\.\.\. key=<nop>
	map <D-o> <Plug>PeepOpen

elseif has("gui_gtk2")
elseif has("x11")
elseif has("gui_win32")

	set guifont=Consolas:h9:cRUSSIAN

	" Alt-Space is System menu
	noremap <M-Space> :simalt ~<CR>
	inoremap <M-Space> <C-O>:simalt ~<CR>
	cnoremap <M-Space> <C-C>:simalt ~<CR>

end

