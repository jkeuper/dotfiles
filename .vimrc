" From https://github.com/semanser/dotfiles/blob/master/.vimrc
" via https://medium.com/@semanser/is-it-worth-to-learn-vim-in-2018-4798cbf7f2b2

" PLUGIN SETUP {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Provides insert mode auto-completion for quotes, parens, brackets, etc
  Plug 'Raimondi/delimitMate'
  let delimitMate_expand_cr = 1

  " Always highlights the enclosing html/xml tags
"  Plug 'Valloric/MatchTagAlways'
"  let g:mta_filetypes = {
"        \ 'html' : 1,
"        \ 'javascript.jsx' : 1,
"        \ 'jinja' : 1,
"        \ 'liquid' : 1,
"        \ 'markdown' : 1,
"        \ 'xhtml' : 1,
"        \ 'xml' : 1,
"        \}

  " A code-completion engine
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
  " let g:ycm_autoclose_preview_window_after_insertion = 1

  " Shows a git diff in the gutter (sign column) and stages/undoes hunks
  Plug 'airblade/vim-gitgutter'

  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  let g:closetag_close_shortcut = ''
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*jsx'

  " Preview colours in source code while editing
  Plug 'ap/vim-css-color'

  " CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
  Plug 'hail2u/vim-css3-syntax'
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " Improved incremental searching for Vim
  Plug 'haya14busa/incsearch.vim'

  " A command-line fuzzy finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

  " fzf bindings for vim
  Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

  " A Vim alignment plugin
  " Plug 'junegunn/vim-easy-align'

  " Asynchronously control git repositories in Neovim/Vim 8
  " Plug 'lambdalisue/gina.vim'

  " The fancy start screen for Vim.
  Plug 'mhinz/vim-startify'

	" Vastly improved Javascript indentation and syntax support in Vim
	Plug 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim
  Plug 'mxw/vim-jsx'

  " A tree explorer plugin for vim
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
  let NERDTreeAutoDeleteBuffer = 1
  let NERDTreeChDirMode = 2
  let NERDTreeMinimalUI = 1
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowHidden = 1
	let NERDTreeStatusline = ''

  " Comment stuff out
  " Plug 'tpope/vim-commentary'

  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
  " Plug 'machakann/vim-sandwich'

  " Lean & mean status/tabline for vim that's light as air
  " Plug 'vim-airline/vim-airline'
" 	let g:airline#extensions#branch#enabled = 1
"   let g:airline#extensions#ale#enabled = 1
"   let g:airline#extensions#tabline#enabled = 0
"   let g:airline#extensions#tabline#show_close_button = 0
"   let g:airline#extensions#whitespace#enabled = 0
"   let g:airline_inactive_collapse=0
"   let g:airline_section_a = ''
"   let g:airline_section_b = ''
"   let g:airline_section_c = '%t'
"   let g:airline_section_x = ''
"   let g:airline_section_y = ''
"   let g:airline_section_z = '%l'
"   let g:airline_theme='tender'

  " Asynchronous Lint Engine
"  Plug 'w0rp/ale'
"  let g:ale_linters = {
"        \   'javascript': ['eslint'],
"        \   'javascript.jsx': ['eslint'],
"        \}
"	let g:ale_fix_on_save = 1
"  let g:ale_fixers = {}
"  let g:ale_fixers.javascript = ['eslint']
"
"  " Make the yanked region apparent!
"  Plug 'machakann/vim-highlightedyank'
"
"	" Async Vim plugin for showing your outdated Vim plugins
"  Plug 'semanser/vim-outdated-plugins'
"
"	" a Git wrapper so awesome, it should be illegal 
"	Plug 'tpope/vim-fugitive'
"
"	" Vim plugin: Create your own text objects
"	Plug 'kana/vim-textobj-user'
"
"  " A text object for any of '', "", (), {}, [] and <>.
"	Plug 'rhysd/vim-textobj-anyblock'
"
" A 24bit colorscheme for Vim, Airline and Lightline
Plug 'jacoborus/tender.vim'
"
"	" Vim plugin for selectively illuminating other uses of current word under the cursor
"	Plug 'RRethy/vim-illuminate'
"	let g:Illuminate_ftblacklist = ['nerdtree']
call plug#end()
" }}}

" GENERAL {{{
syntax enable                          " Enable syntax highlighting
colorscheme tender
let mapleader = "\<Space>"             " Setup leader key
let macvim_skip_colorscheme=1
" }}}

" VARS {{{
" set autoread                " autoload file changes
" set autowriteall            " autosave files
" set background=dark         " dark colorscheme
" set completeopt-=preview    " Do not show preview window for ins-completion.
" set cursorline              " Enable cursor line
" set diffopt+=vertical       " split diffopt in vertical mode
" set encoding=utf-8          " set the character encoding to UTF-8
set expandtab               " convert tabs to the spaces
" set foldlevel=2             " sets the fold level
" set foldmethod=indent       " type of indentation
" set foldnestmax=10          " sets the maximum nesting of folds
" set gcr=a:blinkon0          " disable cursor blinking
" set guioptions=             " remove all GUI components and options.
" set hidden                  " hide when switching buffers instead of unloading
" set history=1000            " store lots of :cmdline history
" set hlsearch                " highlights the string matched by the search
" set ignorecase              " make searching case insensitive
" set inccommand=nosplit      " shows the effects of a command incrementally, as you type.
set incsearch               " incremental search
" set lazyredraw              " only redraw when necessary
" set nobackup                " disable backups
" set signcolumn=yes          " always show signcolumns
" set nocompatible            " use Vim settings, rather then Vi
" set nofoldenable            " when off, all folds are open when open a new file
" set noshowmode              " don't show mode as we use a status line plugin
" set noswapfile              " disable swapfile
" set nowrap                  " wrap lines
set scrolloff=10            " keep cursor at the minimum 10 rows from the screen borders
set shiftwidth=2            " 2 spaces
" set showcmd                 " show (partial) command in status line
" set showmatch               " show match brackets
set sidescroll=1            " incrementally scroll one character
set smartcase               " unless the query has capital letters
" set splitbelow              " open new split below
" set splitright              " open new split right
set tabstop=2               " 2 spaces
" set termguicolors           " enable True color
" set ttyfast                 " always assume a fast terminal
" set undodir=~/.vim/undo-dir " setup undo directory
" set undofile                " save undo chages even after computer restart
" set updatetime=250          " reduce update time in Vim
" set wildmenu                " visual autocomplete for command menu
set smarttab
set cindent
" }}}

" KEYMAP {{{
map = j0.
noremap <silent> <tab> :NERDTreeToggle<CR>
" }}}

" AUTOCOMMANDS {{{
" autocmd vimenter * NERDTree
" }}}

" FUNCTIONS {{{
" }}}

" HIGHLIGHT {{{
hi illuminatedWord guibg=#4c525e
" }}}
