-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Seems like there's a bug in which-key right now so I'm disabling this
-- vim.g.maplocalleader = ";"
vim.cmd([[
  command! -range -nargs=0 ModsExplain :'<,'>w !mods explain this code please, be really clear as if I'm a beginner
]])
vim.cmd([[
  command! -range -nargs=* ModsRefactor :'<,'>!mods refactor this to improve its readability
]])
vim.cmd([[
  command! -range -nargs=+ Mods :'<,'>w !mods <q-args>
]])
vim.cmd([[
  command! -nargs=1 DeleteMarks :delmark <args>
]])
