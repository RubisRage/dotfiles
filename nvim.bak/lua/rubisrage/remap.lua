vim.g.mapleader = " "
-- Buffer switching (Tmux/Vim Navigator)
vim.keymap.set("n", '<C-h>', [[<C-U>TmuxNavigateLeft<CR>]])
vim.keymap.set("n", '<C-j>', [[<C-U>TmuxNavigateDown<CR>]])
vim.keymap.set("n", '<C-k>', [[<C-U>TmuxNavigateUp<CR>]])
vim.keymap.set("n", '<C-l>', [[<C-U>TmuxNavigateRight<CR>]])

-- Page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
