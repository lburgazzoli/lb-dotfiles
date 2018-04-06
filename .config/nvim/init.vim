set nocompatible 
syntax on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'airblade/vim-rooter'


call plug#end()

runtime! init.d/**.vim


