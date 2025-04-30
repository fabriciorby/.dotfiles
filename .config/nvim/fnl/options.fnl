(require-macros :hibiscus.vim)

; [[ Setting options ]]
; See `:help vim.opt`
; NOTE: You can change these options as you wish!
;  For more options, you can see `:help option-list`

; Make line numbers default
(set vim.opt.number true)
; You can also add relative line numbers, to help with jumping.
;  Experiment for yourself to see if you like it!
(set vim.opt.relativenumber true)

; Enable mouse mode, can be useful for resizing splits for example!
(set vim.opt.mouse :a)

; Don't show the mode, since it's already in the status line
(set vim.opt.showmode false)

; Sync clipboard between OS and Neovim.
;  Schedule the setting after `UiEnter` because it can increase startup-time.
;  Remove this option if you want your OS clipboard to remain independent.
;  See `:help 'clipboard'`
(vim.schedule (fn [] (set vim.opt.clipboard :unnamedplus)))

; Enable break indent
(set vim.opt.breakindent true)

; Save undo history
(set vim.opt.undofile true)

; Case-insensitive searching UNLESS \C or one or more capital letters in the search term
(set vim.opt.ignorecase true)
(set vim.opt.smartcase true)

; Keep signcolumn on by default
(set vim.opt.signcolumn :yes)

; Decrease update time
(set vim.opt.updatetime 250)

; Decrease mapped sequence wait time
(set vim.opt.timeoutlen 300)

; Configure how new splits should be opened
(set vim.opt.splitright true)
(set vim.opt.splitbelow true)

; Sets how neovim will display certain whitespace characters in the editor.
;  See `:help 'list'`
;  and `:help 'listchars'`
(set vim.opt.list true)
(set vim.opt.listchars {:nbsp "␣" :tab "» " :trail "·"})

; Preview substitutions live, as you type!
(set vim.opt.inccommand :split)

; Show which line your cursor is on
(set vim.opt.cursorline true)

; Minimal number of screen lines to keep above and below the cursor.
(set vim.opt.scrolloff 10)

; if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
; instead raise a dialog asking if you wish to save the current file(s)
; See `:help 'confirm'`
(set vim.opt.confirm true)

