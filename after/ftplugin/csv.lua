vim.keymap.set({ 'n', 'v' }, '<leader>tv', ':CsvViewToggle<CR>', { buffer = true, desc = '[T]oggle [V]iew' })

vim.cmd [[
    setlocal nolinebreak
    setlocal spell
    ]]
