return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local function cat()
			return "󰄛 "
		end

		local mode_map = {
			["NORMAL"] = " NORMAL",
			["O-PENDING"] = " O-PENDING",
			["INSERT"] = " INSERT",
			["VISUAL"] = " VISUAL",
			["V-BLOCK"] = " V-BLOCK",
			["V-LINE"] = " V-LINE",
			["V-REPLACE"] = " V-REPLACE",
			["REPLACE"] = " REPLACE",
			["COMMAND"] = " COMMAND",
			["SHELL"] = " SHELL",
			["TERMINAL"] = " TERMINAL",
			["EX"] = " EX",
			["S-BLOCK"] = " S-BLOCK",
			["S-LINE"] = " S-LINE",
			["SELECT"] = " SELECT",
			["CONFIRM"] = " CONFIRM",
			["MORE"] = " MORE",
		}

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(s)
							return mode_map[s] or s
						end,
					},
				},
				lualine_x = {
					{ cat },
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
