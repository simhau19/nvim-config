-- cpp, hpp and h filetypes are all treated as cpp

---@diagnostic disable: undefined-global

return {
  -- require('luasnip').text_node
  s({ trig = 'guard', name = 'Header guard' }, {}, {
    callbacks = {
      [-1] = {
        [events.leave] = function(node, _event_args)
          local filename = vim.fn.expand '%:t'
          local define = filename:gsub('%.', '_'):upper()
          vim.api.nvim_buf_set_lines(0, 0, 0, false, {
            '#ifndef ' .. define,
            '#define ' .. define,
            '',
          })
          local last_line = vim.api.nvim_buf_line_count(0)
          vim.api.nvim_buf_set_lines(0, last_line, last_line, false, {
            '',
            '#endif //' .. define,
          })
        end,
      },
    },
  }),
}
