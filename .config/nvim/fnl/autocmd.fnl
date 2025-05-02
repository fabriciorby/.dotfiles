(require-macros :hibiscus.vim)

; [[ Basic Autocommands ]]
;  See `:help lua-guide-autocommands`
;
; Highlight when yanking (copying) text
;  Try it with `yap` in normal mode
;  See `:help vim.highlight.on_yank()`

(augroup! :highlight-yank
  [[TextYankPost :desc "Highlight when yanking (copying) text"]
   * #(vim.highlight.on_yank {:timeout 80})])

