set nocompatible
filetype off                  " required by Vundle

set path=.,,**
set autochdir                 " set working directory to the current file

set autoread
set history=50                " keep 50 lines of command line history
set incsearch                 " do incremental searching
set showcmd                   " display incomplete commands
set ruler                     " show the cursor position all the time
set number
" set relativenumber          " not always works

set fileformats=unix,dos,mac

" Don't create swap files
set nobackup 
set nowb
set noswapfile

colorscheme slate

set clipboard=unnamed
set colorcolumn=100

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X is Cut
"vnoremap <C-X> "+x

" CTRL-C is Copy
"vnoremap <C-C> "+y

" Use CTRL-S for saving, also in Insert mode
"noremap <C-S>		:update<CR>
"vnoremap <C-S>		<C-C>:update<CR>
"inoremap <C-S>		<C-O>:update<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

set tabstop=4 shiftwidth=4 noexpandtab textwidth=79

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 79 characters.
	autocmd FileType * setlocal textwidth=79

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

	augroup END

	" HTML (tab width 2 chr, no wrapping)
	autocmd FileType html setlocal shiftwidth=2 tabstop=2 textwidth=0
	" XHTML (tab width 2 chr, no wrapping)
	autocmd FileType xhtml setlocal shiftwidth=2 tabstop=2 textwidth=0
	" CSS (tab width 2 chr, wrap at 79th char)
	autocmd FileType css setlocal shiftwidth=2 tabstop=2

	" Ruby (tab width 2 chr, wrap at 79th char)
	autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
	" Python (tab width 4 chr, wrap at 79th char)
	autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

else
	set autoindent		" always set autoindenting on
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	        \ | wincmd p | diffthis
endif

let html_use_css=1

let g:airline_theme = "powerlineish"
let g:airline_powerline_fonts = 1
" Always show Airline
set laststatus=2
" Never show built-in status line
set noshowmode

let g:peepopen_quit = 1

