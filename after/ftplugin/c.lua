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
vim.keymap.set({ 'n', 'v' }, '<leader>pc', ':CMakeBuild<CR>', { buffer = true, desc = '[P]roject [c]ompile' })
vim.keymap.set({ 'n', 'v' }, '<leader>pC', ':CMakeClean<CR>', { buffer = true, desc = '[P]roject [C]lean' })
vim.keymap.set({ 'n', 'v' }, '<leader>pr', ':CMakeRun<CR>', { buffer = true, desc = '[P]roject [R]un' })
vim.keymap.set({ 'n', 'v' }, '<leader>pd', ':CMakeDebug<CR>', { buffer = true, desc = '[P]roject [D]ebug' })
vim.keymap.set({ 'n', 'v' }, '<leader>ppc', ':CMakeSelectConfigurePreset<CR>', { buffer = true, desc = '[P]roject select [P]reset [C]onfigure' })
vim.keymap.set({ 'n', 'v' }, '<leader>ppb', ':CMakeSelectBuildPreset<CR>', { buffer = true, desc = '[P]roject select [P]reset [B]uild' })
vim.keymap.set({ 'n', 'v' }, '<leader>ppt', ':CMakeSelectTestPreset<CR>', { buffer = true, desc = '[P]roject select [P]reset [T]est' })
vim.keymap.set({ 'n', 'v' }, '<leader>psb', ':CMakeSelectBuildTarget<CR>', { buffer = true, desc = '[P]roject [S]elect [B]uild target' })
vim.keymap.set({ 'n', 'v' }, '<leader>psl', ':CMakeSelectLaunchTarget<CR>', { buffer = true, desc = '[P]roject [S]elect [L]aunch target' })
vim.keymap.set({ 'n', 'v' }, '<leader>poe', ':CMakeOpenExecutor<CR>', { buffer = true, desc = '[P]roject [O]pen [E]xecutor' })
vim.keymap.set({ 'n', 'v' }, '<leader>por', ':CMakeOpenRunner<CR>', { buffer = true, desc = '[P]roject [O]pen [R]unner' })
