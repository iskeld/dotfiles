set nocompatible
let mapleader = "\<Space>"

set number " Print line number
set noerrorbells " Don't ring the bell for error messages
set visualbell " Use visual bell instead of beep
set cursorline "Hightlight current line

" indent using 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Wrap lines by default
set wrap linebreak
set showbreak=" "

set scrolloff=8 " Keep 8 lines above or below the cursor when scrolling.

" set splitbelow " disabled due to the bug in netrw http://stackoverflow.com/questions/34173655/how-to-jump-back-to-netrw-when-splitbelow-is-on
set splitright

" This allows buffers to be hidden if you've modified a buffer.
set hidden

set ignorecase
set smartcase

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'bkad/CamelCaseMotion'

" Plug 'tomasr/molokai'
" Plug 'djjcast/mirodark'
Plug 'joshdick/onedark.vim'
Plug 'ciaranm/inkpot'

Plug 'ctrlpvim/ctrlp.vim'
" Type <Leader>o to open a new file
nnoremap <Leader>o :CtrlP<CR>
" Type <Leader>O to open buffer
nnoremap <Leader>O :CtrlPBuffer<CR>

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_theme='powerlineish'
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_z=''

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.fsharp = ['.']
let g:ycm_autoclose_preview_window_after_completion = 1

Plug 'fsharp/vim-fsharp', {
    \ 'for': 'fsharp',
    \ 'do': 'make fsautocomplete'
    \}

Plug 'keith/swift.vim'

call plug#end()

call camelcasemotion#CreateMotionMappings('<leader>')

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

" Enter visual mode with space space
nmap <Leader><Leader> V

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

nmap <leader>q :bd<CR>

if executable('ag')
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " don't use cache, ag seems fast enough
    let g:ctrlp_use_caching = 0
endif

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

colorscheme inkpot
