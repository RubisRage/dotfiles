-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

local formatters = {
  "prettier",
  "clang-format",
}

local servers = {
  "verible",
}

local pkgs = {}

vim.list_extend(pkgs, formatters)
vim.list_extend(pkgs, servers)

M.mason = {
  pkgs = pkgs
}

M.base46 = {
	theme = "melange",
}

M.cheatsheet = {
  theme = "simple"
}

return M
