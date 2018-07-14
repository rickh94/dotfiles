if $SHELL=~'bin/fish'
  set shell=/bin/sh
endif

set backup		" keep a backup file (restore to previous version)

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

syntax on


autocmd BufWritePre * %s/\s\+$//e
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
autocmd FileType ruby setlocal textwidth=78
autocmd FileType lilypond setlocal textwidth=78
autocmd FileType markdown setlocal textwidth=78
autocmd FileType gitcommit setlocal textwidth=78
autocmd FileType c setlocal textwidth=78
autocmd FileType rst setlocal textwidth=78
autocmd FileType go setlocal textwidth=120
autocmd FileType go setlocal shiftwidth=2
autocmd FileType go setlocal expandtab!
autocmd FileType go setlocal tabstop=2

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

syntax on

" enable line numbering
set number


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


" vim AutoSave config
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

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

" insert matching reverse character
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>
" prevent inserting extra reverse bracket character
inoremap <expr> } CharacterMatches("}")
inoremap <expr> ] CharacterMatches("]")
inoremap <expr> ) CharacterMatches(")")
inoremap <expr> > CharacterMatches(">")
inoremap <expr> " IsQuote()

fun! CurrentCharacter()
  return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction

fun! CharacterMatches(matchchar)
  let l:currchar = CurrentCharacter()
  if l:currchar == a:matchchar
    "echom l:currchar
    return "\<Right>"
  else
    "echo l:currchar
    "echo "fails to match"
    return a:matchchar
  endif
endfunction

fun! IsQuote()
  let l:currchar = CurrentCharacter()
  if l:currchar == "\""
    return "\<Right>"
  else
    return "\"\"\<Left>"
  endif
endfunction

set shiftwidth=2
set tabstop=2
set expandtab
" flag bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set modeline

let g:python_host_prog = '/home/rick/.local/share/nvim/venv2/bin/python2'
let g:python3_host_prog = '/home/rick/.local/share/nvim/venv3/bin/python3'

function! BuildComposer(info)
	if a:info.status != 'unchanged' || a:info.force
		if has('nvim')
			!cargo build --release
		else
			!cargo build --release --no-default-features --features json-rpc
		endif
	endif
endfunction

call plug#begin()
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', {'do': 'make', 'for': 'go'}
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'euclio/vim-markdown-composer', {'for': 'markdown', 'do': function('BuildComposer') }
Plug 'iCyMind/NeoSolarized'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'gisraptor/vim-lilypond-integrator', {'for': 'lilypond'}
Plug 'lepture/vim-jinja', {'for': 'jinja'}
Plug 'dag/vim-fish', {'for': 'fish'}
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/vim-auto-save'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins'}
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-6.0/lib/clang/6.0.0/include'
let g:deoplete#sources#go#gocode_binary = '/usr/bin/gocode'
let g:deoplete#sources#rust#racer_binary = '/home/rick/.cargo/bin/racer'
let g:deoplete#sources#rust#racer_source_path = '/home/rick/.cargo/registry/src/github.com-1ecc6299db9ec823'
let g:neomake_python_enabled_makes = ['pycodestyle', 'pydocstyle']
let g:airline_theme='solarized'

call neomake#configure#automake('nw', 750)

set termguicolors
colorscheme NeoSolarized

let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

set background=dark
