set nocompatible
let mapleader = "\<Space>"

let isWindows = has('win32') || has('win64')

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
Plug 'ctrlpvim/ctrlp.vim'

" color schemes
Plug 'ciaranm/inkpot'
Plug 'altercation/vim-colors-solarized'

nnoremap <Leader>/ :CtrlPMRU<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>O :CtrlPMixed<CR>

" [i] open new line above cursor with CTRL-L
inoremap <C-L> <C-O>O

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_theme='solarized'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_autoclose_preview_window_after_completion = 1

if !isWindows
    Plug 'keith/swift.vim'
endif

Plug 'elixir-lang/vim-elixir'

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
    if isWindows
        let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s | dos2unix'
    else
        " use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor\ --column

        " Use ag in CtrlP for listing files.
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif

    " don't use cache, ag seems fast enough
    let g:ctrlp_use_caching = 0
endif

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

set background=dark
colorscheme solarized

if isWindows
    set guifont=Menlo:h12:cEASTEUROPE
endif
