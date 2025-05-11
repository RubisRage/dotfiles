local conf = function()
  local cmp = require "cmp"
  local conf = require "nvchad.configs.cmp"

  -- More info on cmp and using luasnip:
  -- ~/.local/share/nvim/lazy/NvChad/lua/nvchad/configs/cmp.lua

  conf.mapping["<C-y>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  }

  conf.mapping["<CR>"] = nil
end

return conf
