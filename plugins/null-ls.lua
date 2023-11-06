return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.ruff,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.clang_format,
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.fourmolu,
    }
    -- set up null-ls's on_attach function
    --[[config.on_attach = function(client)
      -- NOTE: You can remove this on attach function to disable format on save
      if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = vim.lsp.buf.formatting_sync,
        })
      end
    end
    --[[config.on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_augroup("format_on_save", { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          group = "format_on_save",
          pattern = "<buffer>",
          callback = function() vim.lsp.buf.formatting_sync { async = true } end,
        })
      end
    end]]
    --
    return config -- return final config table
  end,
}
