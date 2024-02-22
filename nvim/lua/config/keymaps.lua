-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Leader>fs", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<Leader>mz", "<cmd>ZenMode<cr>", { noremap = true, silent = true, desc = "Toggle zen mode" })
vim.keymap.set("n", "∆", "<cmd>m +1<cr>", { noremap = true, silent = true, desc = "Move line down one line" })
vim.keymap.set("n", "˚", "<cmd>m -2<cr>", { noremap = true, silent = true, desc = "Move line up one line" })
vim.keymap.set(
  "n",
  "<Leader>mg",
  "<cmd>Presenting<cr>",
  { noremap = true, silent = true, desc = "Toggle Presenting mode" }
)
vim.keymap.set("n", "<Leader>cb", "<cmd>Navbuddy<cr>", { noremap = true, silent = true, desc = "Open Navbuddy" })
