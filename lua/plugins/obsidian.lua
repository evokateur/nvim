return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  cmd = "Obsidian",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    legacy_commands = false,
    frontmatter = { enabled = false },
    checkbox = {
      create_new = false,
      order = { " ", "x" },
    },
    workspaces = {
      {
        name = "caveau",
        path = vim.env.VAULT_PATH,
      },
    },
    templates = {
      folder = "areas/computing/obsidian/templates",
      date_format = "%Y-%m-%d",
      time_format = "%H%M",
      substitutions = {
        jour = function()
          local d = os.date("%A") --[[@as string]]
          return d:lower()
        end,
        jr = function()
          local d = os.date("%a") --[[@as string]]
          return d:lower()
        end,
      },
    },
    daily_notes = {
      enabled = true,
      folder = "areas/l-invention-du-quotidien",
      template = "l-invention-du-quotidien.md",
      date_format = "%Y/%m/semaine-%V/%d-%B",
    },
    -- see below for full list of options 👇
  },
}
