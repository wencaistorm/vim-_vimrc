set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline'	" ��ǿ״̬��
Plugin 'scrooloose/nerdtree'	" Ŀ¼��
Plugin 'scrooloose/nerdcommenter'	" ����ע�ʹ���
Plugin 'gorodinskiy/vim-coloresque' " ������ʾ��ɫ���� 
Plugin 'altercation/vim-colors-solarized' "	����
"Plugin 'Valloric/MatchTagAlways' "ƥ���ǩ
Plugin 'mattn/emmet-vim'	" emmet
"Plugin 'tpope/vim-markdown'  " ����markdown
"Plugin 'alvan/vim-closetag'  " tag �Զ���ȫ
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"NERDTree��ݼ�
map <C-n> :NERDTreeToggle<CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1


" ע��
map <c-/> ,cn<CR>
let g:NERDTrimTrailingWhitespace = 1

" ����vim�Զ��� NERDTree
autocmd VimEnter * NERDTree

"���µ�bufferʱ�Զ���λ���༭����
autocmd VimEnter * wincmd p



" ��������
" ===========
" �رռ���ģʽ��compatible �ǲ������͵�ѡ���ǰ����� no ����ر�״̬
set nocompatible

let mapleader = ","

filetype on 	"�ļ����ͼ��
syntax enable 	"���﷨����
set number 	"��ʾ�к�
set go= 	"����ʾͼ�ΰ�ť
set cursorline 	"������ʾ��ǰ��
set guifont=Consolas:h16  	"�������弰��С
colorscheme desert 		"������ɫ����
set fileencodings=utf-8,gbk	" �������ļ�ʱʹ�õı���
set fenc=utf-8			" �����ļ�ʱʹ�õı���
set background=dark	" dark �ǰ�ɫϵ��light ����ɫϵ
colorscheme solarized


" ����======
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 

set smartindent
" ���Զ�����������Ч������ smartindent ��Ӱ��
set autoindent 

set cindent
" ======����

set backspace=indent,eol,start


" ������ɶԵ������ǣ�vim ����ת������һ��ƥ������ţ�Ȼ��ص����������λ��
set showmatch

" set showmatch ��ת��������ʱ�����ã�1 ��ʾ 1/10 ��
set matchtime=1

" ��ߣ�����Ļ�·���ʾ�кź��к�
set ruler

" ����������ģʽ���������ҵ�ƥ����͸�����ʾ����ƥ����
set hlsearch

" ����������ģʽ��Vim �ἴʱƥ���㵱ǰ��������ݣ������������õ�����������
" �����㻹��Ҫ��������� <CR>���س�����ȷ������������ݵ�
set incsearch

" ����ʱ���Դ�Сд�������� \C ��ʶ��ʱ������Сд����ģʽ
set ignorecase

"Change work dir to current dir
"���ն���ʹ�� Vim ��ĳһ�ļ�ʱ����Ĭ�Ͻ���ǰĿ¼��Ϊ Vim �Ĺ���Ŀ¼��
"������ʹ�� gvim ʱ����������滷���ṩ���ļ���������ֱ�Ӵ�ĳһ�ı��ļ���gvim �Ĺ���Ŀ¼Ĭ���� $HOME��
"�����Զ��� Vim ����Ŀ¼Ǩ�Ƶ������ı��ļ���Ŀ¼��
autocmd BufEnter * cd %:p:h

" ����ʱ�Զ����
autocmd GUIEnter * simalt ~x

" �������ƶ����ʱ�������Ϸ����·����ٻᱣ��������
set scrolloff=3

" �� Tab ���ű�� �ո�
set expandtab

" tab �ַ�������Ŀո���
set tabstop=2

" softtabstop ��Ӱ�� <BS> ɾ���Ŀո������������� <SPACE> ����Ŀո񣬶��� <TAB> ����Ŀո������������ǰ� softtabstop �趨�ɺ� tabstop һ������ֵ�������������� <TAB> �������������� <BS> ɾ������������Ϊ����һ���ġ�

" ���Ƕ���ʹ�� <SPACE> ����Ŀո�������������������ɸ��ո�<BS> ���ǻ�һ��һ����ɾ����

set softtabstop=2

" smarttab Ҫ�ͺ���� shiftwidth ������ã���ֻ����������λ�á��� smarttab ����ʱ�������׼��� <TAB> ����� shiftwidth �趨����ֵ���������ط������ tabstop �趨����ֵ���� smarttab �ر�ʱ��������������� <TAB>��������� tabstop �趨����ֵ��

" ���ԣ�������� smarttab��Ȼ�� shiftwidth �� tabstop �趨��һ������ֵ������һ���� 8 һ���� 4����ô�����׼��� <TAB> ����� 8 ���ַ��Ŀհף����������ط����� <TAB> ����� 4 ���ַ��Ŀհס��ⳣ���������� Continuation Indent ����Ϊ����ʱҲ���� Indentation for Wrapped Lines ���� Wrapped Line Indentation��
set smarttab

set shiftwidth=2

" list ���������Ʊ����tab������β�ո����trail�����н�������eol���ȵ�������ŵĻ��ԣ�
" ��������۲���Щ������ŵ�״̬����ȷ�ؿ����ı��ı༭��
" set list listchars=eol:?,tab:?\ ,trail:.,

" �ر��Զ����ݣ�������� ~ �ļ�
set nobackup 
