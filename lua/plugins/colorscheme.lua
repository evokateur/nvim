local function mac_light_mode()
  if vim.uv.os_uname().sysname ~= "Darwin" then
    return false
  end
  local r = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local s
  if r then
    s = r:read("*l")
    r:close()
  end
  return s ~= "Dark"
end

local _override = nil -- "dark" | "light" | nil (nil = follow OS)

local function apply_dark()
  vim.o.background = "dark"
  vim.cmd.colorscheme("nightfox")
end

local function apply_light()
  vim.o.background = "light"
  vim.cmd.colorscheme("catppuccin-latte")
end

local function apply_theme()
  local light = _override ~= nil and (_override == "light") or mac_light_mode()
  if light then
    apply_light()
  else
    apply_dark()
  end
end

local function toggle_theme()
  local currently_light = vim.o.background == "light"
  if currently_light then
    _override = "dark"
    apply_dark()
  else
    _override = "light"
    apply_light()
  end
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "latte",
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({})
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = apply_theme,
      })
      vim.api.nvim_create_autocmd("FocusGained", { callback = apply_theme })
      vim.keymap.set("n", "<leader>td", toggle_theme, { desc = "Toggle dark/light theme" })
    end,
  },
}
