" Vim syntax file
" Language:     Route files for Minima (github.com/tessarin/minima)
" Maintainer:   Cesar Tessarin <cesar@tessarin.com.br>
" Last Change:  2025 Jul 17
" Repository:   github.com/tessarin/vim-minima
" ---------------------------------------------------------------------

if exists("b:current_syntax")
    finish
end

" Add special character used in methods
setlocal iskeyword+=*,@-@

" First column: method or directive
syn keyword mVerb
            \ GET _GET HEAD POST PUT DELETE CONNECT OPTIONS TRACE PATCH

syn keyword mAnyVerb *

syn keyword mDirectiveMark @
            \ nextgroup=mDirectiveName skipwhite

" Second column: pattern or directive name
syn match mPattern /\/\S*/
            \ contains=mPatternGroup nextgroup=mController skipwhite

syn region mPatternGroup start="{" end="}"
            \ contains=mPatternGroup contained

syn keyword mDirectiveName not_found server_error
            \ contained nextgroup=mController skipwhite

" Third column: controller
syn match mController /\S\+/
            \ contained nextgroup=mMethod skipwhite

" Fourth column: method
syn match mMethod /\S\+/ contained

" Comments
syn keyword mTodo TODO XXX contained
syn match mComment /^#.*/ contains=mTodo

hi def link mVerb           Type
hi def link mAnyVerb        Special
hi def link mDirectiveMark  Statement

hi def link mPattern        String
hi def link mPatternGroup   SpecialChar
hi def link mDirectiveName  Statement

hi def link mController     Function

hi def link mMethod         Identifier

hi def link mTodo           Todo
hi def link mComment        Comment

let b:current_syntax = "mroutes"
