(require-macros :hibiscus.vim)

; [[ Setting options ]]
; See `:help 
; NOTE: You can change these options as you wish!
;  For more options, you can see `:help option-list`

; Make line numbers default
(set! number true)
; You can also add relative line numbers, to help with jumping.
;  Experiment for yourself to see if you like it!
(set! relativenumber true)

; Enable mouse mode, can be useful for resizing splits for example!
(set! mouse :a)

; Don't show the mode, since it's already in the status line
(set! showmode false)

; Sync clipboard between OS and Neovim.
;  Schedule the setting after `UiEnter` because it can increase startup-time.
;  Remove this option if you want your OS clipboard to remain independent.
;  See `:help 'clipboard'`
(vim.schedule (fn [] (set! clipboard :unnamedplus)))

; Enable break indent
(set! breakindent true)

; Save undo history
(set! undofile true)

; Case-insensitive searching UNLESS \C or one or more capital letters in the search term
(set! ignorecase true)
(set! smartcase true)

; Keep signcolumn on by default
(set! signcolumn :yes)

; Decrease update time
(set! updatetime 250)

; Decrease mapped sequence wait time
(set! timeoutlen 300)

; Configure how new splits should be opened
(set! splitright true)
(set! splitbelow true)

; Sets how neovim will display certain whitespace characters in the editor.
;  See `:help 'list'`
;  and `:help 'listchars'`
(set! list true)
(set! listchars {:nbsp "␣" :tab "» " :trail "·"})

; Preview substitutions live, as you type!
(set! inccommand :split)

; Show which line your cursor is on
(set! cursorline true)

; Minimal number of screen lines to keep above and below the cursor.
(set! scrolloff 10)

; if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
; instead raise a dialog asking if you wish to save the current file(s)
; See `:help 'confirm'`
(set! confirm true)

