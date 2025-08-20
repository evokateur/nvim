return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_auto_open_output = false -- requires setting keybind for `:noautocmd MoltenEnterOutput`
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true -- Output as virtual text. Allows outputs to always be shown, works with images, but can be buggy with longer images
      vim.g.molten_virt_lines_off_by_1 = true -- make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_enter_output_behavior = "open_and_enter"
    end,
  },
}
