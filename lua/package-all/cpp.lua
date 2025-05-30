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
      --vim.g.fsnonewfiles = "on"
      vim.g.c_no_curly_error = 1
    end
  },
  {
    "octol/vim-cpp-enhanced-highlight"
  },

  --{
  --  "puremourning/vimspector",
  --  config = function()
  --    vim.cmd([[
  --      let g:vimspector_enable_mappings = 'HUMAN'
  --      nnoremap <Leader>dl :call vimspector#Launch()<CR>
  --      nnoremap <Leader>dr :call vimspector#Reset()<CR>
  --      nnoremap <Leader>dc :call vimspector#Continue()<CR>

  --      nnoremap <Leader>db :call vimspector#ToggleBreakpoint()<CR>
  --      nnoremap <Leader>dB :call vimspector#ClearBreakpoints()<CR>

  --      " nmap <Leader>dr <Plug>VimspectorRestart
  --      nmap <Leader>do <Plug>VimspectorStepOut
  --      nmap <Leader>di <Plug>VimspectorStepInto
  --      nmap <Leader>dn <Plug>VimspectorStepOver
  --      ]])
  --  end
  --}

  --{
  --  "rcarriga/nvim-dap-ui",
  --  dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
  --  config = function()
  --    local dap = require("dap")
  --    dap.adapters.gdb = {
  --      type = "executable",
  --      command = "gdb",
  --      args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
  --    }
  --    dap.adapters.codelldb = {
  --      type = "server",
  --      port = "${port}",
  --      executable = {
  --        command = "codelldb",
  --        args = { "--port", "${port}" },
  --      },
  --    }
  --    dap.configurations.cpp = {
  --      --{
  --      --  name = "Launch an executable",
  --      --  type = "gdb",
  --      --  request = "launch",
  --      --  cwd = "${workspaceFolder}",
  --      --  program = function()
  --      --    return coroutine.create(function(coro)
  --      --      local opts = {}
  --      --      pickers
  --      --      .new(opts, {
  --      --        prompt_title = "Path to executable",
  --      --        finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
  --      --        sorter = conf.generic_sorter(opts),
  --      --        attach_mappings = function(buffer_number)
  --      --          actions.select_default:replace(function()
  --      --            actions.close(buffer_number)
  --      --            coroutine.resume(coro, action_state.get_selected_entry()[1])
  --      --          end)
  --      --          return true
  --      --        end,
  --      --      })
  --      --      :find()
  --      --    end)
  --      --  end,
  --      --},
  --    }
  --    local dapui = require("dapui")
  --    dap.listeners.after.event_initialized["dapui_config"]=function()
  --      dapui.open()
  --    end
  --    dap.listeners.before.event_terminated["dapui_config"]=function()
  --      dapui.close()
  --    end
  --    dap.listeners.before.event_exited["dapui_config"]=function()
  --      dapui.close()
  --    end
  --    dap.set_log_level('DEBUG')

  --    -- Nicer looking breakpoints.
  --    vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
  --    vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

  --    local n = "n"
  --    vim.keymap.set(n, '<leader>dk', function() require('dap').continue() end)
  --    vim.keymap.set(n, '<leader>di', function() require('dap').step_into() end)
  --    vim.keymap.set(n, '<leader>do', function() require('dap').step_out() end)
  --    vim.keymap.set(n, '<leader>dl', function() require('dap').run_last() end)
  --    vim.keymap.set(n, '<leader>db', function() require('dap').toggle_breakpoint() end)
  --    vim.keymap.set(n, '<leader>dr', function() require('dap').repl_open() end)
  --    vim.keymap.set(n, '<leader>du', function() require('dapui').toggle() end)
  --  end
  --},
  --{
  --  "theHamsta/nvim-dap-virtual-text",
  --  opts = {
  --    commented = true
  --  }
  --}
}
