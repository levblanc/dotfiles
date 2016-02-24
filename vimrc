"NeoBundle Scripts-----------------------------
"

" NeoBundle scripts cannot be putted into separate file

if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

	" Required:
	set runtimepath+=/Users/levblanc/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/levblanc/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:

" Vim Utils
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ctrlpvim/ctrlp.vim'                  " fuzzy search
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-fugitive'                  " git support
NeoBundle 'wincent/terminus'                    " better terminal integration
NeoBundle 'tmux-plugins/vim-tmux'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'vim-airline/vim-airline'             " status bar at window bottom
NeoBundle 'ryanoasis/vim-webdevicons'           " icons for programming languages, libraries, and web developer filetypes

" Coding Utils
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'valloric/MatchTagAlways'
NeoBundle 'matze/vim-move'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'godlygeek/tabular'

" Color Schemes
NeoBundle 'morhetz/gruvbox' "gruvbox colorscheme

" Syntax highlight
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'pangloss/vim-javascript'
NeoBundle '1995eaton/vim-better-javascript-completion'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elzr/vim-json'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader - ( Spacebar )
let mapleader = " "

set encoding=utf8

set number
set numberwidth=5

set backspace=2 " Backspace deletes like most programs in insert mode

" set list
" set listchars=tab:▸\ ,extends:»,precedes:«,trail:·,nbsp:·

set wrap linebreak nolist


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set showcmd       " show current command

set noswapfile    " disable swap files creation
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim

set ruler         " show the cursor position all the time
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping

" enables command selection by tab
set wildmenu
set wildmode=list:longest,full

" not sure about the usage, but will have it at the moment
set display+=lastline

" enable mouse
set mouse=a

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
set incsearch
set showmatch

" Auto resize Vim splits to active split
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ignore files and dir in vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
syntax enable
set background=dark
colorscheme gruvbox

" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

" if one line is longer than 80 chars, give it a red bg
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy to osx clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pastetoggle=<leader>p
vnoremap <C-c> "*y<CR>
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
highlight clear SignColumn
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigate between display lines
noremap <silent> <Up> gk
noremap <silent> <Down> gj
noremap <silent> k gk
noremap <silent> j gj

noremap <C-f> :Autoformat<CR>"'
nnoremap <leader>ag :Ag<space>

" Stop highlight after searching
nnoremap <C-e> :noh<CR>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" This is the best
nnoremap ; :

" Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
" Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

"Map Ctrl + S to save in any mode
noremap  <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
" also map leader + s
map <leader>s <C-S>

" hotkeys to open and reload .vimrc file
nnoremap <leader>lrc :source $MY_VIMRC<cr>
nnoremap <leader>erc :vs $MY_VIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mapping for window navigation
" https://github.com/aaronjensen/vimfiles/blob/41315d26407de7c3d2bbabd2d412b049642f09b5/vimrc#L466-L497
"
" If you're in tmux it'll keep going to tmux splits 
" if you hit the end of your vim splits.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX')
	" easy switch panels between vim and tmux
	function! TmuxOrSplitSwitch(wincmd, tmuxdir)
		let previous_winnr = winnr()
		execute "wincmd " . a:wincmd
		if previous_winnr == winnr()
			" The sleep and & gives time to get back to vim so tmux's focus tracking
			" can kick in and send us our ^[[O
			execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
			redraw!
		endif
	endfunction

	let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
	let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
	let &t_ti = "\<Esc>]2;nvim\<Esc>\\" . &t_ti
	let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

	nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
	nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
	nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
	nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
	" easy switch panels between vim and tmux
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript omni complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimjs#casesensistive = 1
let g:vimjs#smartcomplete = 0
let g:vimjs#chromeapis = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only do this part when compiled with support for autoCommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	" Enable file type detection
	filetype on

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Enable spellchecking for Markdown
	autocmd FileType markdown setlocal spell

	" Automatically wrap at 72 characters and spell check git commit messages
	autocmd FileType gitcommit setlocal textwidth=72
	autocmd FileType gitcommit setlocal spell

	" Make files look pretty
	" autocmd FileType css,scss,sass,less :ColorHighlight
	" Allow stylesheets to autocomplete hyphenated words
	autocmd FileType css,scss,sass,less setlocal iskeyword+=-

	" auto-complete
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

	" Remapping emmet's default keys '<C-y>,'
	function! s:expand_html_tab()
		" try to determine if we're within quotes or tags.
		" if so, assume we're in an emmet fill area.
		let line = getline('.')
		if col('.') < len(line)
			let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
			if len(line) >= 2
				return "\<C-n>"
			endif
		endif
		" expand anything emmet thinks is expandable.
		if emmet#isExpandable()
			return "\<C-y>,"
		endif
		" return a regular tab character
		return "\<tab>"
	endfunction
	
	autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()

	" enable emmet just for html/css
	autocmd FileType html,css EmmetInstall

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
	" Strip trailing whitespaces for .py and .js files
	autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

	" Set syntax highlighting for specific file types
	autocmd BufRead,BufNewFile *.md set filetype=markdown

	" autocmd BufRead *.jsx set ft=jsx.html
	" autocmd BufNewFile *.jsx set ft=jsx.html

	" Automatically wrap at 80 characters for Markdown
	autocmd BufRead,BufNewFile *.md setlocal textwidth=80

	" Trigger autoread when changing buffers or coming back to vim in terminal.
	au FocusGained,BufEnter * :silent! !

	" Save whenever switching windows or leaving vim. This is useful when running
	" the tests inside vim without having to save all files first.
	au FocusLost,WinLeave * :silent! wa

	" automatically rebalance windows on vim resize
	autocmd VimResized * :wincmd =

	"update dir to current file
	autocmd BufEnter * silent! cd %:p:h

	" When editing a file, always jump to the last known cursorosition.
	" Don't do it for commit messages, when theosition is invalid, or when
	" inside an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost *
		\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
		\   exe "normal g`\"" |
		\ endif
end

function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <space>= to align equals signs
" <space>= to align equals signs
" if exists(":Tabularize")
" 	nnoremap <leader>ag= :Tabularize /=<CR>
" 	vnoremap <leader>ag= :Tabularize /=<CR>
" 	nnoremap <leader>ag: :Tabularize /:\zs<CR>
" 	vnoremap <leader>ag: :Tabularize /:\zs<CR>
" endif
nnoremap <leader>al= :Tabularize /=<CR>
vnoremap <leader>al= :Tabularize /=<CR>
nnoremap <leader>al: :Tabularize /:<CR>
vnoremap <leader>al: :Tabularize /:<CR>

" call the :Tabularize command each time you insert a | character. 
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
			

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-move
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:move_key_modifier = 'C'


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neo-snippet
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/vim-snippets'


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimjs#casesensistive = 1
let g:vimjs#smartcomplete = 0
let g:vimjs#chromeapis = 0   

let g:neocomplete#enable_at_startup = 1
" set minimum syntax keyword length
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: closeopup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" For no inserting <CR> key.
" return pumvisible() ? '\<C-y>' : '\<CR>'
endfunction

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: closeopup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jscs', 'eslint']
let g:syntastic_check_on_open = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
  nmap <C-w> :bp <BAR> bd #<CR>
" Create new tab
  nmap <C-t> :enew<CR>
" Move to the next buffer
  nmap <S-j> :bnext<CR>
" Move to the previous buffer
  nmap <S-k> :bprevious<CR>

  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <C-k> :NERDTree<CR>
map <C-\> :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none','green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none','yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none','#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none','yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow','none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow','none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow','none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow','none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan','none', 'cyan', '#151515')
call NERDTreeHighlightFile('css','cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee','Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js','Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php','Magenta', 'none', '#ff00ff','#151515')


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" exclude files and dir with ctrlp
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|DS_Store|node_modules)$'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist)|(\.(swp|ico|svn|DS_Store))$'
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


