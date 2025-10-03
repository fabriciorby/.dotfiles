(import-macros {: g!} :hibiscus.vim)

; Set <space> as the leader key
; See `:help mapleader`
;  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
(g! :mapleader " ")
(g! :maplocalleader " ")

; Set to true if you have a Nerd Font installed and selected in the terminal
(g! :have_nerd_font true)
