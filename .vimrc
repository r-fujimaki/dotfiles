filetype off
if has('vim_starting')
	if &compatible
		set nocompatible " Be iMproved
	endif

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ここにインストールしたいプラグインのリストを書く:
NeoBundle 'mattn/emmet-vim'
:


call neobundle#end()

" Reqiured:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on
colorscheme monokai
set fileencodings=utf-8,euc-jp
set noswapfile "スワップファイルを作らない
set list
set nolist
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
nnoremap <Down> gj
nnoremap <Up>   gk

au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.ctp set filetype=php

hi Search term=reverse ctermbg=11

hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
