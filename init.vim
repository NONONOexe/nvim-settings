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
" 行をまたぐカーソルの移動を有効化
set whichwrap=b,s,h,l,<,>,[,],~

" vim-plugでインストールするプラグイン
call plug#begin('~/.vim/plugged')

" ステータスラインの情報を充実させるプラグイン
Plug 'itchyny/lightline.vim'
" レトロ調のカラースキーム
Plug 'habamax/vim-gruvbit'
" Rustに関する設定が可能になるプラグイン
Plug 'rust-lang/rust.vim'
" 入力補完機能を有効化するためのプラグイン
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 括弧などを入力したときに閉じ括弧など対応する文字を自動入力してくれるプラグイン
Plug 'cohama/lexima.vim'

call plug#end()

" lightlineのカラーテーマの設定
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" gruvbitによるカラースキーマの設定
set termguicolors
colorscheme gruvbit

" 保存時に自動でrustfmtによりコードをフォーマットする
let g:rustfmt_autosave = 1

" インストールするCoc拡張機能
let g:coc_global_extensions = ['coc-rust-analyzer']

" 入力補完ウィンドウが出ているときにTab，Enterは候補の決定とする
inoremap <silent><expr> <Tab>   coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
inoremap <silent><expr> <Enter> coc#pum#visible() ? coc#pum#confirm() : "\<Enter>"

