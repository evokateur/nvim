local function mac_light_mode()
  if vim.uv.os_uname().sysname ~= "Darwin" then return false end
  local r = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local s = r:read("*l")
  r:close()
  return s ~= "Dark"
end

local function apply_theme()
  if not mac_light_mode() then
    vim.o.background = "dark"
    vim.cmd.colorscheme("nightfox")
  else
    vim.o.background = "light"
    vim.cmd.colorscheme("dayfox")
  end
end

return {
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
    end,
  },
}
