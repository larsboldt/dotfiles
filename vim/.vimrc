set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader = ','
set nonumber

"---------------Visuals---------------"
colorscheme atom-dark-256
set t_CO=256

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

highlight clear SignColumn
highlight clear LineNr
highlight LineNr ctermfg=238
set nuw=5

set foldcolumn=2
hi foldcolumn ctermbg=bg

hi vertsplit ctermbg=bg ctermfg=bg

"----------Split management-----------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"---------------Search----------------"
set hlsearch
set incsearch

let g:ctrlp_custom_ignore = 'node_modules\|git'

"---------------Mappings--------------"

" Make it easy to edit vimrc file
nmap <Leader>ev :e ~/.vimrc<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <c-E> :CtrlPMRUFiles<cr>

:imap jj <Esc>

" Ctags
nmap <Leader>f :tag<space>
nmap <c-T> :!ctags -R --exclude=.git<cr>

"---------------Commands-------------"

" Automatically source the vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
