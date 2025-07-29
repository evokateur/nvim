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

vim.keymap.set("n", "<F2>", function()
  Snacks.explorer()
end, { desc = "Toggle Snacks Explorer" })

vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })

vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
vim.keymap.set(
  "n",
  "<localleader>os",
  ":noautocmd MoltenEnterOutput<CR>",
  { desc = "open output window", silent = true }
)

vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
vim.keymap.set(
  "v",
  "<localleader>r",
  ":<C-u>MoltenEvaluateVisual<CR>gv",
  { desc = "execute visual selection", silent = true }
)
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

-- if you work with html outputs:
vim.keymap.set("n", "<localleader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
