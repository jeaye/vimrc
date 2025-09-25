return {
  -- Library used by other plugins.
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Makes some plugins dot-repeatable like leap.
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- Provides easy file deletion and renaming.
  { "tpope/vim-eunuch", event = "VeryLazy" },

  { "mbbill/undotree" }
}
