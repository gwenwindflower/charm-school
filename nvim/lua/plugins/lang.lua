return {
  -- Shell
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["shell"] = { "shfmt" },
        ["sh"] = { "shfmt" },
        ["zsh"] = { "shfmt" },
      },
    },
  },

  -- Lua and Fennel
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["lua"] = { "stylua" },
      },
    },
  },
  { "Olical/conjure", ft = { "clojure", "aniseed", "fennel", "lisp" } },
  { "Olical/nfnl", ft = "fennel" },
  -- Markdown
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- I don't like markdownlint so can't use the LazyVim Extras
        -- thus manually adding this
        marksman = {},
      },
    },
  },
  -- JSON
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" })
      end
    end,
  },
  -- Python
  -- LSP Handled by LazyVim Extras Python
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("nvim-dap-python") then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend("force", opts, {
        parents = 1,
        fd_binary_name = "fd",
      })
    end,
    keys = {
      { "<leader>ck", "<cmd>VenvSelectCached<CR>", desc = "Select Cached Venv" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        ["python"] = { "ruff_format" },
      },
    },
  },
  -- TypeScript
  {
    "prisma/vim-prisma",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "svelte" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "ruff-lsp",
        "marksman",
        "mdx-analyzer",
        "astro-language-server",
        "svelte-language-server",
        "prisma-language-server",
        "typescript-language-server",
        "emmet-ls",
        "json-lsp",
        "yaml-language-server",
        "black",
        "isort",
        "sqlfluff",
        "shfmt",
        "stylua",
        "lua-language-server",
      })
    end,
  },
  -- SQL
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "sql" })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      format = {
        timeout_ms = 1000,
      },
      formatters_by_ft = {
        ["sql"] = { "sqlfluff" },
      },
    },
  },
}
