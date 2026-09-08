" Vim syntax file
" Language:    Mim
" Maintainer:  https://github.com/AnyDSL/vim-mim
" Based on:    docs/langref.md in https://github.com/AnyDSL/mimir

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match

" Keywords {{{1
" Declaration/expression keywords, cf. langref.md#terminals ("Keywords").
syn keyword mimKeyword and anx as axm cn con end extern fn fun import inj
syn keyword mimKeyword ins insert lam let match mod norm plugin priv pub
syn keyword mimKeyword rec ret rule use when where with
" secondary spelling of the "λ" expression keyword
syn keyword mimKeyword lm
syn match   mimKeyword "λ"

" Builtin types / kinds, cf. langref.md#terminals ("Keywords").
syn keyword mimType Bool Cn Fn I1 I8 I16 I32 I64 Idx Nat Rule Type Univ
" "*" abbreviates "Type (0:Univ)", "□" abbreviates "Type (1:Univ)"; "★" is an
" alternative spelling of "*"
syn match   mimType "[*□]"
syn match   mimType "★"

" Predefined boolean aliases: tt = 1₂, ff = 0₂
syn keyword mimBoolean tt ff

" Predefined Nat aliases for the "iN" keywords, and the ⊥/⊤ literals
syn keyword mimConstant i1 i8 i16 i32 i64
syn keyword mimConstant bot top
syn match   mimConstant "⊥"
syn match   mimConstant "⊤"

" Literals {{{1
" L ::= dec+
syn match mimNumber "[+-]\=\d\+"
" L ::= "0" ["bB"] bin+
syn match mimNumber "[+-]\=0[bB][01]\+"
" L ::= "0" ["oO"] oct+
syn match mimNumber "[+-]\=0[oO][0-7]\+"
" L ::= "0" ["xX"] hex+
syn match mimNumber "[+-]\=0[xX]\x\+"

" L ::= sign? dec+ eE sign? dec+
"    |  sign? dec+ "." dec* (eE sign? dec+)?
"    |  sign? dec* "." dec+ (eE sign? dec+)?
syn match mimFloat "[+-]\=\d\+[eE][+-]\=\d\+"
syn match mimFloat "[+-]\=\d\+\.\d*\([eE][+-]\=\d\+\)\="
syn match mimFloat "[+-]\=\d*\.\d\+\([eE][+-]\=\d\+\)\="

" L ::= sign? "0" ["xX"] hex+ pP sign? dec+
"    |  sign? "0" ["xX"] hex+ "." hex* pP sign? dec+
"    |  sign? "0" ["xX"] hex* "." hex+ pP sign? dec+
syn match mimFloat "[+-]\=0[xX]\x\+[pP][+-]\=\d\+"
syn match mimFloat "[+-]\=0[xX]\x\+\.\x*[pP][+-]\=\d\+"
syn match mimFloat "[+-]\=0[xX]\x*\.\x\+[pP][+-]\=\d\+"

" X_n ::= dec+ sub+ | dec+ "_" dec+   (index literal of type "Idx n")
syn match mimIndex "\d\+[₀-₉]\+"
syn match mimIndex "\d\+_\d\+"

" esc ::= \' \" \0 \a \\ \b \f \n \r \t \v
syn match mimEscape "\\['\"0abfnrtv\\]" contained

" C ::= "'" (ascii_char | esc) "'"
syn match mimChar "'\%(\\['\"0abfnrtv\\]\|[^'\\]\)'" contains=mimEscape

" S ::= '"' (ascii_string_char | esc)* '"'
syn region mimString start=+"+ skip=+\\.+ end=+"+ contains=mimEscape oneline

" Comments {{{1
" "/* ... */" comments are not nested.
syn region  mimComment    start="/\*" end="\*/" contains=mimTodo
syn match   mimComment    "//.*$" contains=mimTodo
" "/// ..." comments are forwarded to the generated Markdown output.
syn match   mimCommentDoc "///.*$" contains=mimTodo
syn keyword mimTodo TODO FIXME XXX NOTE contained

" Punctuation {{{1
" ( ) [ ] { } ⦃ ⦄ ‹ › « » plus the ⟨ ⟩ ⟪ ⟫ alternatives and the ASCII
" secondary spellings "<" ">" "<<" ">>" for "‹" "›" "«" "»".
syn match mimDelimiter "[()\[\]{}]"
syn match mimDelimiter "[⦃⦄‹›«»⟨⟩⟪⟫]"
syn match mimDelimiter "<<\|>>\|<\|>"
syn match mimDelimiter "[,;.]"

" → => ⊥ ⊤(handled above) = @ $ # | ∪, plus the ASCII secondary spelling "->"
syn match mimOperator "=>\|->\|→\|[=@$#|:]\|∪"

" Highlighting {{{1
let b:current_syntax = "mim"

hi def link mimKeyword     Keyword
hi def link mimType        Type
hi def link mimBoolean     Boolean
hi def link mimConstant    Constant
hi def link mimNumber      Number
hi def link mimFloat       Float
hi def link mimIndex       Number
hi def link mimChar        Character
hi def link mimString      String
hi def link mimEscape      SpecialChar
hi def link mimComment     Comment
hi def link mimCommentDoc  SpecialComment
hi def link mimTodo        Todo
hi def link mimDelimiter   Delimiter
hi def link mimOperator    Operator

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: fdm=marker
