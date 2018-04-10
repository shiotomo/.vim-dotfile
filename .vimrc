set laststatus=2
set noshowmode
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
" set list
set pastetoggle=<F12>

helptags ~/.Dotfiles/.vim/.help/vimdoc-ja/doc/
set runtimepath+=~/.Dotfiles/.vim/.help/vimdoc-ja
set helplang=ja

"html,css,ruby
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap jj  <Esc>
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

"Test--------------------------------------------------
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
