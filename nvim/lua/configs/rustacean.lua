local function rustlsp(action)
  return function()
    vim.cmd.RustLsp(action)
  end
end

local mappings = {
  { "n", "K", rustlsp { "hover", "actions" }, "Hover" },
  { "n", "J", rustlsp "joinLines", "Join lines" },
  { { "n", "v" }, "<leader>ca", rustlsp "codeAction", "Code action" },
  { "n", "gp", rustlsp "parentModule", "Go to parent module" },
  { "n", "<leader>d", rustlsp "renderDiagnostic", "Show diagnostics" },
  { "n", "gh", rustlsp "openDocs", "Open Docs" },
}

local function on_attach(_, bufnr)
  require("configs.lspconfig").set_default_mappings(_, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "Rust LSP " .. desc }
  end

  for _, m in ipairs(mappings) do
    vim.keymap.set(m[1], m[2], m[3], opts(m[4]))
  end
end

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
  },
}
