require('mason-tool-installer').setup {
    ensure_installed = {
        -- Web
        'tsserver',
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
