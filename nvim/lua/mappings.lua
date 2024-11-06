require "nvchad.mappings"
local ui = require "harpoon.ui"
local mark = require "harpoon.mark"

local nomap = vim.keymap.del
local map = vim.keymap.set

-- Remove NvChad default telescope find files
nomap("n", "<leader>ff")

-- Remove line number mappings
nomap("n", "<leader>n")
nomap("n", "<leader>rn")

-- Remove terminal mappings (Can't disable NvUI terminal module)
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<M-i>")
nomap("n", "<M-h>")
nomap("n", "<M-v>")

-- Remove insert mode moving commands
nomap("i", "<C-h>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
nomap("i", "<C-l>")
nomap("i", "<C-b>")
nomap("i", "<C-e>")

-- Remove default window switching bindings
nomap("n", "<C-h>")
nomap("n", "<C-l>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")

-- Remove unwanted comment bindings
nomap("n", "gcc") -- Comment one line (Use gc{motion} instead)
nomap({ "n", "v" }, "<leader>/") -- NvChad comment binding (Use gc instead)

-- Telescope
map("n", "<leader>fp", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

-- Navigation
map("n", "<leader>nm", mark.add_file, { desc = "Harpoon Mark file" })
map("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon Show marked files" })
map("n", "<M-f>", function() ui.nav_file(1) end, { desc = "Harpoon Navigate to first marked file" })
map("n", "<M-d>", function() ui.nav_file(2) end, { desc = "Harpoon Navigate to second marked file" })
map("n", "<M-s>", function() ui.nav_file(3) end, { desc = "Harpoon Navigate to third marked file" })
map("n", "<M-a>", function() ui.nav_file(4) end, { desc = "Harpoon Navigate to fourth marked file" })
map("n", "<M-u>", function() ui.nav_file(5) end, { desc = "Harpoon Navigate to fifth marked file" })
map("n", "<M-o>", function() ui.nav_file(6) end, { desc = "Harpoon Navigate to sixth marked file" })
map("n", "<M-p>", function() ui.nav_file(7) end, { desc = "Harpoon Navigate to seventh marked file" })


-- Nvim + Tmux switch windows
map("n", "<M-h>", vim.cmd.TmuxNavigateLeft, { desc = "Window Move to window on the left" })
map("n", "<M-j>", vim.cmd.TmuxNavigateDown, { desc = "Window Move to window above" })
map("n", "<M-k>", vim.cmd.TmuxNavigateUp, { desc = "Window Move to window below" })
map("n", "<M-l>", vim.cmd.TmuxNavigateRight, { desc = "Window Move to window to the right" })
