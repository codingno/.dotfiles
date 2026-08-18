vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "j", "gj", { noremap = true, silent = true })
keymap.set("n", "k", "gk", { noremap = true, silent = true })
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
