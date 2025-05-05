; [[ Install `lazy.nvim` plugin manager ]]
;    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
(let [url  "https://github.com/folke/lazy.nvim"
      path (.. (vim.fn.stdpath :data) "/lazy/lazy.nvim") ]
  (when (= 0 (vim.fn.isdirectory path))
     (print "lazy.nvim: installing in data dir...")
     (let [out (vim.fn.system [:git :clone "--filter=blob:none" "--branch=stable" url path])]
       (if (not= vim.v.shell_error 0)
         (error (.. "Error cloning lazy.nvim:\n" out))
         (print "lazy.nvim: installed"))))
  (vim.opt.rtp:prepend path))
