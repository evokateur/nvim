return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        -- https://github.com/LazyVim/LazyVim/discussions/4094#discussioncomment-15525364
        prepend_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
