highlight EndOfBuffer ctermfg=black

" yank した文字列をクリップボードに保存
set clipboard=unnamed,unnamedplus
" タブ入力を空白に変換
set expandtab
" 行番号の表示
set number
" タブの空白文字数を4文字に設定
set tabstop=4
" タイトルの表示
set title
" すべてのモードでマウスを有効化
set mouse=a
" ステータスラインを常に表示
set laststatus=2
" 不可視文字を表示
set list
" 改行コードを$として表示
set listchars=eol:$

" vim-plugの設定
call plug#begin('~/.vim/plugged')

" ステータスラインの情報を充実させるプラグイン
Plug 'itchyny/lightline.vim'
" レトロ調のカラースキーム
Plug 'habamax/vim-gruvbit'
" IDEのようなコード保管機能を提供するプラグイン
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" lightlineのカラーテーマの設定
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" gruvbitによるカラースキーマの設定
set termguicolors
colorscheme gruvbit

