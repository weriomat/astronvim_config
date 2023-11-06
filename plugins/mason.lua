-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "clangd",
        -- "bashls",
        "cmake",
        -- "diagnosticls",
        -- "dotls",
        "hls",
        -- "jsonls",
        -- "jdtls",
        -- "marksman"
        -- "nix",
        "pyright",
        "rust_analyzer",
        -- "taplo",
        -- "lemminx",
        -- "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
        "ruff",
        "mypy",
        "black",
        "clang_format",
        "rustfmt",
        "fourmolu",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "python",
        "haskell",
        -- "cppdbg",
        "codelldb",
        -- "bash",
        -- "javadbg",
      })
      --[[handlers = {
        python = function(source_name)
          local dap = require "dap"
          dap.adapters.python = {
            type = "executable",
            command = "/usr/bin/python3",
            args = {
              "-m",
              "debugpy.adapter",
            },
          }

          dap.configurations.python = {
            {
              type = "python",
              request = "launch",
              name = "Launch file",
              program = "${file}", -- This configuration will launch the current file if used.
            },
          }
        end,
      }--]]
    end,
  },
}
