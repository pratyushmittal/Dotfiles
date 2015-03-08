"" Look and feel
" Using Thematic for multiple themes
let g:thematic#themes = {
\ 'badwolf_dark'  : { 'colorscheme': 'badwolf',
\                     'typeface': 'Monaco',
\                     'background': 'dark',
\                     'font-size': 13,
\                   },
\ 'pencil_lite' :{ 'colorscheme': 'pencil',
\                  'background': 'light',
\                  'typeface': 'Cousine',
\                  'font-size': 14,
\                  'linespace': 6,
\                },
\ }
" Make the tab line lighter than the background.
let g:badwolf_tabline = 0
let g:thematic#theme_name = 'badwolf_dark'

set number        " always show line numbers
set showcmd       " show command in bottom bar
set showmatch     " set show matching parenthesis


"" Searching
set hlsearch        " highlight matches
set incsearch       " incremental searching
set ignorecase      " searches are case insensitive...
set smartcase       " ... unless they contain at least one capital letter


"" Indentation
set list            " Show last whitespace
let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " a tab is four space
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " use space as tab
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting


"" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level


"" Leader key maps
let mapleader = ","
" open ag.vim (i.e. use ack to search code)
nnoremap <leader>a :Ag
" Copy and paste to clipboard
nmap <leader>p "*p
nmap <leader>y "*y
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" highlight last inserted text
nnoremap gV `[v`]
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession<CR>
" Open current file in browser
nnoremap <leader>o :exe ':silent !firefox %'<CR>

" Open and close folds with space
nnoremap <Space> za
vnoremap <Space> za

" Change split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map gt and gT to next / prev buffers as in vimperator
nmap gt :bnext<CR>
nmap gT :bprev<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Allow saving of files as sudo when I forgot to start vim using sudo.
nnoremap <leader>w w !sudo tee > /dev/null %


"" Plugin settings
" UtilSnips (snipmate)
" from django docs: https://code.djangoproject.com/wiki/UsingVimWithDjango
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsListSnippets="<c-k>" "List possible snippets
autocmd FileType python set ft=python.django
autocmd FileType hbs set ft=htmldjango.html
autocmd FileType html set ft=htmldjango.html

" Syntastic
let g:syntastic_python_checkers=['pylint']

let g:syntastic_c_checkers=['clang_check']

let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_cpp_compiler = "g++"

" Android with Syntastic
let g:syntastic_java_javac_classpath = "bin/classes:/opt/android-sdk/platforms/android-19/*.jar"

let g:syntastic_html_validator_parser="html5"
"" Show errors window in Syntastic
"" Jump to next using :lnext
let g:syntastic_aggregate_errors = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = 'ag %s -l -S -w -f --nocolor -g ""'
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'

" YouCompleteMe YCM"
" Pasted from django docs: https://code.djangoproject.com/wiki/UsingVimWithDjango
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" Due to some conflict with jedi, it auto selects first completion
" fixing that: https://github.com/davidhalter/jedi-vim/issues/26
let g:jedi#popup_on_dot = 0

" Javascript Syntax library
let g:used_javascript_libs = 'angularjs,angularui,jasmine'

"" Code specific changes
" Enable spell check for text files
autocmd BufNewFile,BufRead *.{md,txt} setlocal spell spelllang=en_us
" Markdown syntax
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal linebreak
au BufRead,BufNewFile *.md setlocal textwidth=50


"" Directories for backup and swap
set backup
set backupdir=~/.vim/.backup,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/.backup,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" Auto save on losing window focus (from textmate)
au FocusLost * :wa


" Auto load bundles
execute pathogen#infect()

" Default
syntax enable
filetype plugin indent on
