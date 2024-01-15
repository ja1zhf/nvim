return {
	"kaicataldo/material.vim",
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme material]])
		vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
		vim.cmd([[hi SignColumn guibg=NONE cterm=NONE term=NONE]])
	end,
}
