return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_a = {}, -- leftmost
      lualine_b = {}, -- left-center
      lualine_c = { -- center
        function()
          return require("codex").status()
        end,
      },
      lualine_x = {}, -- right-center
      lualine_y = {}, -- right
      lualine_z = {}, -- rightmost
    },
  },
}
