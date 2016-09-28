let NERDTreeShowHidden=1          "隠しファイルを表示する

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'scrooloose/syntastic' 
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'MaxMEllon/molokai'
NeoBundle 'tpope/vim-surround'
"lightline----
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'

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

helptags ~/.vim/.help/vimdoc-ja/doc/
set runtimepath+=~/.vim/.help/vimdoc-ja
set helplang=ja

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

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

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

" カラースキーマの設定--------------------------------------------------

filetype indent on
syntax on

" 色の設定(syntax onのあと) molokai
set t_Co=256
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme desert
endtry

