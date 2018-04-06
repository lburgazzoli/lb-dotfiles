" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" have the mouse enabled all the time:
set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline

" don't make it look like there are line breaks where there aren't:
set nowrap

" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set laststatus=2

set noerrorbells
set number
set ruler
set ch=1

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos. 
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir -p ~/.vim/tmp/backup')
call system('mkdir -p ~/.vim/tmp/swap')

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir -p ~/.vim/tmp/undodir')
    set undodir=~/.vim/tmp/undodir//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif