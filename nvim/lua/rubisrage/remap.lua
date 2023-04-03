vim.g.mapleader = " "

-- Open file explorer with relativenumber
vim.cmd([[command! Ex :lua Netrw()]])

function Netrw()
    vim.cmd.Explore()
    vim.opt.relativenumber = true
end

vim.keymap.set("n", "<leader>pv", Netrw)

-- Buffer switching 
vim.keymap.set("n", '<leader>h', [[<Cmd>wincmd h<CR>]])
vim.keymap.set("n", '<leader>j', [[<Cmd>wincmd j<CR>]])
vim.keymap.set("n", '<leader>k', [[<Cmd>wincmd k<CR>]])
vim.keymap.set("n", '<leader>l', [[<Cmd>wincmd l<CR>]])

-- Terminal exit insert mode
-- vim.keymap.set("t", '<esc>', [[<C-\><C-n>]])
-- vim.keymap.set("t", '<esc>', [[<C-\><C-n>]])

local specialEscSet = false

function ToggleSpecialEsc()
    if not specialEscSet then
        vim.keymap.set({'i', 't', 'v'}, 'ñ', [[<C-\><C-n>]])
    else
        vim.keymap.set({'i', 't', 'v'}, 'ñ', [[ñ]])
    end

    specialEscSet = not specialEscSet
end

ToggleSpecialEsc()

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}

  vim.keymap.set('n', 'q', function() vim.cmd(":q") end, opts)
end

-- Bind keymaps on open terminal 
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
