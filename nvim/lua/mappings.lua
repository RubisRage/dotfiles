-- Default NvChad bindings must be manually added. Importing nvchad.mappings
-- will result in conflicting key mappings with |vim-tmux-navigator|

local ui = require "harpoon.ui"
local mark = require "harpoon.mark"

local nomap = vim.keymap.del
local map = vim.keymap.set

-- Telescope
map("n", "<leader>fp", "<cmd>Telescope find_files<CR>", { desc = "Telescope find files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "telescope find keymaps" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- Undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undo tree" })

-- Format file
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- Open cheatsheet
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- Tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- NvimTree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle nvimtree focus window" })

-- Navigation
map("n", "<leader>hm", mark.add_file, { desc = "Harpoon Mark file" })
map("n", "<leader>hs", ui.toggle_quick_menu, { desc = "Harpoon Show marked files" })

local harpoons = {
  { key = "f", label = "first" },
  { key = "d", label = "second" },
  { key = "s", label = "third" },
  { key = "a", label = "fourth" },
  { key = "u", label = "fifth" },
  { key = "o", label = "sixth" },
  { key = "p", label = "seventh" },
}

for i, harpoon in ipairs(harpoons) do
  map("n", "<A-" .. harpoon.key .. ">", function()
    ui.nav_file(i)
  end, { desc = "Harpoon Navigate to " .. harpoon.label .. " marked file" })
end

-- WhichKey
map("n", "<leader>wK", vim.cmd.WhichKey, { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- Color picker
map("n", "<leader>cp", vim.cmd.Huefy, { desc = "Minty Open color picker" })

-- Remove nvim default bindings
nomap("n", "gcc") -- Comment one line (Use gc{motion} instead)
