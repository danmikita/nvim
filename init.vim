call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'janko-m/vim-test'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
call plug#end()

" Syntax checking on save
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '♦'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
" let g:ale_open_list = 1

set makeprg=mvn\ compile\ -q\ -DskipTests
let mapleader = ","
set number
set autowrite
set termguicolors

" NerdTree 
map <leader>. :NERDTreeToggle<CR>

" Window shortcut mappings
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>

set splitbelow
set splitright

" Vim Test shortcut mappings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Theme settings
syntax enable
set background=dark
colorscheme NeoSolarized

" Airline
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" JavaComplete2
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:deoplete#omni_patterns = {}
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

let g:java_highlight_all = 1
let g:java_highlight_debug = 1
let g:java_highlight_functions = 1
let g:java_allow_cpp_keywords = 1

" vim-gitgutter faster refresh of changes 
set updatetime=250
let g:signify_vcs_list = [ 'git']
let g:signify_realtime = 1

" Fuzzy file finder
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

" Delimitmate
let delimitMate_expand_cr = 1
