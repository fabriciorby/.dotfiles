(local M {})

(fn M.setup []
    (local project-name (vim.fn.fnamemodify (vim.fn.getcwd) ":p:h:t"))
    (local workspace-dir (.. (vim.fn.expand "~/.local/share/nvim/workspace/") project-name))
    (local java-dir (vim.fn.expand "~/.jenv/versions/21/bin/java"))
    (local jdtls-launcher (vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"))
    (local jdtls-config (vim.fn.expand "~/.local/share/nvim/mason/packages/jdtls/config_mac_arm/"))
    (local config
           {:cmd [java-dir
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
                  jdtls-launcher
                  :-configuration
                  jdtls-config
                  :-data workspace-dir]
            :init_options {:bundles {}}
            :root_dir ((. (require :jdtls.setup) :find_root) [:.git :mvnw :gradlew])
            :settings {:java {}}})
    ((. (require :jdtls) :start_or_attach) config))

M
