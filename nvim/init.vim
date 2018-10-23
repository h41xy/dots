" ----------------------------------------
" Plugin Section
" ----------------------------------------
"call plug#begin()
"Plug 'vim-airline/vim-airline', { 'branch': 'master' } | Plug 'vim-airline/vim-airline-themes'
"Plug 'ctrlpvim/ctrlp.vim', { 'branch': 'master' }
"Plug 'tpope/vim-fugitive'
"Plug 'scrooloose/nerdtree'
"call plug#end()
" ----------------------------------------
"


set number

" Do not try to be vi compatible
set nocompatible

filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=4
set shiftwidth=4
set softtabstop=4

set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
" let mapleader = ","
let mapleader = "\<space>"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Comment line with #
" Somehow <C-_> is really <C-/>, needs to be mapped this way or else no
" function
nnoremap <C-_> :s/^/#<cr>:noh<cr>
nnoremap <leader>/ :s/^#/<cr>:noh<cr>

" ctrlP like fuzzy recursive finder for current dir
noremap <leader>p :FZF<cr>

" buffer movements
noremap <leader>] :bn<cr>
noremap <leader>[ :bp<cr>
noremap <leader>' :Buffers<cr>
" delete buffer but dont close window
noremap <leader>q :bp\|bd #<CR>

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Colorscheme
colorscheme apprentice

" fzf matches colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"""""" Persitent Undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"""""" Neovim Terminal settings
" Make escape work in the Neovim terminal.
  tnoremap <leader><Esc> <C-\><C-n>

