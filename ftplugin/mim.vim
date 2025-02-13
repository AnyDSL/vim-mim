if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

set iskeyword+=\

iabbrev \to →
iabbrev -> →
iabbrev \lam λ
" iabbrev \< ‹
" iabbrev \> ›
iabbrev \< ⟨
iabbrev \> ⟩
iabbrev \{ ⦃
iabbrev \} ⦄
