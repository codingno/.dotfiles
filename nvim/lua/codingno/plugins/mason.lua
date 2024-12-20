return {
  "williamboman/mason.nvim",
  lazy = false,
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup()
  end

}
