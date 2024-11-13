return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.cmp"
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig").setup()
    end,
  },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      require "configs.rustacean"
    end,
  },

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
