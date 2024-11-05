-- Preset

local lsp = require('lsp-zero').preset({
    name = "recommended",
    set_lsp_keymaps = true,
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = false,
        documentation_window = true,
    },
    suggest_lsp_servers = true
})

-- Prevent clangd setup (cland_extensions)
lsp.skip_server_setup({ 'clangd' })

-- Global config
lsp.setup_servers({
    -- Web
    'ts_ls',
    'eslint',
    'html',
    'cssls',

    -- C/C++
    -- clangd setup with cland_extensions

    -- Python
    'pylsp',

    -- Rust
    'rust_analyzer'
})

local function bind_lsp_mappings(client, bufnr)
    if client.name == 'Github Copilot' then
        return
    end

    lsp.default_keymaps({ buffer = bufnr })

    local lsp_mappings = require('rubisrage.mappings').lsp

    for _, mapping in ipairs(lsp_mappings) do
        mapping.buffer = bufnr
    end

    require('which-key').add(lsp_mappings)
end

lsp.on_attach(bind_lsp_mappings)

-- Snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Formatting
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['pylsp'] = { 'python' },
        ['clangd'] = { 'c', 'cpp' },
        ['rust_analyzer'] = { 'rust' },
        ['ts_ls'] = {
            'javascript',
            'javascript.jsx',
            'typescript',
            'typescript.tsx',
            'typescriptreact',
            'javascriptreact',
            'vue',
            'svelte',
            'astro',
        },
    }
})

-- Icons
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

-- Per-server configuration

local lspconfig = require("lspconfig")

-- Example
-- lspconfig.html.setup({
--     filetypes = { "html", "typescript.tsx", "javascript.jsx" }
-- })

lspconfig.clangd.setup {
    cmd = {
        '/usr/bin/clangd',
        '--query-driver=/**/*',
        '--clang-tidy',
        '--offset-encoding=utf-16'
    },
    filetypes = { 'c', 'cpp' }
}

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Cmp config

local cmp = require('cmp')

cmp.setup({
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
            mode = 'symbol_kind',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

-- Clangd extensions
require("clangd_extensions").setup({
    inlay_hints = {
        inline = vim.fn.has("nvim-0.10") == 1,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
    },
    ast = {
        role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
        },

        kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
        },

        highlights = {
            detail = "Comment",
        },
    },
    memory_usage = {
        border = "none",
    },
    symbol_info = {
        border = "none",
    },
})
