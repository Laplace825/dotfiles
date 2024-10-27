return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      PERF = {
        alt = { "pefr", "param", "return", "PARAM" },
      },
      FIX = {
        alt = { "FIXME", "BUG", "fix" },
      },
      TODO = {
        alt = { "todo" },
      },
      WARN = {
        alt = { "warn" },
      },
      NOTE = {
        alt = { "note", "brief", "example", "file" },
      },
      TEST = {
        icon = "𐰬",
        alt = { "test" },
      },
    },
    highlight = {
      keyword = "wide_fg",
      after = "",
    }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
