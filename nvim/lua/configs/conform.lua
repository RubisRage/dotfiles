local options = {
  formatters = {
    prettier = {
      prepend_args = { "--single-quote", "--prose-wrap preserve", "--jsx-single-quote" },
    },

    latexindent = {
      prepend_args = { "--modifylinebreaks", "--local" },
    },
  },

  formatters_by_ft = {
    verilog = { "verible" },

    lua = { "stylua" },

    python = { "black" },

    rust = { "rustfmt" },

    c = { "clang-format" },
    cpp = { "clang-format" },

    css = { "prettier" },
    html = { "prettier" },
    jsx = { "prettier" },
    tsx = { "prettier" },
    ts = { "prettier" },
    js = { "prettier" },

    tex = { "latexindent" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
