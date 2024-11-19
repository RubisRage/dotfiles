return {
  -- LSP / Fomatting / Running
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp",
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ej-shafran/compile-mode.nvim",
    },
    config = function()
      require("configs.lspconfig").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "configs.dap-ui"
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      require "configs.rustacean"
    end,
  },

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

  {
    "ej-shafran/compile-mode.nvim",
    branch = "latest",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Moving around
  { "theprimeagen/harpoon" },

  {
    "christoomey/vim-tmux-navigator",
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

  -- Others
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  { "mbbill/undotree", cmd = { "UndotreeToggle" } },
}
