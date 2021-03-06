autocmd!


set t_Co=256
filetype off " Pathogen needs to run before plugin indent on

call plug#begin('~/.vim/plugged')
let $GIT_SSL_NO_VERIFY = 'true'
"let g:plug_url_format = 'git@github.com:%s.git'
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/histwin.vim'
Plug 'rking/ag.vim'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/taglist.vim'
Plug 'christoomey/vim-tmux-navigator'
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
se noet
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
se cinoptions=g0(0: " indent broken lines to match with the last open bracket, class labels with indent 0
se diffopt=vertical
se nofoldenable


se scrolloff=5 "when scrolling,leave a scroll offset of 5 lines
map <F9> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q <CR>

map <F12> :nohl<CR>

se undofile
se undodir=~/.vim/undo/

colorscheme solarized
highlight ExtraWhitespace ctermbg=13
autocmd BufReadPost * call matchadd("ExtraWhitespace", '\s\+$\| \+\ze\t')

let g:tmux_navigator_no_mappings = 1

nmap <C-l> :cd %:p:h<CR> " cd to directory of current buffer

map <C-d> o<Esc>p  " paste unnamed register into new line
map <F3> :UndotreeToggle<CR>

nmap <Right> :GitGutterStageHunk
nmap <Left> :GitGutterUndoHunk
nmap <C-p> :GitGutterPreviewHunk
nmap <C-x> :pclose<Cr>
nmap cc :Gcommit<Cr>
nmap ca :Gcommit --amend<Cr>

function! Up()
	if &diff
		normal [c
	else
		exe "GitGutterPrevHunk"
	endif
endfunction
function! Down()
	if &diff
		normal ]c
	else
		exe "GitGutterNextHunk"
	endif
endfunction

" in diff mode, map the <C-up/down) arrow keys to select the next change
" in normal mode, show symbol definition of word under the cursor in preview window
nmap <Up> :call Up()<CR>
nmap <Down> :call Down()<CR>

" default mappings
nmap [1;3D :TmuxNavigateLeft<cr>
nmap [1;3C :TmuxNavigateRight<cr>
nmap [1;3A :TmuxNavigateUp<cr>
nmap [1;3B :TmuxNavigateDown<cr>
nmap <C-c> <C-w>o

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"clean up eol spaces
command! -range Beautify <line1>,<line2>s/\s\+$//g

" write as root
command! XX w !sudo tee % > /dev/null


" search for word under cursor
nnoremap S :Ag <C-r><C-w><Cr>

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

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_highlight_lines = 0

"emacs inspired incsearch
cmap <C-right> <Cr>gn
vmap <C-right> "xy<Esc>/<C-r>x

if has("gui_runnning")
gfn=Monaco\ 9
toolbar=
guioptions=ac
endif

abbr pritn print

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap gn :cn<Cr>
nmap gp :cp<Cr>

command! -nargs=* Log Glog -n 100 -- <args>


