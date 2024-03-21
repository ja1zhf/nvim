return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local options = {
			ensure_installed = { "lua", "vim", "vimdoc" },

			highlight = {
				enable = true,
				use_languagetree = true,
			},

			indent = { enable = true },
		}

		return options
	end,
}
