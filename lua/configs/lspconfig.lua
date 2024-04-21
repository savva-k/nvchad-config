-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "pyright", "gopls", "tsserver" }

local get_python_path = require("util.python").get_python_path

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- more on this: https://github.com/younger-1/nvim/blob/one/lua/young/lsp/providers/pyright.lua
lspconfig.pyright.setup {
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(vim.fn.getcwd())
  end,
}
