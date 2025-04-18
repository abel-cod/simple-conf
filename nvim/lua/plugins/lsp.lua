return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      --{ "golang/go", build = ":GoInstallBinaries" }, -- For gopls
      "rust-lang/rust-analyzer",
      "clangd/clangd",
      "zigtools/zls",
      "jose-elias-alvarez/null-ls.nvim", -- Optional: For formatters/linters
      "nvim-lua/plenary.nvim",         -- Required by null-ls
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Common settings for all LSPs
      local common_settings = {
        on_attach = function(client, bufnr)
          local keymap = vim.api.nvim_buf_set_keymap
          local opts = { noremap = true, silent = true }

          -- Go to definition
          keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          -- Show hover information
          keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          -- Show signature help
          keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
          -- Rename symbol
          keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
          -- Code actions
          keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
          -- Show diagnostics in a floating window
          keymap(bufnr, 'n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
          -- Go to previous diagnostic
          keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
          -- Go to next diagnostic
          keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
          -- Format the buffer (requires a formatter configured)
          keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      }

      -- Setup for gopls (Go)
      lspconfig.gopls.setup(vim.tbl_deep_extend("force", common_settings, {}))

      -- Setup for rust-analyzer (Rust)
      lspconfig.rust_analyzer.setup(vim.tbl_deep_extend("force", common_settings, {
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = true,
            },
          },
        },
      }))

      -- Setup for clangd (C/C++)
      lspconfig.clangd.setup(vim.tbl_deep_extend("force", common_settings, {}))

      -- Setup for zls (Zig)
      lspconfig.zls.setup(vim.tbl_deep_extend("force", common_settings, {}))
      -- Setup for pyright (Python)
      lspconfig.pyright.setup(vim.tbl_deep_extend("force", common_settings, {}))
    end,
  },
}
