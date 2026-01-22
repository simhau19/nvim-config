return {
  -- Collection of various small independent plugins/modules
  'nvim-mini/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    --Split / Join arguments
    require('mini.splitjoin').setup()

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    require('mini.files').setup()

    vim.keymap.set({ 'n', 'v' }, '<leader>-', function()
      MiniFiles.open()
    end, { desc = 'Open file explorer' })

    vim.keymap.set({ 'n', 'v' }, '<leader>_', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    end, { desc = 'Open file explorer' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id

        -- Tweak left-hand side of mapping to your liking

        vim.keymap.set('n', '<Right>', function()
          MiniFiles.go_in { close_on_file = false }
        end, { buffer = buf_id })

        vim.keymap.set('n', '<CR>', function()
          MiniFiles.go_in { close_on_file = true }
        end, { buffer = buf_id })

        vim.keymap.set('n', '<Left>', function()
          MiniFiles.go_out()
        end, { buffer = buf_id })

        vim.keymap.set('n', '<Esc>', function()
          MiniFiles.close()
        end, { buffer = buf_id })

        -- Set focused directory as current working directory
        vim.keymap.set('n', 'g~', function()
          local path = (MiniFiles.get_fs_entry() or {}).path
          if path == nil then
            return vim.notify('Cursor is not on valid entry', vim.log.levels.ERROR)
          end
          vim.fn.chdir(vim.fs.dirname(path))
          return vim.notify(vim.fn.getcwd())
        end, { buffer = buf_id, desc = '[C]hange Directory' })
      end,
    })

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
