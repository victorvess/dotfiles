" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Jul 28
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

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

execute pathogen#infect()

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup


set number  " Show line numbers
set relativenumber
set nowrap  " Wrap lines
set showbreak=+++  " Wrap-broken line prefix
set textwidth=100  " Line wrap (number of cols)
set showmatch  " Highlight matching brace
set visualbell  " Use visual bell (no beeping)
 
set hlsearch  " Highlight all search results
set smartcase  " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch  " Searches for strings incrementally
 
set autoindent  " Auto-indent new lines
set expandtab  " Use spaces instead of tabs
set shiftwidth=2  " Number of auto-indent spaces
set smartindent  " Enable smart-indent
set smarttab  " Enable smart-tabs
set softtabstop=2  " Number of spaces per Tab
 
set ruler  " Show row and column ruler information
 
set undolevels=1000  " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
 

let g:vim_json_syntax_conceal = 0


au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
au FileType xslt setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

color grb2
