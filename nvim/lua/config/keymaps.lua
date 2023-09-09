-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Leader>fs", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("n", "<Leader>mz", "<cmd>ZenMode<cr>", { noremap = true, silent = true, desc = "Toggle zen mode" })
vim.keymap.set("n", "∆", "<cmd>m +1<cr>", { noremap = true, silent = true, desc = "Move line down one line" })
vim.keymap.set("n", "˚", "<cmd>m -2<cr>", { noremap = true, silent = true, desc = "Move line up one line" })
vim.keymap.set("n", "go", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "go"
  end
end, { noremap = false, expr = true, desc = "Go to Markdown linked file" })
vim.keymap.set("n", "gb", "<cmd>bp<cr>", { noremap = true, silent = true, desc = "Go to previous buffer" })
