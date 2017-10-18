" =====================================================================
" init.rc.vim
" =====================================================================
" ----------------------------------------------
"  General settings
" ----------------------------------------------
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
" set clipboard=unnamedplus " TODO:
set colorcolumn=101               " highlight the 80th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set ruler                         " show cursor position
set formatoptions=tcqron          " set vims text formatting options
set softtabstop=2
set tabstop=2
set textwidth=100
set title                         " let vim set the terminal title
set titlelen=95                   " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set laststatus=2                  " statusline height is 2
set matchpairs& matchpairs+=<:>   " add <> to matchpairs
set cmdheight=2                   " command line height
set wildmenu                      " enables a menu at the bottom
set wildmode=list:longest,full    " do completion in the command line via tab
set backspace=indent,eol,start    " Enable backspace deletes indent and new line
set clipboard+=unnamed            " Share the clipboard between vim and Mac OS

" Allow vim to set a custom font or color for a word
syntax enable

" set the leader button
let mapleader = ','

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Command-line mode keymappings
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
" cnoremap <C-n> <Down> TODO
" cnoremap <C-p> <Up> TODO

" easy escape
inoremap jj <esc>
" goto last edited point
nnoremap ;l '.

" jump to pair
nnoremap <tab>  %
vnoremap <tab>  %

" Show full path of file
nnoremap <leader>fp :echo expand("%:p")<cr>

" insert mode keymaps like emacs
imap <c-p> <up>
imap <c-n> <down>
imap <c-b> <left>
imap <c-f> <right>
imap <c-e> <end>
imap <c-d> <del>
imap <c-h> <bs>
" imap <c-a> <esc>^i
" imap <c-k> <esc>^i

"----------------------------------------------
" Colors
"----------------------------------------------
set background=dark
colorscheme PaperColor

highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting
set ignorecase                    " ignore match

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow      " To open a new window, display it on the lower side
set splitright      " To open a new window, display it on the right side

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

"----------------------------------------------
" Tab
"----------------------------------------------
nnoremap  [Tag] <nop>
nmap      t     [Tag]
for s:n in range(1, 9)
  execute 'nnoremap <sillent> [tag]'.s:n  ':<C-u>tabnext'.s:n.'<cr>'
endfor
" jump
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>

" =====================================================================
" Plugin: QuickRun
" =====================================================================
nnoremap <leader>r :QuickRun <enter>

" =====================================================================
" Plugin: vim-quickrun
" =====================================================================
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)

" =====================================================================
" Plugin: ctrlp
" =====================================================================
" default
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'files -a %s'                " using mattn/files
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'           " cache dir
let g:ctrlp_clear_cache_on_exit = 1                     " clear cache on exit vim
nnoremap <silent><space>p :<c-u>CtrlPMRUFiles<cr>
nnoremap <silent><space>g :<c-u>CtrlPLine<cr>
nnoremap <silent><space>b :<c-u>CtrlPBuffer<cr>
nnoremap <space><space> :<c-u>CtrlPMixed<cr>

" let g:ctrlp_lazy_update = 1                           " same vim lazy redraw
let g:ctrlp_max_height = 20                             " ctrlp window height
" ignore directories, files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|build|yarn)$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|jpg|png|pdf|DS_Store)$',
  \ }

" key mappings
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<c-h>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<c-b>'],
  \ 'PrtCurRight()':        ['<c-f>'],
  \ 'PrtSelectMove("j")':   ['<c-j>'],
  \ 'PrtSelectMove("k")':   ['<c-k>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'PrtExit()':            ['<c-l>', '<esc>', '<c-c>'],
  \ 'ToggleFocus()':        ['<nop>'],
  \ 'PrtExpandDir()':       ['<nop>'],
  \ 'AcceptSelection("h")': ['<nop>'], 
  \ 'AcceptSelection("t")': ['<nop>'],
  \ 'AcceptSelection("v")': ['<nop>'],
  \ 'ToggleType(1)':        ['<nop>'],
  \ 'ToggleType(-1)':       ['<nop>'],
  \ 'PrtInsert()':          ['<nop>'],
  \ 'PrtCurStart()':        ['<nop>'],
  \ 'PrtClearCache()':      ['<nop>'],
  \ 'PrtDeleteEnt()':       ['<nop>'],
  \ 'CreateNewFile()':      ['<nop>'],
  \ 'MarkToOpen()':         ['<nop>'],
  \ 'OpenMulti()':          ['<nop>'],
  \ 'PrtDelete()':          ['<nop>'],
  \ 'PrtSelectMove("t")':   ['<nop>'],
  \ 'PrtSelectMove("b")':   ['<nop>'],
  \ 'PrtSelectMove("u")':   ['<nop>'],
  \ 'PrtSelectMove("d")':   ['<nop>'],
  \ }

" =====================================================================
" Plugin: lightline.vim
" =====================================================================
let g:lightline = {
\  'active': {
\    'left': [
\      ['mode', 'paste'],
\      ['readonly', 'filename', 'modified'],
\      ['ale'],
\    ]
\  },
\  'colorscheme': 'landscape',
\  'component_function': {
\    'ale': 'ALEGetStatusLine'
\  }
\}

" =====================================================================
" Plugin: indentLine
" =====================================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_faster = 1

" =====================================================================
" Plugin: vim-gitgutter
" =====================================================================
let g:gitgutter_max_signs = 1024
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '➜'
let g:gitgutter_sign_removed = '✘'

" =====================================================================
" Plugin: ale
" =====================================================================
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1            " always show signs columns
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '△'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" move to previous error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" move to next error
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_lint_on_save = 1                  " check at save only
let g:ale_lint_on_text_changed = 0          " not checking at input text
let g:ale_echo_msg_format = '[%linter%] %s' " error message format

" fixer
let g:ale_fixers = {
\  'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

" =====================================================================
" Language: golang
" =====================================================================
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" enable syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: zsh
"----------------------------------------------
au FileType zsh set noexpandtab
au FileType zsh set shiftwidth=2
au FileType zsh set softtabstop=2
au FileType zsh set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=4
au FileType javascript set softtabstop=4
au FileType javascript set tabstop=4

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: LESS
"----------------------------------------------
au FileType less set expandtab
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: PlantUML
"----------------------------------------------
au FileType plantuml set expandtab
au FileType plantuml set shiftwidth=4
au FileType plantuml set softtabstop=4
au FileType plantuml set tabstop=4

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Ruby
"----------------------------------------------
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
