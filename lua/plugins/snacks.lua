return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      include = { "*.local.*", "*.override.*" },
      sources = {
        explorer = {
          actions = {
            git_restore = function(picker, item)
              if item.dir then
                vim.notify("Cannot restore a directory", vim.log.levels.WARN)
                return
              end

              local check = vim.system({ "git", "diff", "--quiet", "--", item.file }, { text = true }):wait()
              if check.code == 0 then
                vim.notify("No unstaged changes", vim.log.levels.INFO)
                return
              end

              local choice = vim.fn.confirm(("Discard all changes to %s?"):format(item.file), "&Yes\n&No", 2)

              if choice ~= 1 then
                return
              end

              local result = vim.system({ "git", "restore", "--", item.file }, { text = true }):wait()

              if result.code ~= 0 then
                vim.notify(result.stderr or "git restore failed", vim.log.levels.ERROR)
                return
              end

              local bufnr = vim.fn.bufnr(item.file)
              if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
                vim.api.nvim_buf_call(bufnr, function()
                  vim.cmd("edit!")
                end)
              end

              picker:action("explorer_update")
            end,
          },

          win = {
            list = {
              keys = {
                ["gr"] = "git_restore",
              },
            },
          },
        },
      },
    },
  },
}
