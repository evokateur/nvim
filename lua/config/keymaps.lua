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

vim.g["diagnostics_active"] = true
function toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end

vim.keymap.set(
  "n",
  "<leader>xd",
  toggle_diagnostics,
  { noremap = true, silent = true, desc = "Toggle Diagnostics" }
)
