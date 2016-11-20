let NERDTreeShowHidden=1          "隠しファイルを表示する

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.Dotfiles/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.Dotfiles/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'MaxMEllon/molokai'
NeoBundle 'tpope/vim-surround'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'MaxMEllon/vim-tmng'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'nobarudo/tender.vim'
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ }
function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

"set laststatus=2
set noshowmode

NeoBundleCheck

call neobundle#end()

set number                        "行番号を表示する
set ruler                         "カーソルが何行目の何列目にあるか表示する
set tabstop=4                     "画面上でタブが占める幅
set softtabstop=4                 "tabで挿入される空白の量
set shiftwidth=4                  "自動でインデントでずれる幅
set expandtab                     "タブ入力を複数の空白入力に置き換える
set showmatch                     "括弧の対応をハイライト
set hidden                        "複数ファイルの編集を可能にする
set background=dark               "背景色が暗い用
set backspace=indent,eol,start    "BackSpaceを表示する
set laststatus=2                  "ステータス行を表示
set relativenumber
set cursorline
set list
set pastetoggle=<F12>

helptags ~/.Dotfiles/.vim/.help/vimdoc-ja/doc/
set runtimepath+=~/.Dotfiles/.vim/.help/vimdoc-ja
set helplang=ja

"html,css
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"ruby
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap jj  <Esc> 
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent>S :e ++enc=shift_jis<CR>
nnoremap <silent>U :e ++enc=utf-8<CR>
"<C-j>をEscの代わりに
nnoremap <C-j><C-j> :noh<CR>
inoremap <C-j> <Esc> 
vnoremap <C-j> <Esc> 

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" カラースキーマの設定--------------------------------------------------

filetype indent on
syntax on

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme molokai
"  colorscheme tender
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

"Test--------------------------------------------------
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" 補完ウィンドウの設定
set completeopt=menuone

" 補完ウィンドウの設定
set completeopt=menuone

" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_enable_camel_case_completion  =  1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
