"---------------------------------------------------------------------------
" For UNIX:
"

" Use sh.  It is faster
set shell=sh


" Set path.
let $PATH = expand('~/bin').':/usr/local/bin/:'.$PATH

if has('gui_running')
  finish
endif


"---------------------------------------------------------------------------
" For CUI:
"

" Enable 256 color terminal.
set t_Co=256


if !has('nvim')
  set term=xterm-256color

  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function! s:XTermPasteBegin(ret) abort
    setlocal paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ s:XTermPasteBegin('0i')
  inoremap <special> <expr> <Esc>[200~ s:XTermPasteBegin('')
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>

  " Optimize vertical split.
  " Note: Newest terminal is needed.
  " let &t_ti .= "\e[?6^9h"
  " let &t_te .= "\e7\e[?6^9l\e8"
  " let &t_CV = "\e[%i%p1%dP2%ds"
  " let &t_CS = "y"

  " Change cursor shape.
  let &t_SI = "\<Esc>]12Lightgreen\x7"
  let &t_EI = "\<Esc>]12White\x7"
endif

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

" Disable the mouse.
set mouse=

" Colorscheme
colorscheme landscape
