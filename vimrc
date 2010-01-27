call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" Explicitly set 256 color support
set t_Co=256

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Syntax Highlighting on
set nocompatible
syntax on

" Disable bell.
set vb t_vb=

" line numbers
set number
set numberwidth=3

" Open new horizontal split windows below current
set splitbelow

" Open new vertical split windows to the right
set splitright   

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" don't wrap lines that are too long
set nowrap

" Intelligent tab completion
inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<CR>
inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<CR>
function! <SID>InsertTabWrapper(direction)
  let idx = col('.') - 1
  let str = getline('.')
  if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
        \&& str[idx - 2] =~? '[a-z]'
    if &softtabstop && idx % &softtabstop == 0
      return "\<BS>\<Tab>\<Tab>"
    else
      return "\<BS>\<Tab>"
    endif
  elseif idx == 0 || str[idx - 1] !~? '[a-z]'
    return "\<Tab>"
  elseif a:direction > 0
    return "\<C-p>"
  else
    return "\<C-n>"
  endif
endfunction

