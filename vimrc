"######################################################
"###### VIMRC #########################################
"######################################################

" Environment {{{

"change leader to ','
let mapleader = ","


" enable linenumbers permanently
set number
set relativenumber

" enable syntax permanently
syntax on

" set standard colorscheme
colorscheme railscasts

" enable filetype detect for filetype specific settings via ~/.vim/ftplugin/
filetype plugin on

"fuzzy finder
set path+=**
set wildmenu

" set indentations
set tabstop=2
set shiftwidth=2
set expandtab  "space instead of tabstop

" enable highlight of cursorline
set cursorline

" enable folding and set to marker as default
set foldmethod=marker
set foldmarker={{{,}}}
set foldlevelstart=99

" sync system clipboard with main register (needs vim-gtk)
if has ('clipboard')
    set clipboard=unnamed
endif

"C-y accept autocomplete popup; Enter accept or \n
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"

" disable linebreaks per default
set nowrap nolinebreak

" show 3 lines of buffer above/below cursorline
set scrolloff=3

" enable standard indentation
set autoindent

" change *.swp file directory
set directory=~/.vim/swp/

" END Environment }}}

" Plugins {{{ 

" vim Pathogen {{{
" change runtime to enable pluginsupport

execute pathogen#infect()

" END vim Pathogen }}}

" NERDTree {{{

let NERDTreeQuitOnOpen=0
set hidden "open files in new buffer, not split

" END NERDTree }}}

" surroundings.vim

" Persistent Undo Config {{{
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" END Persistent Undo }}}

" END Plugins }}} 

" User created Functions {{{

" Preserve cursor position {{{

function! Preserve(command)
    " Save the last search.
    let search = @/

    " Save the current cursor position.
    let cursor_position = getpos('.')

    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)

    " Execute the command.
    execute a:command

    " Restore the last search.
    let @/ = search

    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt

    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" END preserver cursor position }}}

" Re-indent buffer {{{

function! Indent()
    call Preserve('normal gg=G')
endfunction

" END Re-indent buffer }}}

" remove trailing whitespaces {{{

function! RemoveTrailingWhitespace()
    call Preserve(':%s/\s\+$//e')
endfunction

" END remove trailing whitespaces }}}

" END user created Functions }}}


"Test:
"    let g:go_highlight_functions = 1
"    let g:go_highlight_methods = 1
"    let g:go_highlight_structs = 1
"    let g:go_highlight_operators = 1
