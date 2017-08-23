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
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
call plug#end()


" Signs and highlighting for errors, etc.
let s:error_sign = '✘'
let s:error_hl = 'ErrorMsg'
let s:warning_sign = '♦'
let s:warning_hl = 'WarningMsg'
let s:message_sign = '→'
let s:message_hl = 'Normal'
let s:info_sign = '…'
let s:info_hl = 'Normal'

" Syntax checking on save
augroup run_neomake
  autocmd!
  autocmd BufReadPost,BufWritePost * Neomake
augroup END
let g:neomake_open_list = 2
let g:neomake_verbose = 1
let g:neomake_java_enabled_makers=['javac']
let g:neomake_error_sign = {
      \ 'text': s:error_sign,
      \ 'texthl': s:error_hl,
      \ }
let g:neomake_warning_sign = {
      \ 'text': s:warning_sign,
      \ 'texthl': s:warning_hl,
      \ }
let g:neomake_message_sign = {
      \ 'text': s:message_sign,
      \ 'texthl': s:message_hl,
      \ }
let g:neomake_info_sign = {
      \ 'text': s:info_sign,
      \ 'texthl': s:info_hl,
      \ }
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
