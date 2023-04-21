" Lightline settings
let g:lightline = {
\ 'component_function': {
\   'filename': 'LightLineFilename',
\   'mode': 'LightlineMode',
\   'gitbranch': 'fugitive#head',
\   'gitgutter': 'LightLineGitGutter',
\ },
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'relativepath', 'modified'] ],
\   'right': [ [ 'lineinfo' ],
\              [ 'percent' ],
\              [ 'tagbar', 'fileformat', 'fileencoding', 'gitgutter', 'filetype'] ]
\ },
\ 'component': {
\   'tagbar': '%{tagbar#currenttag("%s", "", "f")}',
\ },
\ }

" Key mappings
map q <Nop>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = ","

" Basic settings
set backspace=indent,eol,start
set wildmenu
set showmatch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
nmap <leader>w :w<cr>
set mouse=nicr
set scrolloff=5

" Plugins
call plug#begin()
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'prabirshrestha/async.vim'
Plug 'sebdah/vim-delve'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'junegunn/limelight.vim'
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
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'tpope/vim-rhubarb'
Plug 'hashivim/vim-terraform'
call plug#end()

" General settings
set nocompatible                " Enable Vim-specific features
filetype plugin indent on       " Enable filetype detection and indentation
set ttyfast                     " Indicate fast terminal connection for faster redraw
set laststatus=2                " Always show status line
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enable auto-indentation
set backspace=indent,eol,start  " Make backspace key more powerful

" Search settings
set incsearch                   " Show the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case-insensitive
set smartcase                   " Except when starting with an uppercase letter

" Display settings
set noerrorbells                " No beeps
set showcmd                     " Show command being typed
set splitright                  " Split vertical windows to the right
set splitbelow                  " Split horizontal windows to the bottom
set hidden                      " Keep buffer when window is closed

" File settings
set noswapfile                  " Don't use swapfiles
set nobackup                    " Don't create backup files
set nowritebackup
set fileformats=unix,dos,mac    " Prefer Unix, then Windows, then Mac formats

" Completion settings
set pumheight=10                " Completion window max size
set completeopt=menu,menuone,preview
set previewheight=1             " Set autocompletion preview to 1 line

" Line numbering and clipboard settings
set nu
set clipboard=unnamedplus
set timeoutlen=1000 ttimeoutlen=1 "Fast escape

" Persistent undo settings
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo/
endif

" Colorscheme settings
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
let term="xterm2"
colorscheme molokai
set background=dark

" Mappings
let mapleader = ","       " Set leader shortcut to ',' (default is backslash)

" Quickfix window mappings
nnoremap <leader>a :cclose<CR>
nnoremap <silent> <leader>q :q<CR>

" Search mappings: Center on found line when navigating search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Plugins
" vim-go configuration
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
let go_doc_popup_window = 1
let g:go_gorename_command = "gopls"

" Open :GoDeclsDir with Ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

" YAML file settings
autocmd FileType yaml,yml set listchars=tab:\|\

augroup go
  autocmd!

  " Set tab settings for Go files
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " Mappings for Go filetype
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>l :GoLint<cr>
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " GoAlternate commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" s:build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if it's a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Add the Go lint path
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

" Go metalinter settings
let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck']
let g:go_auto_type_info = 0
let g:go_def_reuse_buffer = 0

" General settings
set updatetime=300
let g:goyo_width = 100

" ALE settings
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

" NERDTree settings
let NERDTreeShowHidden=1

" NERDTree file highlighting function
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTree file highlighting definitions
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', '#3366FF', '#151515')

" Statusline
set statusline=%F:%l/%L

" delimitMate settings
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" Supertab autocompletion
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" TagBar configuration for Go
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

" GitGutter settings
set signcolumn=yes " Always display the sign column to avoid rendering issues

" Python binary paths
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['deadcode', 'errcheck', 'gosimple', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_metalinter_command='golangci-lint'
let g:go_metalinter_autosave = 1
" Open terminal in different modes
command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>
command! -nargs=* TT tabnew | terminal <args>

" Yank to system clipboard
vnoremap <leader>y "+y

" Neovim specific configuration
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

" Git commit settings
autocmd FileType gitcommit set bufhidden=delete

" CtrlP settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor'
let g:ctrlp_max_files = 100000
let g:ctrlp_max_depth = 20
let g:ctrlp_by_filename = 1

" Quickfix window settings
augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

" Go settings
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
set cursorline

" Ack settings
let g:ackprg = 'ag --nogroup --nocolor --column'
set path+=**

" Netrw settings
let g:netrw_banner = 0        " Disable annoying banner
let g:netrw_browse_split = 4  " Open in prior window
let g:netrw_altv = 1          " Open splits to the right
let g:netrw_liststyle = 3     " Tree view
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'

" Convenience commands
command! Q q
command! Qa qa
command! QA qa
command! WQ wq
command! W w

" Goyo settings
let g:goyo_width = 100

" CtrlP working path mode
let g:ctrlp_working_path_mode = 'ra'

" Key mappings
imap jj <Esc>
nnoremap * *``

" Source init.vim commands
command! Sesource :split ~/.config/nvim/init.vim
command! Vesource :vsplit ~/.config/nvim/init.vim
command! SourceSource :source ~/.config/nvim/init.vim

" Airline settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" General settings
set noshowmode
let g:bufferline_echo = 0
let g:airline_skip_empty_sections = 1
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes
set updatetime=300

" ALE settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'go': ['gofmt','goimports']
\}

" Lightline functions
function! LightLineFilename()
  return expand('%:p:h')
endfunction

function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar' :
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ expand('%:t') ==# 'NERD_tree' ? 'NERD' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

function! LightLineGitGutter()
  if exists('*GitGutterGetHunkSummary')
    let [added, modified, removed] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', added, modified, removed)
  endif
  return ''
endfunction

" Key mappings
xnoremap p pgvy
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Function to check for backspace
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc.nvim navigation and mappings

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" Format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr for specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" CodeAction for selected region
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" CodeAction for current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Function text object mappings (requires document symbols feature)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Range selection (requires server support)
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
" Formatting, folding, and imports
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Status line integration
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" CocList mappings and commands
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" Tab management commands
ca tn tabnew
ca th tabp
ca tl tabn

" NERDTree mapping
nmap <leader>\ :NERDTreeFind<CR>zz

" Number keys to switch tabs
nmap 1 1gt
nmap 2 2gt
nmap 3 3gt
nmap 4 4gt
nmap 5 5gt
nmap 6 6gt
nmap 7 7gt
nmap 8 8gt
nmap 9 9gt

" Clear search highlighting
nmap <leader>0 :noh<CR>

" Vertical split buffer command
ca vsb vertical sb


" Automatically reload files when they change on disk
" Reference:
"   - https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
"   - https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

  " Display a notification when a file has been changed and reloaded
  " Reference:
  "   - https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
  