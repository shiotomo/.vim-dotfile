set number                        "行番号を表示する
set ruler                         "カーソルが何行目の何列目にあるか表示する 
set t_Co=256                      "ターミナルで256色表示を使う 
set tabstop=4                     "画面上でタブが占める幅 
set shiftwidth=4                  "自動でインデントでずれる幅
set expandtab                     "タブ入力を複数の空白入力に置き換える
set showmatch                     "括弧の対応をハイライト
set hidden                        "複数ファイルの編集を可能にする 
set background=dark               "背景色が暗い用
set backspace=indent,eol,start    "BackSpaceを表示する 
set laststatus=2                  "ステータス行を表示

syntax on                         "色分け

inoremap { {}<LEFT>  
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap jj <Esc>  
nnoremap <silent><C-e> :NERDTreeToggle<CR>

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

NeoBundleCheck

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
