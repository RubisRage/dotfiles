local function icon_component(icon)
    return function()
        return icon
    end
end

local function cwd_component()
    local cwd = vim.loop.cwd()
    local cwd_base = vim.fs.basename(cwd)
    local cwd_parent = vim.fs.basename(vim.fs.dirname(cwd))

    return cwd_parent .. '/' .. cwd_base
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '|', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            {
                'branch',
                draw_empty = true
            },
            'diff',
            'diagnostics',
        },
        lualine_c = { 'filename' },
        lualine_x = {}, -- {'encoding', 'fileformat', 'filetype'},
        lualine_y = {
            {
                icon_component('󰉋'),
                padding = { left = 0, right = 1 },
                color = { fg = "#000000", bg = "#eba0ac" },
            },
            {
                cwd_component,
                color = { fg = '#a0d0e6', bg = "#313244" },
                padding = 1
            },
        },
        lualine_z = {
            {
                icon_component('󰈚'),
                padding = { left = 0, right = 1 },
                color = { bg = "#a6e3a1" },
            },
            {
                'location',
                color = { fg = '#a0d0e6', bg = "#313244" },
                padding = { right = 0, left = 1 },
            },
            {
                icon_component('|'),
                color = { fg = '#a0d0e6', bg = "#313244" },
            },
            {
                'progress',
                padding = { right = 1, left = 0 },
                color = { fg = '#a0d0e6', bg = "#313244" },
            },
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'chadtree', 'nvim-dap-ui' }
}
