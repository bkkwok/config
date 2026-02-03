return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ONLY vtsls. No mason-lspconfig auto setup.
    lspconfig.vtsls.setup({
      capabilities = capabilities,
      settings = {
        typescript = {
          suggest = { autoImports = true },
        },
        javascript = {
          suggest = { autoImports = true },
        },
      },
    })

    local cmp = require("cmp")
    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
      },
      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },
    })
  end,
}

