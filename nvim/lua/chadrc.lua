-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = vim.defaulttable()

local pkgs = {
  formatters = {
    "prettier",
    "clang-format",
    "black",
  },

  servers = {
    "verible",
    "clangd",
    "basedpyright",
    "jinja-lsp",
    "html-lsp",
    "tailwindcss-language-server",
  },

  debuggers = {
    "codelldb",
  },
}

M.mason = {
  pkgs = {},
}

for _, kind in pairs(pkgs) do
  vim.list_extend(M.mason.pkgs, kind)
end

M.base46 = {
  theme = "melange",
}

M.cheatsheet = {
  theme = "simple",
}

return M
