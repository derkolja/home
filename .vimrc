autocmd!

set t_Co=256
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()

call plug#begin('~/vim/plugged')
let $GIT_SSL_NO_VERIFY = 'true'
"let g:plug_url_format = 'git@github.com:%s.git'
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
call plug#end()
" Plug 'tpope/vim-sensible'

let g:undotree_WindowLayout=2

filetype plugin indent on

" disable colorcolumn on tex files
au BufRead *tex se colorcolumn=

se hlsearch  " hililght matches
se incsearch " immediately jump to matches
se nu        " line numbers
syn on       " syntax
se mouse=a
se bg=dark
se wildmenu " tab completion for :e, :b etc
se wildmode=longest,list
se completeopt=longest,menu
se hidden " allow switching from modified buffers
se tabstop=4
se sw=4
se ignorecase " with smartcase and ignorecase enabled, searches are case sensitive if at least one upper letter is used
se smartcase
se tw=80
se colorcolumn=80
se lazyredraw
se laststatus=2
se splitright " on :vspl, select right buffer
se splitbelow " on :spl, select lower buffer
se backspace=2
se noswapfile " disable swap files
se cinoptions=(0: " indent broken lines to match with the last open bracket


se scrolloff=5 "when scrolling,leave a scroll offset of 5 lines
map <F9> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q <CR>

map <F12> :nohl<CR>

se undofile
se undodir=/home/kolja/.vim/undo/

colorscheme solarized
highlight ExtraWhitespace ctermbg=lightred
autocmd WinEnter * call matchadd("ExtraWhitespace", '\s\+$\| \+\ze\t')


nmap <C-l> :cd %:p:h<CR> " cd to directory of current buffer

map <C-d> o<Esc>p  " paste unnamed register into new line
map <F3> :UndotreeToggle<CR>


function! Up()
	if &diff
		normal [c
	else
		try
			exe "bo ptag " . expand("<cword>")
		catch
			"go to definition instead"
			normal gD
		endtry
	endif
endfunction
function! Down()
	if &diff
		normal ]c
	else
		exe "pclose"
	endif
endfunction

" in diff mode, map the <C-up/down) arrow keys to select the next change
" in normal mode, show symbol definition of word under the cursor in preview window
nmap <C-Up> :call Up()<CR>
nmap <C-Down> :call Down()<CR>
nmap <Left> :ptprevious<CR>
nmap <Right> :ptnext<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"clean up eol spaces
command! -range Beautify <line1>,<line2>s/\s\+$//g


let g:VCSCommandDeleteOnHide=1
let g:VCSCommandResultBufferNameExtension=".vcs"
"deal with syntax highlight in diff mode, not needed with solarized YAY!!
"autocmd BufEnter *.vcs syn off
"nmap <C-x> :bd:syn on

let g:airline_symbols = {}
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_warning = " "
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count = 1

" map arrow keys to jump to modified hunk
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nmap <Down> <Plug>GitGutterNextHunk
nmap <Up> <Plug>GitGutterPrevHunk


"emacs inspired incsearch
cmap <C-right> <Cr>gn
vmap <C-right> "xy<Esc>/<C-r>x

if has("gui_runnning")
gfn=Monaco\ 9
toolbar=
guioptions=ac
endif

abbr pritn print
