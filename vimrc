map q <Nop>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = ","

set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start
set wildmenu
set showmatch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
nmap <leader>w :update<cr>
set mouse=nicr
set scrolloff=5

call plug#begin()
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ervandew/supertab'
Plug 'sebdah/vim-delve'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features, it's ok to break compatibility with vi
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
"set ttymouse=xterm2             " Indicate terminal type for mouse codes
"set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set pumheight=10                " Completion window max size
set lazyredraw                  " Wait to redraw
set completeopt=menu,menuone,preview
set previewheight=1             " Set the size of the autocompletion preview to 1 line
set nu
set clipboard=unnamedplus
set timeoutlen=1000 ttimeoutlen=1 "Fast escape

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo/
endif

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
let term="xterm2"
colorscheme molokai
set background=dark

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
"map <leader>n :cnext<CR>
"map <leader>m :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <silent> <leader>q :Sayonara<CR>


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
"nnoremap Y y$

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 0
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"
let g:go_jump_to_error = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
"let g:go_auto_sameids = 1
let go_doc_popup_window = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

autocmd FileType yaml set listchars=tab:\|\
autocmd FileType yml set listchars=tab:\|\

augroup go
  autocmd!
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow


let g:go_metalinter_enabled = ['golint']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = '8s'
let g:go_metalinter_enabled = ['golint', 'vetshadow', 'errcheck', 'ineffassign', 'vet', 'goimports',  'dupl', 'gofmt', 'varcheck', 'gocyclo', 'structcheck', 'deadcode']
let g:go_auto_type_info = 0
let g:go_def_reuse_buffer = 0

set updatetime=700

let g:goyo_width = 100

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1


" Show hidden files in NERDtree
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', '#3366FF', '#151515')

set statusline=%F:%l/%L

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Supertab autocompletion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" TagBar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" GitGutter
set signcolumn=yes "prefer always visible, render issues with autocompletion

" set python3 bin
let g:python3_host_prog = '/usr/local/bin/python3'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'gometalinter']
"let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

" open terminal in split mode
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

vnoremap  <leader>y  "+y

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

autocmd FileType gitcommit set bufhidden=delete

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_max_files=100000
let g:ctrlp_max_depth=1000
let g:ctrlp_by_filename = 1

augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

set cursorline
let g:ackprg = 'ag --nogroup --nocolor --column'

set path+=**
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

command Q q
command Qa qa
command QA qa
command WQ wq
command W w

let g:goyo_width = 100
let g:ctrlp_working_path_mode = 'ra'
imap jj <Esc>
nnoremap * *``
command Sesource :split ~/.config/nvim/init.vim
command Vesource :vsplit ~/.config/nvim/init.vim
command SourceSource :source ~/.config/nvim/init.vim

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

set noshowmode
let g:bufferline_echo = 0
"set ambiwidth=double
let g:airline_skip_empty_sections = 1

let g:ale_fix_on_save = 1
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'go': ['gofmt','goimports']
\}
