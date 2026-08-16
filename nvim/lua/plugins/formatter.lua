return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
				javascript = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				xhtml = { "prettierd", "prettier" },
				astro = { "prettierd", "prettier" },
				vue = { "prettierd", "prettier" },
				json = { "jq" },
				twig = { "twig-cs-fixer" },
				php = { "pretty-php" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				["twig-cs-fixer"] = {
					command = vim.fn.expand("~/.config/composer/vendor/bin/twig-cs-fixer"),
				},
			},
		},
	},
}
