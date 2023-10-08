vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- UI and colorschemes
    use('xiyaowong/nvim-transparent')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'folke/tokyonight.nvim' }
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use { "lunarvim/horizon.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- LSP, DAP and highlighting
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional
            { 'onsails/lspkind.nvim' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- LSP extensions
            { 'p00f/clangd_extensions.nvim' }
        }
    }

    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = { 'mfussenegger/nvim-dap' },
        config = require('rubisrage.dap').setup_dap_ui
    }
    use {
        'mfussenegger/nvim-dap-python',
        ft = { 'python' },
        requires = {
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-ui',
        },
        config = require('rubisrage.dap').setup_python_dap
    }

    use 'WhoIsSethDaniel/mason-tool-installer'

    use { 'tpope/vim-dispatch',
        opt = true,
        cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
    }

    use 'github/copilot.vim'

    -- File Navigation
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'theprimeagen/harpoon' }
    use {
        "ms-jpq/chadtree",
        run = ':CHADdeps'
    }
    use 'francoiscabrol/ranger.vim'
    use 'rbgrouleff/bclose.vim'

    -- Markdown and Latex
    use { 'lervag/vimtex' }
    use {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

    -- Git
    use('tpope/vim-fugitive')

    -- Which key
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup {}
        end
    }

    -- Greeter

    -- Utils
    use { 'christoomey/vim-tmux-navigator' }
    use { "windwp/nvim-ts-autotag" }
    use { 'mbbill/undotree' }
end)
