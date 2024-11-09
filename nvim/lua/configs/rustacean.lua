
local function rustlsp(action)
  return function()
    vim.cmd.RustLsp(action)
  end
end


local function on_attach(client, bufnr)
  local lspconfig = require "configs.lspconfig"

  lspconfig.set_default_mappings(client, bufnr)

  local build_mapping = lspconfig.build_mapping
  local mappings = {
    build_mapping("n", "K", rustlsp { "hover", "actions" }, "Hover"),
    build_mapping("n", "J", rustlsp "joinLines", "Join lines"),
    build_mapping({ "n", "v" }, "<leader>ca", rustlsp "codeAction", "Code action"),
    build_mapping("n", "gp", rustlsp "parentModule", "Go to parent module"),
    build_mapping("n", "<leader>d", rustlsp "renderDiagnostic", "Go to parent module"),
  }

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  for _, mapping in ipairs(mappings) do
    local modes = mapping.modes
    local lhs = mapping.lhs
    local rhs = mapping.rhs
    local desc = mapping.desc

    vim.keymap.set(modes, lhs, rhs, opts(desc))
  end
end

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
  },
}
