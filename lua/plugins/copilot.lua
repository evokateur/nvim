-- Copilot loads disabled: no completions until ":Copilot enable" this session.
return {
  "zbirenbaum/copilot.lua",
  config = function(_, opts)
    require("copilot").setup(opts)
    require("copilot.command").disable()
  end,
}
