(import-macros {: map!} :hibiscus.vim)
; [[ Basic Keymaps ]]
;  See `:help map!()`

; Clear highlights on search when pressing <Esc> in normal mode
;  See `:help hlsearch`
(map! [:n] :<Esc> :<cmd>nohlsearch<CR>)

; Diagnostic keymaps
(map! [:n] :<leader>q vim.diagnostic.setloclist "Open diagnostic [Q]uickfix list")

; Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
; for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
; is not what someone will guess without a bit more experience.
;
; NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
; or just use <C-\><C-n> to exit terminal mode
(map! [:t] :<Esc><Esc> "<C-\\><C-n>" "Exit terminal mode")

; Keybinds to make split navigation easier.
;  Use CTRL+<hjkl> to switch between windows
;
;  See `:help wincmd` for a list of all window commands
(map! [:n] :<C-h> :<C-w><C-h> "Move focus to the left window")
(map! [:n] :<C-l> :<C-w><C-l> "Move focus to the right window")
(map! [:n] :<C-j> :<C-w><C-j> "Move focus to the lower window")
(map! [:n] :<C-k> :<C-w><C-k> "Move focus to the upper window")

; NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
(map! [:n] :<C-S-h> :<C-w>H "Move window to the left")
(map! [:n] :<C-S-l> :<C-w>L "Move window to the right")
(map! [:n] :<C-S-j> :<C-w>J "Move window to the lower")
(map! [:n] :<C-S-k> :<C-w>K "Move window to the upper")	
