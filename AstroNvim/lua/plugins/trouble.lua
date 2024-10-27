return {

  "folke/trouble.nvim",
  opts = {
    modes = {
      -- preview_float = {
      --   focus = true,
      --   auto_close = true,
      --   mode = "diagnostics",
      --   preview = {
      --     type = "float",
      --     relative = "editor",
      --     border = "rounded",
      --     title = "Preview",
      --     title_pos = "center",
      --     position = { 2, 0.3 },
      --     size = { width = 1, height = 0.3 },
      --     zindex = 200,
      --   },
      -- },
      -- symbol_float = {
      --   focus = true,
      --   auto_close = true,
      --   mode = "symbols",
      --   preview = {
      --     type = "float",
      --     relative = "editor",
      --     border = "rounded",
      --     title = "Preview",
      --     title_pos = "center",
      --     position = { 2, 0.3 },
      --     size = { width = 0.5, height = 0.3 },
      --     zindex = 200,
      --   },
      -- },

      todo_float = {
        focus = true,
        auto_close = true,
        mode = "todo",
        preview = {
          type = "float",
          relative = "editor",
          border = "rounded",
          title = "Preview",
          title_pos = "center",
          position = { 2, 0.3 },
          size = { width = 1, height = 0.3 },
          zindex = 200,
        },
      },
      -- lsp_toggle_float = {
      --   focus = true,
      --   auto_close = true,
      --   mode = "lsp",
      --   preview = {
      --     type = "float",
      --     relative = "editor",
      --     border = "rounded",
      --     title = "Preview",
      --     title_pos = "center",
      --     position = { 2, 0.3 },
      --     size = { width = 0.5, height = 0.3 },
      --     zindex = 200,
      --   },
      -- },
    },
  },
  cmd = "Trouble",
  keys = {
    -- {
    --   "<leader>te",
    --   "<cmd>Trouble preview_float<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    {
      "<leader>td",
      "<cmd>Trouble todo_float<cr>",
      desc = "TODOS (Trouble)",
    },
    -- {
    --   "<leader>tp",
    --   "<cmd>Trouble preview_float filter.buf=0<cr>",
    --   desc = "Buffer Diagnostics (Trouble)",
    -- },
    -- {
    --   "<leader>ts",
    --   "<cmd>Trouble symbol_float filter.buf=0<cr>",
    --   desc = "Symbols (Trouble)",
    -- },
    -- {
    --   "<leader>lt",
    --   "<cmd>Trouble lsp_toggle_float toggle<cr>",
    --   desc = "LSP Definitions / references / ... (Trouble)",
    -- },
  },
}
