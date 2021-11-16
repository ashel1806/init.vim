let g:ale_disable_lsp=1

call plug#begin()
 
 " Theme
 Plug 'dikiaap/minimalist'
 Plug 'drewtempelmeyer/palenight.vim'
 
 " Move
 Plug 'easymotion/vim-easymotion'
 
 " files
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'preservim/nerdtree'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 
 " Navigation
 Plug 'christoomey/vim-tmux-navigator'
 
 " IDE
 Plug 'jiangmiao/auto-pairs'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'alvan/vim-closetag'
 Plug 'sheerun/vim-polyglot'
 Plug 'itchyny/lightline.vim'
 " Plug 'Yggdroot/indentLine'
 Plug 'tpope/vim-fugitive' 
 Plug 'dense-analysis/ale'
 Plug 'frazrepo/vim-rainbow'
 Plug 'ryanoasis/vim-devicons'
 Plug 'lukas-reineke/indent-blankline.nvim'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

 "Typing
 "Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'

 "LatEx
 Plug 'lervag/vimtex'
 Plug 'Konfekt/FastFold'
 Plug 'matze/vim-tex-fold'

 call plug#end()

 " Thme
 set t_Co=256
 set background=dark
 colorscheme palenight

 " Basic Config
 syntax on
 set number
 set mouse=a
 set numberwidth=1
 set sw=2
 set showcmd
 set ruler
 set encoding=utf-8
 set showmatch
 set relativenumber
 set laststatus=2
 let mapleader=" "
 set noshowmode
 set guifont=DejaVu_Mono_Nerd_Font:h12

 " Theme config
 let g:lightline = { 'colorscheme': 'palenight' }
 let g:airline_theme = "palenight"

 if(has("nvim"))
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 endif

 if(has("termguicolors"))
   set termguicolors
 endif

 let g:palenight_terminal_italics=1

 " Easymotion config
 nmap <Leader>s <Plug>(easymotion-s2)
 nmap <Leader>nt :NERDTreeFind<CR>

 " My Shorcuts
 nmap <Leader>w :w<CR>
 nmap <Leader>q :q<CR>
 nmap <Leader>y "+y
 nmap <Leader>p "+p

 " coc config
 set hidden
 
 set nobackup
 set nowritebackup

 set cmdheight=2

 set updatetime=300

 set shortmess+=c

 if has("nvim-0.5.0") || has("patch-8.1.1564")
   set signcolumn=number
 else
   set signcolumn=yes
 endif

 inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
 endfunction

 if has('nvim')
   inoremap <silent><expr> <c-space> coc#refresh()
 else
    inoremap <silent><expr> <c-@> coc#refresh()
 endif

 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

 nmap <silent> gd <Plug>(coc-definition)
 nmap <silent> gy <Plug>(coc-type-definition)
 nmap <silent> gi <Plug>(coc-implementation)
 nmap <silent> gr <Plug>(coc-references)

 " closetag config
 let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
 let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx'
 let g:UltiSnipsSnippetDirectories = ["UltiSnips"] 
 
 " polyglot config
 set nocompatible

 " indentLine config
 let g:indentLine_setColors=0

 " NERDTree Configs
 let g:NERDTreeDirArrowExpandable='►'
 let g:NERDTreeDirArrowCollabsible='▼'
 let NERDTreeQuitOnOpen=1
 let NERDTreeShowHidden=1

 let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
 let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

 let g:NERDTreeFileExtensionHighlightFullName = 1
 let g:NERDTreeExactMatchHighlightFullName = 1
 let g:NERDTreePatternMatchHighlightFullName = 1

 " Lighline theme
 let g:lightline = {
      \ 'colorscheme': 'material'
      \ }

 " fzf maps
 nmap <Leader>ff :Files<CR>
 " nmap <Leader>ag :Ag<CR>

 let g:fzf_preview_window=[]

 " Inent Rainbow config
 let g:rainbow_active=1
 
 " Snippets Config
 let g:UltiSnipsExpandTrigger="<shift>"
 let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpBackwardTrigger="<c-z>"
 let g:UltiSnipsEditSplit="vertical"

 " Vimtex - SumatraPDF
 let g:tex_flavor  = 'latex'
 let g:tex_conceal = ''
 let g:vimtex_fold_manual = 1
 let g:vimtex_latexmk_continuous = 1
 let g:vimtex_compiler_progname = 'nvr'

 " use SumatraPDF if you are on Windows
 let g:vimtex_view_general_viewer = 'SumatraPDF'
