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

(local start-jdtls
  (fn []
    (local project-name (vim.fn.fnamemodify (vim.fn.getcwd) ":p:h:t"))
    (local workspace-dir (.. (vim.fn.expand "~/.local/share/nvim/workspace/") project-name))
    (local config
           {:cmd [:/Users/fabriciorby/.jenv/versions/21/bin/java
                  :-Declipse.application=org.eclipse.jdt.ls.core.id1
                  :-Dosgi.bundles.defaultStartLevel=4
                  :-Declipse.product=org.eclipse.jdt.ls.core.product
                  :-Dlog.protocol=true
                  :-Dlog.level=ALL
                  :-Xmx1g
                  :--add-modules=ALL-SYSTEM
                  :--add-opens
                  :java.base/java.util=ALL-UNNAMED
                  :--add-opens
                  :java.base/java.lang=ALL-UNNAMED
                  :-jar
                  :/Users/fabriciorby/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar
                  :-configuration
                  :/Users/fabriciorby/.local/share/nvim/mason/packages/jdtls/config_mac_arm/
                  :-data
                  workspace-dir]
            :init_options {:bundles {}}
            :root_dir ((. (require :jdtls.setup) :find_root) [:.git :mvnw :gradlew])
            :settings {:java {}}})
    ((. (require :jdtls) :start_or_attach) config)))

;; autocmd para Java
(vim.api.nvim_create_autocmd "FileType"
  {:pattern "java"
   :callback start-jdtls})
