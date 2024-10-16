local builtin = require('telescope.builtin')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

WhichKeySetup = false

local general_mappings = {
    -- Files
    { "<leader>f",  group = "Files" },
    { "<leader>fe", vim.cmd.Explore,                        desc = 'Toggle file explorer' },
    { "<leader>fh", builtin.find_files,                     desc = 'Find files' },
    { "<leader>fg", builtin.git_files,                      desc = 'Find git files' },
    { "<leader>fs", builtin.live_grep,                      desc = 'Find greped files' },
    { "<leader>u",  vim.cmd.UndotreeToggle,                 desc = 'Toggle undo tree' },

    -- Navigation
    { "<leader>n",  group = "Navigation" },
    { "<leader>nm", mark.add_file,                          desc = 'Mark file with Harpoon' },
    { "<leader>ne", ui.toggle_quick_menu,                   desc = 'Show marked files' },
    { "<leader>nf", function() ui.nav_file(1) end,          desc = 'Navigate to first marked file' },
    { "<leader>nd", function() ui.nav_file(2) end,          desc = 'Navigate to second marked file' },
    { "<leader>ns", function() ui.nav_file(3) end,          desc = 'Navigate to third marked file' },
    { "<leader>na", function() ui.nav_file(4) end,          desc = 'Navigate to fourth marked file' },

    -- Git
    { "<leader>g",  group = "Git" },
    { "<leader>gs", function() vim.cmd('vertical Git') end, desc = 'Git status' },

    -- Preview
    { "<leader>p",  group = "Preview" },
    { "<leader>pm", vim.cmd.MarkdownPreviewToggle,          desc = 'Open Markdown preview' },

    -- Debugging and running
    { "<leader>d",  group = "Debugging and running" },
    { "<leader>db", vim.cmd.DapToggleBreakpoint,            desc = 'Toggle breakpoint' },
    { "<leader>dc", vim.cmd.DapContinue,                    desc = 'Start/Continue execution' },
    { "<leader>dn", vim.cmd.DapStepOver,                    desc = 'Next: Step over function' },
    { "<leader>di", vim.cmd.DapStepInto,                    desc = 'Next: Step into function' },
    { "<leader>df", vim.cmd.DapStepOut,                     desc = 'Next: Step out of function' },
    { "<leader>dt", vim.cmd.DapTerminate,                   desc = 'Kill: Terminate running session' },
}

-- LSP mappings, only loaded on LSP attach (after/plugin/lsp.lua)
local lsp_mappings = {
    { "<leader>l",  group = "Language server" },
    { "<leader>lI", vim.lsp.buf.hover,                desc = "Show symbol's information" },
    { "<leader>ld", vim.lsp.buf.definition,           desc = "Show symbol's definition" },
    { "<leader>lD", vim.lsp.buf.declaration,          desc = "Show symbol's declaration" },
    { "<leader>li", vim.lsp.buf.implementation,       desc = "Show symbol's implementations" },
    { "<leader>lo", vim.lsp.buf.type_definition,      desc = "Jump to symbol's type definition" },
    { "<leader>lr", vim.lsp.buf.references,           desc = "List symbol's references" },
    { "<leader>ls", vim.lsp.buf.references,           desc = "Show symbol's signature information" },
    { "<leader>lR", vim.lsp.buf.rename,               desc = "Rename all references to symbol" },
    { "<leader>la", vim.lsp.buf.code_action,          desc = "Code action" },
    { "<leader>lh", vim.cmd.ClangdSwitchSourceHeader, desc = "Switch between Header and Source file (C/C++)" },
    { "<leader>ll", vim.diagnostic.open_float,        desc = "Show diagnostics" },
    { "<leader>l>", vim.diagnostic.goto_next,         desc = "Jump to next diagnostic" },
    { "<leader>l<", vim.diagnostic.goto_prev,         desc = "Jump to previous diagnostic" },
}

return {
    general = general_mappings,
    lsp = lsp_mappings
}
