local cmp = require("cmp")

-- More info on cmp and using luasnip: 
-- ~/.local/share/nvim/lazy/NvChad/lua/nvchad/configs/cmp.lua

local options = {
  mapping = {
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  }
}

return options
