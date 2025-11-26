vim.keymap.set({ 'n', 'v' }, '<leader>tp', ':PeekToggle<CR>', { buffer = true, desc = '[T]oggle [P]review' })
vim.keymap.set({ 'n', 'v' }, '<leader>tv', ':RenderMarkdown buf_toggle<CR>', { buffer = true, desc = '[T]oggle [V]iew' })

vim.cmd [[
    setlocal linebreak
    setlocal spell
    ]]
