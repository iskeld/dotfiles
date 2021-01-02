let mapleader = "\<Space>"

" Don't ring the bell for error messages
set noerrorbells 

" Use visual bell instead of beep
set visualbell 

" Activate Syntax Highlight
syntax enable

" set default encoding to UTF-8
set encoding=utf-8

" Highlight search results
set hlsearch

" Don't make a backup before overwriting a file.
set nobackup

" show line numbers
set number

" MOAR colors
set t_Co=256

" Better buffer handling
set hidden

" hightlight cursor position
set cursorline

" indent using 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Wrap lines by default
set wrap linebreak
set showbreak=↪\ 

" ignore case while searching
set ignorecase

" Override ignorecase when term contains upper-case chars
set smartcase

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8 

" disable preview window since we're using float_preview
set completeopt-=preview

set cmdheight=2

call plug#begin('~/.local/share/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'

" Elixir
Plug 'slashmili/alchemist.vim'

" Rust
Plug 'rust-lang/rust.vim'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }

" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline_theme='solarized'

" CtrlP: Full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_open_new_file = 'r'
  nnoremap <Leader>/ :CtrlPCurWD<CR>
  nnoremap <Leader>. :CtrlPCurFile<CR>
  nnoremap <Leader>b :CtrlPBuffer<CR>
  nnoremap <Leader>m :CtrlPMixed<CR>

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

if has("unix")
  Plug 'powerman/vim-plugin-AnsiEsc'
endif

Plug 'tpope/vim-endwise'

Plug 'tpope/vim-vinegar'

" buffer commands that do not close the split
" !!! bufkill seems to be causing issues with netrw preview
" Plug 'qpkorr/vim-bufkill'

" alternative to bufkill
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

  " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
  let g:LanguageClient_serverCommands = {
      \ 'rust': ['rls'],
      \ }

  " Don't show inline errors. See:
  " https://github.com/autozimu/LanguageClient-neovim/issues/719
  let g:LanguageClient_useVirtualText=0

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1

Plug 'ncm2/float-preview.nvim'
  let g:float_preview#docked = 0

call plug#end()

"" Keyboard
" Remove highlights
" Clear the search buffer when hitting return
nnoremap <silent> <Leader><cr> :nohlsearch<cr>

" Move to the next buffer
nmap <Leader>l :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>

" Unload buffer (not using buffkill)
nmap <Leader>q :Sayonara!<CR>

" Wipeout buffer (not using bufkill)
nmap <Leader>Q :bw<CR>

" Save current buffer
nmap <Leader>w :w<CR>

" [i] open new line above cursor with CTRL-L
inoremap <C-L> <C-O>O

" [i] move one char back in insert mode
inoremap <C-Space> <Esc>i

autocmd Filetype elixir setlocal ts=2 sw=2 expandtab

if $BACKGROUND ==? "light"
    set background=light
else
    set background=dark
endif

autocmd vimenter * colorscheme gruvbox

autocmd CompleteDone * pclose
