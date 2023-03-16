return {
  {
    "derekwyatt/vim-fswitch",
    ft = { "c", "cpp", "objc", "objcpp" },
    keys =
    {
      -- TODO: C-z doesn't work with alacritty. :(
      { "<C-z>", ":FSHere<CR>", desc = "Swap between header/source", silent = true },
    },
    config = function()
      vim.g.fsnonewfiles = "on"
      vim.g.c_no_curly_error = 1
    end
  }
}
