local ok, cmake = pcall(require, 'cmake-tools')
if not ok then
  vim.notify('Cmake-tools not loaded', vim.log.levels.ERROR)
  return
end

-- if not cmake.is_cmake_project() then
--   vim.notify('Not a cmake project', vim.log.levels.ERROR)
--   return
-- end

vim.keymap.set({ 'n', 'v' }, '<leader>pg', ':CMakeGenerate<CR>', { buffer = true, desc = '[P]roject [G]enerate' })
vim.keymap.set({ 'n', 'v' }, '<leader>pc', ':CMakeBuild<CR>', { buffer = true, desc = '[P]roject [C]ompile' })
vim.keymap.set({ 'n', 'v' }, '<leader>pr', ':CMakeRun<CR>', { buffer = true, desc = '[P]roject [R]un' })
vim.keymap.set({ 'n', 'v' }, '<leader>pd', ':CMakeDebug<CR>', { buffer = true, desc = '[P]roject [D]ebug' })
