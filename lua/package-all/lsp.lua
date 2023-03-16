local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
local function words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
end

return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      {
        "L3MON4D3/LuaSnip",
        version = "<CurrentMajor>.*",
        --build = "make install_jsregexp"
      },
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, prefix = "●" },
        severity_sort = true,
      },
      -- Automatically format on save
      autoformat = true,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
    servers = {
      jsonls = {},
      lua_ls = {
        mason = false,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      clojure_lsp = {},
      clangd = {},
    },
    config = function()
      require('lspconfig').clojure_lsp.setup{}

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local opts = { noremap=true, silent=true }
      vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(_client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      end

      local lspconfig = require('lspconfig')
      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          compilationDatabaseDirectory = "build";
          index = {
            threads = 0;
          };
          clang = {
            excludeArgs = {};
          };
        }
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  -- Linting
  { 'dense-analysis/ale' },
  -- Syncing ALE with nvim-lsp
  { 'rhysd/vim-lsp-ale' },

  ---- lspconfig
  --{
  --  "neovim/nvim-lspconfig",
  --  event = { "BufReadPre", "BufNewFile" },
  --  dependencies = {
  --    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
  --    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
  --    "mason.nvim",
  --    "williamboman/mason-lspconfig.nvim",
  --    {
  --      "hrsh7th/cmp-nvim-lsp",
  --      cond = function()
  --        return require("config.util").has("nvim-cmp")
  --      end,
  --    },
  --  },
  --  ---@class PluginLspOpts
  --  opts = {
  --    -- options for vim.diagnostic.config()
  --    diagnostics = {
  --      underline = true,
  --      update_in_insert = false,
  --      virtual_text = { spacing = 2, prefix = "●" },
  --      severity_sort = true,
  --    },
  --    -- Automatically format on save
  --    autoformat = true,
  --    -- options for vim.lsp.buf.format
  --    -- `bufnr` and `filter` is handled by the LazyVim formatter,
  --    -- but can be also overridden when specified
  --    format = {
  --      formatting_options = nil,
  --      timeout_ms = nil,
  --    },
  --    -- LSP Server Settings
  --    ---@type lspconfig.options
  --    servers = {
  --      jsonls = {},
  --      lua_ls = {
  --        -- mason = false, -- set to false if you don't want this server to be installed with mason
  --        settings = {
  --          Lua = {
  --            workspace = {
  --              checkThirdParty = false,
  --            },
  --            completion = {
  --              callSnippet = "Replace",
  --            },
  --          },
  --        },
  --      },
  --      clojure_lsp = {},
  --      clangd = {},
  --    },
  --    -- you can do any additional lsp server setup here
  --    -- return true if you don't want this server to be setup with lspconfig
  --    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
  --    setup = {
  --      -- example to setup with typescript.nvim
  --      -- tsserver = function(_, opts)
  --      --   require("typescript").setup({ server = opts })
  --      --   return true
  --      -- end,
  --      -- Specify * to use this function as a fallback for any server
  --      -- ["*"] = function(server, opts) end,
  --    },
  --  },
  --  ---@param opts PluginLspOpts
  --  config = function(plugin, opts)
  --    -- diagnostics
  --    for name, icon in pairs(require("config").icons.diagnostics) do
  --      name = "DiagnosticSign" .. name
  --      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  --    end
  --    vim.diagnostic.config(opts.diagnostics)

  --    local servers = opts.servers
  --    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  --    local function setup(server)
  --      local server_opts = vim.tbl_deep_extend("force", {
  --        capabilities = vim.deepcopy(capabilities),
  --      }, servers[server] or {})

  --      if opts.setup[server] then
  --        if opts.setup[server](server, server_opts) then
  --          return
  --        end
  --      elseif opts.setup["*"] then
  --        if opts.setup["*"](server, server_opts) then
  --          return
  --        end
  --      end
  --      require("lspconfig")[server].setup(server_opts)
  --    end

  --    -- temp fix for lspconfig rename
  --    -- https://github.com/neovim/nvim-lspconfig/pull/2439
  --    local mappings = require("mason-lspconfig.mappings.server")
  --    if not mappings.lspconfig_to_package.lua_ls then
  --      mappings.lspconfig_to_package.lua_ls = "lua-language-server"
  --      mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
  --    end

  --    local mlsp = require("mason-lspconfig")
  --    local available = mlsp.get_available_servers()

  --    local ensure_installed = {} ---@type string[]
  --    for server, server_opts in pairs(servers) do
  --      if server_opts then
  --        server_opts = server_opts == true and {} or server_opts
  --        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
  --        if server_opts.mason == false or not vim.tbl_contains(available, server) then
  --          setup(server)
  --        else
  --          ensure_installed[#ensure_installed + 1] = server
  --        end
  --      end
  --    end

  --    require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
  --    require("mason-lspconfig").setup_handlers({ setup })
  --  end,
  --},

  ---- formatters
  --{
  --  "jose-elias-alvarez/null-ls.nvim",
  --  event = { "BufReadPre", "BufNewFile" },
  --  dependencies = { "mason.nvim" },
  --  opts = function()
  --    local nls = require("null-ls")
  --    return {
  --      sources = {
  --        nls.builtins.diagnostics.clj_kondo,
  --        nls.builtins.diagnostics.cmake_lint,
  --        nls.builtins.diagnostics.jsonlint,
  --        nls.builtins.diagnostics.markdownlint,
  --        nls.builtins.diagnostics.shellcheck,
  --      },
  --    }
  --  end,
  --},

  ---- cmdline tools and lsp servers
  --{
  --  "williamboman/mason.nvim",
  --  cmd = "Mason",
  --  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  --  opts = {
  --    ensure_installed = {
  --      "shellcheck",
  --      "clojure-lsp",
  --      "clangd"
  --    },
  --  },
  --  ---@param opts MasonSettings | {ensure_installed: string[]}
  --  config = function(plugin, opts)
  --    require("mason").setup(opts)
  --    local mr = require("mason-registry")
  --    for _, tool in ipairs(opts.ensure_installed) do
  --      local p = mr.get_package(tool)
  --      if not p:is_installed() then
  --        p:install()
  --      end
  --    end
  --  end,
  --},
}
