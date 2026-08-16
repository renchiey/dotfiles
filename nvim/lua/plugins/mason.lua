return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    -- setup() prepends Mason's bin dir to PATH (PATH = "prepend" by default),
    -- so conform/lspconfig can find tools installed below.
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      -- Install LSP servers (lspconfig names). Enabling + per-server config
      -- stays in config/lsp.lua via native vim.lsp.enable / vim.lsp.config.
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "astro",
        "gopls",
        "cssls",
        "html",
        "phpactor",
        "basedpyright",
        "tailwindcss",
        "vue_ls",
        "emmet_language_server",
        "twiggy_language_server",
      },
      -- config/lsp.lua already calls vim.lsp.enable(servers); don't double-enable.
      automatic_enable = false,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      -- Formatters used in plugins/formatter.lua + any other CLI tools.
      -- LSP servers stay managed by config/lsp.lua (native vim.lsp.enable).
      ensure_installed = {
        "black",
        "isort",
        "stylua",
        "prettierd",
        "jq",
      },
      run_on_start = true,
    },
  },
}
