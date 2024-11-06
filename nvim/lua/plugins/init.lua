return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "theprimeagen/harpoon" },

  {
    "christmey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<a-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<a-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<a-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<a-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

  { "mbbill/undotree", cmd = { "UndotreeToggle" } },

  { "tpope/vim-fugitive" },

  {
    "lervag/vimtex",
    ft = { "latex" },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
