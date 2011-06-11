" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Security
" http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" Note: Pathogen functions must be invoked before 'filetype plugin indent on'
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  "filetype plugin indent on
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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

"else

"	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set mouse=a					" Enable mouse usage (all modes)
set autowrite					" Automatically save before commands like :next and :make
set backspace=indent,eol,start	" ...
"set cursorline					" ...
set gdefault					" applies substitutions globally on lines by default.  To apply only to first word, add g to the end (:%s/foo/bar/g)
set hidden						" Hide buffers when they are abandoned
set history=50					" keep 50 lines of command line history
set ignorecase					" Do case insensitive matching
set incsearch					" Incremental search: show results as you type
"set laststatus=2				" ...
set nowrap						" Don't wrap lines
set nu							" line numbering
set shiftwidth=4				" number of spaces to use for autoindenting
set shiftround					" use multiple of shiftwidth when indenting
set showcmd						" Show (partial) command in status line.
set showmatch					" Show matching brackets.
"set showmode					" ...
set smartcase					" Do smart case matching
"set smarttab					" insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=4				" ...
set tabstop=4					" a tab is four spaces
set expandtab
set ruler						" show the cursor position all the time
"set ttyfast						" ...
set undolevels=100				" undo up to 100 commands
set pastetoggle=<M-F2>			" use F2 to turn off autoindent when pasting multiple paragraphs
"set visualbell					" ...
"set wildmenu					" ...
"set wildmode=list:longest		" ...
runtime ftplugin/man.vim        " Turn on Man pages

" Set colors & scheme
"colorscheme zenburn 
"colors zenburn

" remap : to ;
nnoremap ; :

" use Perl/Python regex, not Vim's default regex
nnoremap / /\v
vnoremap / /\v

" open a vertical split and switch to it
nnoremap <leader>w <C-w>v<C-w>l

" move around the split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap Esc to jj in Insert mode
inoremap jj <ESC>

" Use Q for formatting the current paragraph (or selection)
"vmap Q gq					" already set above
nmap Q gqap

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1
syntax on

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Save when losing focus
au FocusLost * :wa

" Automatically create .backup directory, writable by the group.
if filewritable(".") && ! filewritable("vim~")
  silent execute '!umask 0022; mkdir vim~'
endif

" Set backup directory to the vim~ directory created above in the current
" path.  
set backupdir=./vim~
set directory=./vim~
