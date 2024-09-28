local wk = require('which-key')

local builtin = require('telescope.builtin')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

WhichKeySetup = false

if not WhichKeySetup then
    wk.register({
        f = {
            name = 'Files',
            -- e = { vim.cmd.CHADopen, 'Toggle file explorer' },
            e = { vim.cmd.Explore, 'Toggle file explorer' },
            h = { builtin.find_files, 'Find files' },
            g = { builtin.git_files, 'Find git files' },
            s = { builtin.live_grep, 'Find greped files' },
        },

        u = { vim.cmd.UndotreeToggle, 'Toggle undo tree' },

        n = {
            name = 'Navigation',
            m = { mark.add_file, 'Mark file with Harpoon' },
            e = { ui.toggle_quick_menu, 'Show marked files' },
            ['f'] = { function() ui.nav_file(1) end, 'Navigate to first marked file' },
            ['d'] = { function() ui.nav_file(2) end, 'Navigate to second marked file' },
            ['s'] = { function() ui.nav_file(3) end, 'Navigate to third marked file' },
            ['a'] = { function() ui.nav_file(4) end, 'Navigate to fourth marked file' },
        },

        g = {
            name = 'Git',
            s = { function() vim.cmd('vertical Git') end, 'Git status' }
        },

        p = {
            name = 'Preview',
            m = { vim.cmd.MarkdownPreviewToggle, 'Open Markdown preview' }
        },

        d = {
            name = "Debugging and running",
            b = { vim.cmd.DapToggleBreakpoint, 'Toggle breakpoint' },
            c = { vim.cmd.DapContinue, 'Start/Continue execution' },
            n = { vim.cmd.DapStepOver, 'Next: Step over function' },
            i = { vim.cmd.DapStepInto, 'Next: Step into function' },
            f = { vim.cmd.DapStepOut, 'Next: Step out of function' },
            t = { vim.cmd.DapTerminate, 'Kill: Terminate running session' },
        }

    }, { prefix = '<leader>' })

    WhichKeySetup = true
end

-- LSP mappings, only loaded on LSP attach (after/plugin/lsp.lua)
local lsp_mappings = {
    mappings = {
        name = "Code (LSP)",
        I = { vim.lsp.buf.hover, "Show symbol's information" },
        d = { vim.lsp.buf.definition, "Show symbol's definition" },
        D = { vim.lsp.buf.declaration, "Show symbol's declaration" },
        i = { vim.lsp.buf.implementation, "Show symbol's implementations" },
        o = { vim.lsp.buf.type_definition, "Jump to symbol's type definition" },
        r = { vim.lsp.buf.references, "List symbol's references" },
        s = { vim.lsp.buf.references, "Show symbol's signature information" },
        R = { vim.lsp.buf.rename, "Rename all references to symbol" },
        a = { vim.lsp.buf.code_action, "Code action" },
        h = { vim.cmd.ClangdSwitchSourceHeader, "Switch between Header and Source file (C/C++)" },
        l = { vim.diagnostic.open_float, "Show diagnostics" },
        ['>'] = { vim.diagnostic.goto_next, "Jump to next diagnostic" },
        ['<'] = { vim.diagnostic.goto_prev, "Jump to previous diagnostic" },
    },
    opts = { prefix = '<leader>l', noremap = true }
}

return lsp_mappings
