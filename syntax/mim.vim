if exists("b:current_syntax")
    finish
endif

syn match mimBin         "[+-]\?0[bB][01]\+\([iI]\d\+\)\?"
syn match mimOct         "[+-]\?0[oO]\o\+\([iI]\d\+\)\?"
syn match mimDec         "[+-]\?\d\+\([iI]\d\+\)\?"
syn match mimHex         "[+-]\?0[xX]\x\+\([iI]\d\+\)\?"
syn match mimIdx         "\d\+_\d\+"
syn match mimIdx         "\d\+[₀-₉]\+"
syn match mimIdentifier  "[_a-zA-Z][_0-9a-zA-Z]*"
syn match mimKeyword     "plugin"
syn match mimKeyword     "import"
syn match mimKeyword     "as"
syn match mimKeyword     "axm"
syn match mimKeyword     "let"
syn match mimKeyword     "rec"
syn match mimKeyword     "and"
syn match mimKeyword     "ret"
syn match mimKeyword     "lam"
syn match mimKeyword     "con"
syn match mimKeyword     "ccon"
syn match mimKeyword     "cfun"
syn match mimKeyword     "fun"
syn match mimKeyword     "cn"
syn match mimKeyword     "fn"
syn match mimKeyword     "Fn"
syn match mimKeyword     "Cn"
syn match mimKeyword     "Idx"
syn match mimKeyword     "Nat"
syn match mimKeyword     "where"
syn match mimKeyword     "end"
syn match mimI           "I1"
syn match mimI           "I8"
syn match mimI           "I16"
syn match mimI           "I32"
syn match mimI           "I64"
syn match mimi           "i1"
syn match mimiconst      "i8"
syn match mimiconst      "i16"
syn match mimiconst      "i32"
syn match mimiconst      "i64"
syn match mimType        "Idx"
syn match mimType        "Nat"
syn match mimType        "Bool"
syn match mimAxiom       "%[a-zA-Z][a-zA-Z0-9]*"
syn match mimDelim       '<'
syn match mimDelim       '<<'
syn match mimDelim       '>'
syn match mimDelim       '>>'
syn match mimDelim       "«"
syn match mimDelim       "»"
syn match mimBool        "ff"
syn match mimBool        "tt"
syn match mimChar        "'[^']*'" " TODO escape sequences
syn match mimString      '"[^"]*"' " TODO escape sequences

syn region mimComment start='/\*' end=`\*/`
syn region mimComment start='//' end=`$`

let b:current_syntax = "mim"

hi def link mimBool          Boolean
hi def link mimAxiom         Function
hi def link mimIdentifier    Identifier
hi def link mimI             Type
hi def link mimType          Type
"hi def link mimVar           Label
hi def link mimKeyword       Keyword
hi def link mimDelim         Delimiter
hi def link mimBin           Constant
hi def link mimOct           Constant
hi def link mimDec           Constant
hi def link mimHex           Constant
hi def link mimIdx           Constant
hi def link mimiconst        Constant
hi def link mimComment       Comment
hi def link mimChar          Character
hi def link mimString        String
