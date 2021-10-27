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
set clipboard+=unnamed
set incsearch "入力で順次検索文字にヒットさせる
set hlsearch "検索文字をハイライト
set ambiwidth=double "※のような全角記号を表示
set cursorline "カーソルラインをハイライト
set list listchars=tab:\¦\ "インデントの表示文字
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set autoindent
set smartindent
set syn=php
set grepprg=grep\ -n\ --exclude-dir=\'tmp\'\ --exclude-dir=\'theme\'\ --exclude=\'tags\'\ --exclude=\'*.svn*\'\ --exclude=\'all-wcprops\'\ --exclude=\'entries\'\ --exclude=\'*.tmp\'\ $*\ /dev/null
set viminfo=
set wildignore=**/.git/**,**/node_modules/**,**/gulp/**,**/php-vendor/**,**/scss/**,**/SQL/**,**/cakephp2/lib/**,**/cakephp2/plugins/DebugKit/**,**/cakephp2/app_*/tmp/**,**/cakephp2/app_*/webroot/**,**/cakephp/lib/**,**/cakephp/plugins/DebugKit/**,**/cakephp/app_*/tmp/**,**/cakephp/app_*/webroot/**

source ~/dotfiles/.vim/plugin/matchit.vim

noremap PP "0p
inoremap <silent> jj <ESC>

" カーソル移動
"nnoremap j gj
"onoremap j gj
"xnoremap j gj
"nnoremap k gk
"onoremap k gk
"xnoremap k gk
"inoremap <C-j> <Down>
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
nnoremap ) <C-w>>
nnoremap ( <C-w><LT>

" highlight
hi Search term=reverse ctermbg=12
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1

" PHP設定
"let g:php_baselib       = 1
"let g:php_htmlInStrings = 1
"let g:php_noShortTags   = 1
"let g:php_sql_query     = 1

" MySql設定
let g:sql_type_default = 'mysql'

" ある拡張子を別の拡張子に対応させる
autocmd BufRead,BufNewFile *.scss set filetype=css
autocmd BufRead,BufNewFile *.ctp set filetype=php

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" ペースト設定
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"

	function XTermPasteBegin(ret)
		set paste
		return a:ret
	endfunction

	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" タグジャンプを分割
nnoremap v<C-]> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap s<C-]> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 検索にエスケープ無しで正規表現使う
nnoremap / /\v

"改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

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
"let g:user_emmet_leader_key='<C-t>'

"-------------------------------------------------
" CtrlPの設定
"-------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' "マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky'] "CtrlPの拡張として「funky」を使用
let g:ctrlp_custom_ignore = 'gulp\|php-vendor\|scss\|SQL\|cakephp/lib\|cakephp2/lib\|cakephp/plugins\|cakephp2/plugins'

"-------------------------------------------------
" プラグインのインストール
"-------------------------------------------------

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
	NeoBundle 'mattn/emmet-vim' "https://github.com/mattn/emmet-vim
	NeoBundle 'vim-scripts/mru.vim' "https://github.com/vim-scripts/mru.vim
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle "ctrlpvim/ctrlp.vim" "https://github.com/ctrlpvim/ctrlp.vim
	NeoBundle 'tacahiroy/ctrlp-funky' "CtrlPの拡張プラグイン. 関数検索
	NeoBundle 'bronson/vim-trailing-whitespace' "末尾の全角と半角の空白文字を赤くハイライト
	NeoBundle 'Yggdroot/indentLine' "インデントの可視化
call neobundle#end()

" vimrcに記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
