
require("toggleterm").setup{
    size =  function(term)
        if term.direction == "vertical" then
            return 80
        elseif term.direction == "horizontal" then
            return 15
        end
    end,

    shell = "fish"
}


function termCommand(index, direction) 
    return string.format('%sToggleTerm direction=%s', index, direction)
end

vim.keymap.set("n", "<leader>t", function() 
    vim.cmd(termCommand("1", "float")) 
end)

vim.keymap.set("n", "<leader>vt", function() 
    vim.cmd(termCommand("2", "vertical")) 
end)

vim.keymap.set("n", "<leader>nt", function() 
    vim.cmd(termCommand("3", "horizontal")) 
end)


