if v:progname =~? "evim"
  finish
endif

set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Vundle plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'tell-k/vim-autopep8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'luochen1990/rainbow'
Plugin 'hdima/python-syntax'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'gisraptor/vim-lilypond-integrator'
Plugin 'cespare/vim-toml'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lepture/vim-jinja'

call vundle#end()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has('gui_running')
  colorscheme solarized
  set background=dark
  set guioptions-=T
else
  colorscheme default
  set background=dark
endif

set backup		" keep a backup file (restore to previous version)
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

silent execute '!mkdir ~/.vim/backup 2>/dev/null'
set backupdir=~/.vim/backup,.,/tmp
set directory=.,~/.vim/swap,/tmp


au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  syntax on

  " Also switch on highlighting the last used search pattern.

  " I like highlighting strings inside C comments.
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  autocmd BufWritePre * %s/\s\+$//e
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType ruby setlocal textwidth=78
  autocmd FileType lilypond setlocal textwidth=78
  autocmd FileType markdown setlocal textwidth=78
  autocmd FileType gitcommit setlocal textwidth=78
  autocmd FileType c setlocal textwidth=78
  autocmd FileType rst setlocal textwidth=78

  " add abbreviations
  autocmd FileType lilypond :iabbrev <buffer> bnc \barNumberCheck #
  autocmd FileType lilypond :iabbrev <buffer> rpu \repeat unfold
  autocmd FileType lilypond :iabbrev <buffer> rpv \repeat volta
  autocmd FileType lilypond :iabbrev <buffer> twx -\tweak X-offset #
  autocmd FileType lilypond :iabbrev <buffer> twy -\tweak Y-offset #
  autocmd FileType lilypond :iabbrev <buffer> clft \clef treble
  autocmd FileType lilypond :iabbrev <buffer> clfa \clef alto
  autocmd FileType lilypond :iabbrev <buffer> clfb \clef bass
  autocmd FileType lilypond setlocal colorcolumn=79

  " add spellcheck
  autocmd FileType markdown setlocal spell
  autocmd FileType rst setlocal spell
  autocmd FileType gitcommit setlocal spell

  " set wrapping on json files
  autocmd FileType json setlocal wrap

  " set python options
  autocmd FileType python setlocal textwidth=79
  autocmd FileType python setlocal colorcolumn=80
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal define=^\s*\\(def\\\\|class\\)
  autocmd FileType python setlocal complete+=t
  autocmd FileType python setlocal formatoptions-=t

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" set scrolloff to 5
set so=5

" disable wrapping
set nowrap
set sidescroll=10

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

syntax on
filetype plugin indent on

" enable line numbering
set number

" syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:synstastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ["pycodestyle", "pydocstyle"]
let g:syntastic_loc_list_height = 5

" turn on rainbow brackets
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'guifgs': ['purple', 'darkorange3', 'red', 'seagreen3', 'firebrick', 'lightcyan'],
      \ 'ctermfgs': ['lightblue', 'red', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold']
      \}
"nerdcommenter options
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Custom commands
command Wly w | !lilypond %:r
command Wpy w | !python3 %
command Spell set filetype=text | setlocal spell spelllang=en_us
command Wr w | !rustc %
command Pl SyntasticCheck pylint
command Wpl w | SyntasticCheck pylint
command JSON r !python -m json.tool %


" Use control + standard movement key to change section of window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1


set shiftwidth=2
set tabstop=2
set expandtab
" flag bad whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ycm options
let g:ycm_python_binary_path = 'python'
set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let python_highlight_all=1
syntax on

call togglebg#map("<F4>")

let NERDTreeIgnore=['\.pyc$', '\~$']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" save session info in a viminfo file
set viminfo='1000,f1,<500,:10,/10
set modeline
