set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Plugins here:
"
" original repos on GitHub
Plugin 'fs111/pydoc.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-rails.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-commentary'
Plugin 'SirVer/ultisnips'
Plugin 'jcf/vim-latex'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-cucumber'
Plugin 'hura/vim-asymptote'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'vim-scripts/Vim-R-plugin'

" non-GitHub repos
" Plugin 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
" ...

filetype plugin indent on     " required!

" Configure python-mode
let g:pymode_python = 'python3'

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.

set number
set ignorecase
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set laststatus=2
set ruler
set wildmenu
set ai
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax on
if has('gui_running')
    set background=dark
    colorscheme gruvbox
    set guifont=Inconsolata:h15
else
    colorscheme Monokai
endif

map <C-n> :NERDTreeToggle<CR>
nmap <C-j> mzo<Esc>`z
nmap <C-k> mzO<Esc>`z
nmap \\r :!python3 %<CR>
nmap <F8> :TagbarToggle<CR>
imap jk <Esc>
inoremap <S-Enter> <CR>end
nmap <C-i> :CtrlPTag<CR>
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

func Loaded(var1)
    if exists(a:var1)
        return 1
    else
        return 0
    endif
endfunction

fu! RSte(var1)
    if Loaded(":Rake")
        let xToBe = '!rspec spec/ -e "' . a:var1 . '"'
        exe xToBe
    endif
endfunction

command -nargs=* RSte call RSte(<f-args>)
if 1
    nnoremap ,, :call<space>RSte("")<cr>
endif

if has("autocmd")
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
	autocmd Filetype css set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype less setl sw=2 sts=2 expandtab
	autocmd BufNewFile,BufRead *.scss             set ft=scss.css
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal sw=4 sts=4 expandtab
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType ruby set omnifunc=rubycomplete#Complete
    autocmd FileType ruby let g:rubycomplete_buffer_loading=1
    autocmd FileType ruby let g:rubycomplete_classes_in_global=1
    autocmd FileType ruby setl sw=2 sts=2 expandtab
    autocmd FileType html.eruby setl sw=2 sts=2 expandtab
    autocmd FileType html setl sw=2 sts=2 expandtab
    autocmd FileType css setl sw=2 sts=2 expandtab
    autocmd FileType scss.css setl sw=2 sts=2 expandtab
    autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
	autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd Filetype latex setlocal tw=80
    autocmd Filetype tex setlocal textwidth=80
    autocmd BufNewFile,BufRead *.asy set filetype=asy
	autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
endif

" Go Language tag settings
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" UltiSnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"

" Latex Suite viewing files
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_TreatMacViewerAsUNIX = 1

" Add date
:inoremap <c-z> <C-R>=strftime("%d %B %Y")<CR>

