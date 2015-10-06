" Use Vim settings rather than Vi settings; must be set first.
set nocompatible

" Enable line numbers.
set number
" Enable syntax highlighting.
syntax on
" Show the cursor position.
set ruler

" Auto-indent when file type set. Wrap git commit descriptions at 72 characters.
filetype plugin indent on
" Auto-indent when no file type. Indent wrapped lines in git commit bullets.
set autoindent
" Make tabs as wide as two spaces.
set tabstop=2
" Size of an 'indent'.
set shiftwidth=2

" Ignore case of searches.
set ignorecase
" Highlight dynamically as pattern is typed.
set incsearch

" Show the filename in the window titlebar.
set title

" Enable spell check for git commits.
autocmd Filetype gitcommit setlocal spell