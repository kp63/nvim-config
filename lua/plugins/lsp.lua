return {
  -- Mason: external tool manager
  {
    "mason-org/mason.nvim",
    cmd = { "Mason" },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason <-> LSPConfig bridge (install & enable)
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",
        "lua_ls",
      },

      automatic_enable = {
        "ts_ls",
        "lua_ls",
      },
    },
  },

  -- LSP core configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- TypeScript / JavaScript (ts_ls)
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          hostInfo = "neovim",
          preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
          },
        },
      })

      -- Lua (lua_ls)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- LspAttach: key mapping
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf

          -- Enable inlay hints if supported
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end

          local opts = { buffer = bufnr, silent = true }
          local map = vim.keymap.set

          -- Telescope がある場合は Telescope 優先、無ければ標準LSPへフォールバック
          local has_telescope, tb = pcall(require, "telescope.builtin")

          if has_telescope then
            map("n", "gd", tb.lsp_definitions, opts)
            map("n", "gr", tb.lsp_references, opts)
            map("n", "gI", tb.lsp_implementations, opts)
            map("n", "gy", tb.lsp_type_definitions, opts)
          else
            map("n", "gd", vim.lsp.buf.definition, opts)
            map("n", "gr", vim.lsp.buf.references, opts)
            map("n", "gI", vim.lsp.buf.implementation, opts)
            map("n", "gy", vim.lsp.buf.type_definition, opts)
          end

          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "gK", vim.lsp.buf.signature_help, opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "<leader>cr", vim.lsp.buf.rename, opts)
          map("n", "<leader>cd", vim.diagnostic.open_float, opts)

          map("n", "[d", function()
            vim.diagnostic.jump({ count = -1 })
          end, opts)
          map("n", "]d", function()
            vim.diagnostic.jump({ count = 1 })
          end, opts)

          -- Optional: inlay hints (only for supported servers)
          map("n", "<leader>ch", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
          end, opts)
        end,
      })

      -- 診断表示
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
  },
}
