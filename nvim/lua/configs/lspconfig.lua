local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local M = {}

M.build_mapping = function(modes, lhs, rhs, desc)
  return {
    modes = modes,
    lhs = lhs,
    rhs = rhs,
    desc = desc,
  }
end

M.mappings = {
  M.build_mapping("n", "gd", vim.lsp.buf.definition, "Go to definition"),
  M.build_mapping("n", "gD", vim.lsp.buf.declaration, "Go to declaration"),
  M.build_mapping("n", "gi", vim.lsp.buf.implementation, "Go to implementation"),
  M.build_mapping("n", "gr", "<cmd><c-u>Telescope lsp_references<cr>", "Show references"),
  M.build_mapping("n", "gs", vim.lsp.buf.signature_help, "Show signature"),
  M.build_mapping("n", "<leader>d", vim.diagnostic.open_float , "Show signature"),
  M.build_mapping("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder"),
  M.build_mapping("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder"),
  M.build_mapping("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders"),
  M.build_mapping("n", "<leader>td", vim.lsp.buf.type_definition, "Go to type definition"),
  M.build_mapping("n", "<leader>th", vim.lsp.buf.typehierarchy, "Go to type definition"),
  M.build_mapping("n", "<leader>r", require "nvchad.lsp.renamer", "NvRenamer"),
  M.build_mapping({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action"),
}

M.set_default_mappings = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  for _, mapping in pairs(M.mappings) do
    local modes = mapping.modes
    local lhs = mapping.lhs
    local rhs = mapping.rhs
    local desc = mapping.desc

    vim.keymap.set(modes, lhs, rhs, opts(desc))
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
