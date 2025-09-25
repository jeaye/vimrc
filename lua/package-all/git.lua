return {
  {
    "tpope/vim-fugitive"
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      --"ibhagwan/fzf-lua",              -- optional
      --"echasnovski/mini.pick",         -- optional
      --"folke/snacks.nvim",             -- optional
    },
    opts =
    {
      integrations =
      {
        diffview = true,
      },
    },
  }
  --{
  --  "TimUntersberger/neogit",
  --  dependencies =
  --  {
  --    "nvim-lua/plenary.nvim",
  --    "sindrets/diffview.nvim",
  --  },
  --  opts =
  --  {
  --    integrations =
  --    {
  --      diffview = true,
  --    },
  --  },
  --  config = function()
  --    -- TODO: Look into why this doesn't work.
  --    vim.cmd([[
  --      "hi def NeogitDiffAddHighlight guibg=#404040 guifg=#859900
  --      hi! link NeogitDiffAddHighlight GruvboxGreen
  --      "hi def NeogitDiffDeleteHighlight guibg=#404040 guifg=#dc322f
  --      hi! link NeogitDiffDeleteHighlight GruvboxRed
  --      "hi def NeogitDiffContextHighlight guibg=#333333 guifg=#b2b2b2
  --      "hi def NeogitHunkHeader guifg=#cccccc guibg=#404040
  --      "hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d
  --    ]])
  --  end
  --},
}
