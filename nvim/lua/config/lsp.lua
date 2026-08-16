local servers = {
  'lua_ls',
  'ts_ls',
  'rust_analyzer',
  'astro',
  'gopls',
  'cssls',
  'html',
  'phpactor',
  'basedpyright',
  'twiggy_language_server',
  'tailwindcss',
  'vue_ls',
  'emmet_language_server'
}

-- TypeScript SDK + Vue plugin come from Mason packages (decoupled from nvm globals).
local mason_pkg = vim.fn.stdpath("data") .. "/mason/packages"
local ts_lib = mason_pkg .. "/typescript-language-server/node_modules/typescript/lib"
local vue_ts_plugin = mason_pkg .. "/vue-language-server/node_modules/@vue/typescript-plugin"

vim.lsp.config('ts_ls', {
  init_options = {
    tsserver = {
      path = ts_lib,
    },
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_ts_plugin,
        languages = { "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue"
  },
})

vim.lsp.config("astro", {
  init_options = {
    typescript = {
      tsdk = ts_lib
    }
  }
})

vim.lsp.config("vue_ls", {
  init_options = {
    typescript = {
      tsdk = ts_lib
    }
  }
})

vim.lsp.config("rust_analyzer", {
  cmd = { vim.fn.expand("~/.local/bin/rust-analyzer") },
  settings = {
    ["rust-analyzer"] = {
      diagnostics = { enable = false },
      checkOnSave = true,
      check = { command = "check" },
    },
  },
})

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

      -- reactivate completion with ctrl + space
      -- Nvim 0.12 input handling can deliver <C-Space> as <Nul> (<C-@>),
      -- so bind both to be terminal-agnostic.
      local trigger_completion = function() vim.lsp.completion.get() end
      local opts = { buffer = ev.buf, desc = 'LSP: trigger/reset completion' }
      vim.keymap.set('i', '<C-Space>', trigger_completion, opts)
      vim.keymap.set('i', '<C-@>', trigger_completion, opts)
    end
  end,
})

-- Diagnostics
vim.diagnostic.config({
  -- Use the default configuration
  -- virtual_lines = true

  -- Alternatively, customize specific options
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
})
