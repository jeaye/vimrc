return {
  { "preservim/vim-markdown" },
  {
    "godlygeek/tabular",
    dependencies = { "preservim/vim-markdown" },
    ft = { "markdown" },
  },
  {
    "jghauser/follow-md-links.nvim",
    ft = { "markdown" },
  },
}
