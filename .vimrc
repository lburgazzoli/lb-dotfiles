" first clear any existing autocommands:
autocmd!

set nocompatible 
syntax on

" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/xml.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'racer-rust/vim-racer'
Plug 'matze/vim-move'
Plug 'tpope/vim-obsession'
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'scrooloose/syntastic'
"Plug 'dracula/vim'

call plug#end()

runtime! init/**.vim
