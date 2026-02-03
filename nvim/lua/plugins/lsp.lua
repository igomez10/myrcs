-- LSP Configuration

return {
  -- Mason: LSP/DAP/Linter installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "[x]",
            package_pending = "[-]",
            package_uninstalled = "[ ]",
          },
        },
      })
    end,
  },

  -- Mason-lspconfig: Bridge between mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",      -- Go
          "pyright",    -- Python
          "lua_ls",     -- Lua
          "jsonls",     -- JSON
          "yamlls",     -- YAML
          "terraformls", -- Terraform
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSPconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Capabilities for autocompletion
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- LspAttach autocmd for keymaps (replaces on_attach)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local bufnr = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
          end

          -- LSP keymaps
          map("n", "gd", vim.lsp.buf.definition, "Go to definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
          map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
          map("n", "gr", vim.lsp.buf.references, "Go to references")
          map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
          map("n", "K", vim.lsp.buf.hover, "Hover documentation")
          map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
          map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("n", "[g", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("n", "]g", vim.diagnostic.goto_next, "Next diagnostic")
          map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
          map("n", "<leader>qf", vim.diagnostic.setloclist, "Diagnostics to loclist")

          -- Highlight references on hold
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_group = vim.api.nvim_create_augroup("LSPDocumentHighlight", { clear = false })
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = highlight_group })
            vim.api.nvim_create_autocmd("CursorHold", {
              group = highlight_group,
              buffer = bufnr,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              group = highlight_group,
              buffer = bufnr,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
      -- Go (gopls)
      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
        },
      })

      -- Python (pyright)
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
              typeCheckingMode = "basic",
            },
          },
        },
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- JSON
      vim.lsp.config("jsonls", {
        capabilities = capabilities,
      })

      -- YAML
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })

      -- Terraform
      vim.lsp.config("terraformls", {
        capabilities = capabilities,
      })

      -- Enable all configured servers
      vim.lsp.enable({ "gopls", "pyright", "lua_ls", "jsonls", "yamlls", "terraformls" })
    end,
  },

  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        python = { "isort", "black" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
      },
      format_on_save = function(bufnr)
        -- Disable for certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
    },
  },

  -- vim-go (kept for Go-specific features)
  {
    "fatih/vim-go",
    ft = { "go", "gomod" },
    build = ":GoUpdateBinaries",
    init = function()
      -- Disable vim-go LSP features (we use gopls via lspconfig)
      vim.g.go_def_mapping_enabled = 0
      vim.g.go_doc_keywordprg_enabled = 0
      vim.g.go_gopls_enabled = 0
      vim.g.go_code_completion_enabled = 0

      -- Keep useful vim-go features
      vim.g.go_fmt_autosave = 0 -- We use conform.nvim
      vim.g.go_imports_autosave = 0
      vim.g.go_fmt_command = "goimports"
      vim.g.go_autodetect_gopath = 1
      vim.g.go_term_enabled = 0

      -- Highlighting
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_build_constraints = 1
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_function_calls = 1
      vim.g.go_highlight_extra_types = 1
      vim.g.go_highlight_generate_tags = 1

      -- Metalinter
      vim.g.go_metalinter_command = "golangci-lint"
      vim.g.go_metalinter_autosave = 0
      vim.g.go_list_type = "quickfix"
      vim.g.go_jump_to_error = 0
    end,
  },
}
