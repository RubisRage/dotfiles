require('mason-tool-installer').setup {
    ensure_installed = {
        -- Web
        'tsserver',
        'eslint',
        'html',
        'cssls',

        -- C/C++
        'clangd',

        -- Python
        'pylsp',
        'debugpy',
    },
}
