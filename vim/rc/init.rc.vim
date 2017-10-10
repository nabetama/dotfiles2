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
set updatetime=100                " redraw the status bar often
set laststatus=2                  " statusline height is 2
set matchpairs& matchpairs+=<:>   " add <> to matchpairs

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
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" easy escape
inoremap jj <esc>
" goto last edited point
nnoremap ;l '.

" jump to pair
nnoremap <tab>  %
vnoremap <tab>  %

" Show full path of file
nnoremap <leader>fp :echo expand("%:p")<cr>

" quickhighlight
nmap <leader>m <Plug>(quickhl-manual-this)
xmap <leader>m <Plug>(quickhl-manual-this)
nmap <leader>M <Plug>(quickhl-manual-reset)
xmap <leader>M <Plug>(quickhl-manual-reset)

" QuickRun
nnoremap <leader>r :QuickRun <enter>

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
set splitbelow
set splitright

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
" Plugin: vim-go
" =====================================================================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" =====================================================================
" Plugin: ctrlp
" =====================================================================
" default
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'files -a %s'                " using mattn/files
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'           " cache dir
let g:ctrlp_clear_cache_on_exit = 1                     " clear cache on exit vim
nnoremap <space>g :<c-u>CtrlPLine<cr>
nnoremap <space>b :<c-u>CtrlPBuffer<cr>
nnoremap <space><space> :<c-u>CtrlPMixed<cr>

" let g:ctrlp_lazy_update = 1                           " same vim lazy redraw
let g:ctrlp_max_height = 20                             " ctrlp window height
" ignore directories, files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|build)$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|jpg|png)$',
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
  \ 'colorscheme': 'landscape',
  \ }
