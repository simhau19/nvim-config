return {
  {
    'mfussenegger/nvim-dap',
    config = function(_, _)
      local dap = require 'dap'
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
      vim.keymap.set('n', '<leader>dr', dap.continue, { desc = 'Start or continue debugger' })
      vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start or continue debugger' })
      vim.keymap.set('n', '<leader>dp', dap.pause, { desc = 'Pause execution' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate debugging session' })
      vim.keymap.set('n', '<leader>ds', dap.step_over, { desc = 'Step Over' })

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
}
