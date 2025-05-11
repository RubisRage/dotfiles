local nvlsp = require "nvchad.configs.lspconfig"

local mappings = {
  { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
  { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
  { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
  { "n", "gr", "<cmd>Telescope lsp_references<cr>", "Show references" },
  { "n", "gs", vim.lsp.buf.signature_help, "Show signature" },
  { "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
  { "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
  { "n", "<leader>td", vim.lsp.buf.type_definition, "Go to type definition" },
  { "n", "<leader>tH", vim.lsp.buf.typehierarchy, "Show type hierarchy" },
  { "n", "<leader>r", require "nvchad.lsp.renamer", "NvRenamer" },
  { "n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic" },
  {
    "n",
    "g.",
    function()
      local next = vim.diagnostic.get_next()

      if next == nil then
        print "No more diagnostics to jump to"
        return
      end

      vim.api.nvim_win_set_cursor(0, { next.lnum + 1, next.col })
    end,
    "Go to next diagnostic",
  },
  {
    "n",
    "g,",
    function()
      local prev = vim.diagnostic.get_prev()

      if prev == nil then
        print "No more diagnostics to jump to"
        return
      end

      vim.api.nvim_win_set_cursor(0, { prev.lnum + 1, prev.col })
    end,
    "Go to previous diagnostic",
  },
  { { "n", "v" }, "<leader>ca", require("actions-preview").code_actions, "Code action" },
  {
    "n",
    "<leader>wl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    "List workspace folders",
  },
}

local M = {}

M.defaults = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  for _, m in ipairs(mappings) do
    vim.keymap.set(m[1], m[2], m[3], opts(m[4]))
  end
end

M.setup = function()
  nvlsp.defaults() -- Set NvChad LSP defaults (Theme, lua ls, etc.)
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  -- Servers with default config
  local defaults = { "html", "cssls", "clangd", "basedpyright", "tailwindcss" }

  for _, lsp in ipairs(defaults) do
    vim.lsp.enable(lsp)
    vim.lsp.config(lsp, {
      on_attach = M.defaults,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    })
  end

  -- Manually configured servers
  vim.lsp.enable('lua_ls')
  vim.lsp.config('lua_ls', {
    on_attach = M.set_default_mappings,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  })

  vim.lsp.enable('jinja_lsp')
  vim.lsp.config('jinja_lsp', {
    on_attach = M.set_default_mappings,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,

    filetypes = { "jinja", "jinja2", "htmldjango" },
  })
end

return M
