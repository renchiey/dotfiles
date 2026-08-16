return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent"
      },
    },
    config = function(_, opts)
      -- load the colorscheme here
      require('tokyonight').setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
