  set nocompatible              " be iMproved, required
set number relativenumber     " show line numbers
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Seamless tmux and vim panes navigation
Plugin 'christoomey/vim-tmux-navigator'

" Fuzzy finder
Plugin 'junegunn/fzf.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Color scheme
Plugin 'tomasr/molokai'

Plugin 'mileszs/ack.vim'

" Waka
Plugin 'wakatime/vim-wakatime'

" Vim-commentary
Plugin 'tpope/vim-commentary'

" Emmet
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
:autocmd Filetype ruby,html,yaml,javascript setl softtabstop=2
:autocmd Filetype ruby,html,yaml,javascript setl sw=2
:autocmd Filetype ruby,html,yaml,javascript setl ts=2
autocmd Filetype python setl softtabstop=4
autocmd Filetype python setl sw=4
autocmd Filetype python setl ts=4
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

syntax on
colorscheme molokai
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:mapleader = '-'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

nnoremap <C-p> :Files<Cr>

" I don't care about unsaved buffers until I quit vim
set hidden

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case -g ''!indexme'''

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

command W w
command Q q
