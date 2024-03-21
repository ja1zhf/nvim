return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		mason_null_ls.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
			},
		})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})
	end,
}
