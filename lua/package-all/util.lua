return {
  -- Library used by other plugins.
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Makes some plugins dot-repeatable like leap.
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- Speeds vim up when editing huge file.
  {
    "vim-scripts/LargeFile",
    init = function()
      vim.g.LargeFile = 0.3
    end,
  },
}
