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
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>", { noremap = true, silent = true, desc = "Telekasten" })

-- Most used functions
vim.keymap.set(
  "n",
  "<leader>zf",
  "<cmd>Telekasten find_notes<CR>",
  { noremap = true, silent = true, desc = "Find notes" }
)
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
