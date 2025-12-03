vim.keymap.set({ 'n', 'v' }, '<leader>tp', ':TypstPreviewToggle<CR>', { buffer = true, desc = '[T]oggle [P]review' })
vim.keymap.set({ 'n', 'v' }, '<leader>pc', ':LspTinymistExportPdf<CR>', { buffer = true, desc = '[P]roject [C]ompile' })
vim.keymap.set({ 'n', 'v' }, '<leader>pm', ':LspTinymistPinMain<CR>', { buffer = true, desc = '[P]in [M]ain' })

vim.cmd [[
    setlocal linebreak
    setlocal spell
    ]]
