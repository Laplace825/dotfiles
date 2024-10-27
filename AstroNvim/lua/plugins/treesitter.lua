-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "cpp",
      "html",
      "python",
      "javascript",
      "rust",
      "go",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
