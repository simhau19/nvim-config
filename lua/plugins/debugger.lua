return {
  {
    'mfussenegger/nvim-dap',
    config = function(_, _)
      local dap = require 'dap'
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Start or continue debugger' })
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start or continue debugger' })
      vim.keymap.set('n', '<leader>dp', dap.pause, { desc = 'Pause execution' })
      vim.keymap.set('n', '<leader>dr', dap.continue, { desc = 'Restart debugger session' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate debugging session' })
      vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step Into' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Step Out' })
      vim.keymap.set('n', '<leader>du', dap.up, { desc = 'Stacktrace move up' })
      vim.keymap.set('n', '<leader>dd', dap.down, { desc = 'Stacktrace move down' })

      dap.adapters.codelldb_sudo = {
        type = 'executable',
        command = 'sudo',
        args = { '-A', vim.fn.stdpath 'data' .. '/mason/bin/codelldb' },
      }
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = { handlers = {} },
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()
      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      -- dap.listeners.before.event_exited.dapui_config = dapui.close
      vim.keymap.set('n', '<leader>td', dapui.toggle, { desc = 'Toggle debugging view' })
    end,
  },
  {
    'jedrzejboczar/nvim-dap-cortex-debug',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    opts = {},
    config = function(_, opts)
      local cortex_debug = require 'dap-cortex-debug'
      local dap = require 'dap'
      local cmake = require 'cmake-tools'
      cortex_debug.setup(opts)
      print 'woohoo'
      for _, lang in ipairs { 'c', 'cpp' } do
        dap.configurations[lang] = dap.configurations[lang] or {}

        table.insert(
          dap.configurations[lang],
          cortex_debug.openocd_config {
            name = 'Debug with OpenOCD',
            cwd = '${workspaceFolder}',
            executable = function()
              return cmake.get_launch_target_path()
            end,
            configFiles = { 'interface/cmsis-dap.cfg', 'target/atsamv.cfg' },
            gdbTarget = 'localhost:50000',
            showDevDebugOutput = false,
          }
        )
      end
    end,
  },
}
