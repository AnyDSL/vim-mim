if exists("b:current_syntax")
    finish
endif

syn match mimBin         "[+-]\?0[bB][01]\+\([iI]\d\+\)\?"
syn match mimOct         "[+-]\?0[oO]\o\+\([iI]\d\+\)\?"
syn match mimDec         "[+-]\?\d\+\([iI]\d\+\)\?"
syn match mimHex         "[+-]\?0[xX]\x\+\([iI]\d\+\)\?"
syn match mimIdx         "\d\+_\d\+"
syn match mimIdx         "\d\+[₀-₉]\+"
syn match mimKeyword     "\.[a-zA-Z0-9_]\+"
syn match mimAxiom       "%[a-zA-Z][a-zA-Z0-9]*"
syn match mimIdentifier  "[_a-zA-Z][_0-9a-zA-Z]*"
syn match mimDelim       '<'
syn match mimDelim       '<<'
syn match mimDelim       '>'
syn match mimDelim       '>>'
syn match mimDelim       "«"
syn match mimDelim       "»"
syn match mimBool        ".ff"
syn match mimBool        ".tt"
syn match mimChar        "'[^']*'" " TODO escape sequences
syn match mimString      '"[^"]*"' " TODO escape sequences

syn region mimComment start='/\*' end=`\*/`
syn region mimComment start='//' end=`$`

let b:current_syntax = "mim"

hi def link mimBool          Boolean
hi def link mimAxiom         Function
hi def link mimIdentifier    Identifier
"hi def link mimVar           Label
hi def link mimKeyword       Keyword
hi def link mimDelim         Delimiter
hi def link mimBin           Constant
hi def link mimOct           Constant
hi def link mimDec           Constant
hi def link mimHex           Constant
hi def link mimIdx           Constant
hi def link mimComment       Comment
hi def link mimChar          Character
hi def link mimString        String
