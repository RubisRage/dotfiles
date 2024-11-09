local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local mappings = {
  { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
  { "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
  { "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
  { "n", "gr", "<cmd><c-u>Telescope lsp_references<cr>", "Show references" },
  { "n", "gs", vim.lsp.buf.signature_help, "Show signature" },
  { "n", "<leader>d", vim.diagnostic.open_float, "Show signature" },
  { "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
  { "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
  { "n", "<leader>td", vim.lsp.buf.type_definition, "Go to type definition" },
  { "n", "<leader>tH", vim.lsp.buf.typehierarchy, "Show type hierarchy" },
  { "n", "<leader>r", require "nvchad.lsp.renamer", "NvRenamer" },
  { { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action" },
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

M.set_default_mappings = function(_, bufnr)
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
  local defaults = { "html", "cssls" }

  for _, lsp in ipairs(defaults) do
    lspconfig[lsp].setup {
      on_attach = M.set_default_mappings,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end

  -- Manually configured servers
  lspconfig.lua_ls.setup {
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
  }
end

return M
