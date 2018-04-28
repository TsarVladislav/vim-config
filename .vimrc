""вообще не трогай, а то цвета работать не будут
set nocompatible
set re=1
set t_Co=256

colorscheme  gruvbox
set bg=dark

set number
set ttyfast
set cindent
set autoindent
set copyindent
set noswapfile
set nobackup
set noexpandtab
set lazyredraw
set list
set noshowmode
set tabstop=4
set shiftwidth=4
set so=999
set laststatus=2
set clipboard=unnamedplus

syntax enable
" перемещение по вкладкам
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"  выделять текущую строку
set cursorline

" показывать пары для [], {} и ()
set showmatch

" выделяет красным цветом символы, вылезающие за границу 80 символов
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set colorcolumn=80

set listchars=eol:←,tab:→-,trail:•,extends:>,precedes:<
au FileType c setl ts=4 et sw=4 sts=4 expandtab "dictionary+=/home/vlad/.vim/words/c.txt

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'nvie/vim-flake8',{'for': 'py'}
"Plug 'justmao945/vim-clang', {'for': 'c'}
Plug 'maralla/completor.vim'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rhysd/vim-clang-format'
"Plug 'tpope/vim-fugitive'
"Plug 'vivien/vim-linux-coding-style'
call plug#end()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
filetype plugin on
let g:airline_detect_paste=1
let g:airline_theme='minimalist'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:completor_clang_binary = '/usr/bin/clang'
setlocal foldmethod=marker
setlocal foldmarker={,}
set completeopt +=preview
augroup PreviewOnBottom
	    autocmd InsertEnter * set splitbelow
	        autocmd InsertLeave * set splitbelow!
		augroup END
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = [ 'gcc']
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_cpp_check_header = 1


let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
			\ "IndentWidth": 8,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Linux"}
"autocmd FileType c ClangFormatAutoEnable



" https://toster.ru/q/2061
" {{{ Locale settings
" if we have BOM => this is BOM
if &fileencodings !~? "ucs-bom"
	set fileencodings^=ucs-bom
endif
if &fileencodings !~? "utf-8"
	let g:added_fenc_utf8 = 1
	set fileencodings+=utf-8
endif
if &fileencodings !~? "default"
	set fileencodins+=default
endif
" }}}


set fileencodings=utf-8,cp1251,koi8-r,cp866

menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

map <F8> :emenu Encoding.

