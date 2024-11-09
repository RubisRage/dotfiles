local options = {
  formatters = {
    prettier = {
      prepend_args = { "--single-quote", "--prose-wrap preserve", "--jsx-single-quote" },
    },
  },

  formatters_by_ft = {
    verilog = { "verible" },

    lua = { "stylua" },

    rust = { "rustfmt" },

    c = { "clang-format" },
    cpp = { "clang-format" },

    css = { "prettier" },
    html = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    ts = { "prettier" },
    js = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
