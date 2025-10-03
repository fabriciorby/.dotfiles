(import-macros {: augroup!} :hibiscus.vim)

; [[ Basic Autocommands ]]
;  See `:help lua-guide-autocommands`
;
; Highlight when yanking (copying) text
;  Try it with `yap` in normal mode
;  See `:help vim.highlight.on_yank()`

(augroup! :highlight-yank
  [["TextYankPost" :desc "Highlight when yanking (copying) text"]
   * #(vim.highlight.on_yank {:timeout 80})])

; Java
(vim.api.nvim_create_autocmd "FileType"
  {:pattern "java"
   :callback (. (require "jdtls.jdtls_setup") :setup)})

