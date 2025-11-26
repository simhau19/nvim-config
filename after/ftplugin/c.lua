vim.keymap.set({ 'n', 'v' }, '<leader>pc', ':CmakeBuild<CR>', { buffer = true, desc = '[P]roject [C]ompile' })
vim.keymap.set({ 'n', 'v' }, '<leader>pr', ':CmakeRun<CR>', { buffer = true, desc = '[P]roject [R]un' })
-- vim.keymap.set({ 'n', 'v' }, '<leader>pd', ':<CR>', { buffer = true, desc = '[P]roject [D]ebug' })
