local fold_text_handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d lines '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

return {
  -- Better `vim.notify()`
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      background_colour = "#000000",
      max_height = function()
        return math.floor(vim.o.lines * 0.33)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.33)
      end,
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      local Util = require("config.util")
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },

  -- better vim.ui
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filename", path = 1, symbols = { modified = "", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant") ,
            },
            { "filetype", icon_only = false, separator = "", },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = { "neo-tree" },
      }
    end,
  },

  -- indent guides for Neovim
  --{
  --  "lukas-reineke/indent-blankline.nvim",
  --  event = { "BufReadPost", "BufNewFile" },
  --  opts = {
  --    -- char = "▏",
  --    char = "│",
  --    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
  --    show_trailing_blankline_indent = false,
  --    show_current_context = true,
  --  },
  --},

  -- active indent guide and indent text objects
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  -- noicer ui
  -- TODO: Broken shit, yo.
  --{
  --  "folke/noice.nvim",
  --  event = "VeryLazy",
  --  opts = {
  --    lsp = {
  --      override = {
  --        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --        ["vim.lsp.util.stylize_markdown"] = true,
  --      },
  --    },
  --    presets = {
  --      bottom_search = true,
  --      command_palette = true,
  --      long_message_to_split = true,
  --    },
  --  },
  --  -- stylua: ignore
  --  keys = {
  --    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
  --    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
  --    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
  --    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
  --    --{ "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
  --    --{ "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  --  },
  --},

  -- lsp symbol navigation for lualine
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      --vim.g.navic_silence = true
      require("config.util").on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = ".",
        highlight = false,
        depth_limit = 5,
        --icons = require("config").icons.kinds,
        icons = {
          File          = "",
          Module        = "",
          Namespace     = "",
          Package       = "",
          Class         = "",
          Method        = "",
          Property      = "",
          Field         = "",
          Constructor   = "",
          Enum          = "",
          Interface     = "",
          Function      = "",
          Variable      = "",
          Constant      = "",
          String        = "",
          Number        = "",
          Boolean       = "",
          Array         = "",
          Object        = "",
          Key           = "",
          Null          = "",
          EnumMember    = "",
          Struct        = "",
          Event         = "",
          Operator      = "",
          TypeParameter = "",
        },
      }
    end,
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  -- Doesn't properly detect the headings to fold. Maybe it's tripped up
  -- by some of the things I have.
  --{ "masukomi/vim-markdown-folding" },

  -- UFO folding
  -- Collapses pretty well, but gets into buggy states where I can't leave normal
  -- mode without it collapsing everything again. Very tough to get working for
  -- only markdown.
  --{
  --  "kevinhwang91/nvim-ufo",
  --  lazy = false,
  --  dependencies = {
  --    "kevinhwang91/promise-async",
  --    {
  --      "luukvbaal/statuscol.nvim",
  --      config = function()
  --        local builtin = require("statuscol.builtin")
  --        require("statuscol").setup({
  --          relculright = true,
  --          ft_ignore = { "NeogitStatus", "c", "cpp" },
  --          segments = {
  --            { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --            { text = { "%s" }, click = "v:lua.ScSa" },
  --            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  --          },
  --        })
  --      end,
  --    },
  --  },
  --  event = "BufReadPost",
  --  opts = {
  --    provider_selector = function()
  --      return { "treesitter", "indent" }
  --    end,
  --    fold_virt_text_handler = fold_text_handler
  --  },

  --  init = function()
  --    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  --    vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)

  --    vim.api.nvim_create_autocmd('FileType', {
  --      pattern = { 'NeogitStatus', "c", "cpp" },
  --      callback = function()
  --        require('ufo').detach()
  --        vim.opt_local.foldenable = false
  --        vim.opt_local.foldcolumn = '0'
  --      end,
  --    })
  --  end,
  --},
}
