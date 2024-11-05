
function ColorMyPencils(color)
	color = color or "catppuccin"

	vim.cmd.colorscheme(color)

  --bg = bg or true
  --if bg
  --then
  	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --end

end

ColorMyPencils()
