local lsp = require('lsp-zero').preset({
    name = "per-project",
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'html',
  'cssls',
})

--lsp.preset({
    --name = 'minimal',
    --set_lsp_keymaps = true,
    --manage_nvim_cmp = true,
    --suggest_lsp_servers = false,
--})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.mapping.preset.insert({
  ['<C-p'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm(cmp_select),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- lsp.set_preferences({
--	sign_icons = { } 
-- })

lsp.configure('html', {
    filetypes = { "html", "typescript.tsx", "javascript.jsx"}
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
end)


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
