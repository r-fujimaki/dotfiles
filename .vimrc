syntax on
colorscheme monokai "カラーテーマ
scriptencoding utf-8
set encoding=utf-8
set noswapfile "スワップファイルを作らない
set nolist "空白やタブの表示
set number "行番号を表示
set autoread "編集中のファイルが変更されたら自動で読み直す
set showcmd "入力中のコマンドをステータスに表示
set showmatch "カッコ入力時の対応するカッコを表示
set softtabstop=4 "キーボードをおした時のタブの表示幅
set shiftwidth=4 "行頭でのタブの表示幅
set tabstop=4 "行頭以外でのタブの表示幅
set virtualedit+=block
set clipboard=unnamed
set incsearch "入力で順次検索文字にヒットさせる
set hlsearch "検索文字をハイライト
set ambiwidth=double "※のような全角記号を表示
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set autoindent
set smartindent
set syn=php
set grepprg=grep\ -n\ --exclude=\'tags\'\ --exclude=\'*.svn*\'\ --exclude=\'all-wcprops\'\ --exclude=\'entries\'\ --exclude=\'*.tmp\'\ $*\ /dev/null

noremap PP "0p

" カーソル移動
nnoremap <Down> gj
nnoremap <Up>   gk
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ウィンド操作
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap ( <C-w>>
nnoremap ) <C-w><LT>

" highlight
hi Search term=reverse ctermbg=11
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1

" ある拡張子を別の拡張子に対応させる
autocmd BufRead,BufNewFile *.scss set filetype=css
autocmd BufRead,BufNewFile *.ctp set filetype=php

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END



"-------------------------------------------------
" neocomplcache設定
"-------------------------------------------------
"辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"-------------------------------------------------
" neosnippet設定
"-------------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

"-------------------------------------------------
" emmet設定
"-------------------------------------------------
let g:user_emmet_leader_key='<C-t>'

if has('vim_starting')
	set nocompatible
	" neobundle をインストールしていない場合は自動インストール
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "install neobundle..."
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	" runtimepath の追加は必須
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" plugin読み込み
call neobundle#begin(expand('~/.vim/bundle'))
	let g:neobundle_default_git_protocol='https'
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neosnippet'     "https://github.com/Shougo/neosnippet.vim
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'thinca/vim-quickrun' "https://github.com/thinca/vim-quickrun
	NeoBundle 'mattn/emmet-vim' "https://github.com/mattn/emmet-vim
	NeoBundle 'vim-scripts/mru.vim' "https://github.com/vim-scripts/mru.vim
	NeoBundle "ctrlpvim/ctrlp.vim" "https://github.com/ctrlpvim/ctrlp.vim
call neobundle#end()

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
