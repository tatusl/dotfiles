require("mason").setup()
mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    "terraformls",
    "jedi_language_server"
  }
})
mason_lspconfig.setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup {
      on_attach = require("user.lsp.shared").on_attach,
    }
  end
})
