-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- :tnoremap <Esc> <C-\><C-n>
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- :vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vim.keymap.set("v", "<C-r>", [["hy:%s/<C-r>h//gc<left><left><left>]], { noremap = true })

-- :map <F3> :noh<CR>
vim.keymap.set("", "<F3>", ":noh<CR>", { noremap = true })

-- :map <C-W><C-W> :%s/\s\+$//<CR>
vim.keymap.set("", "<C-W><C-W>", ":%s/\\s\\+$//<CR>", { noremap = true })
