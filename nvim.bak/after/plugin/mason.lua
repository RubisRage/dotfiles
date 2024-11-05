require('mason-tool-installer').setup {
    ensure_installed = {
        -- Web
        'ts_ls',
        'eslint',
        'html',
        'cssls',

        -- C/C++
        'clangd',
        'codelldb',

        -- Go
        'gopls',

        -- Python
        'pylsp',
        'debugpy',
    },
}
