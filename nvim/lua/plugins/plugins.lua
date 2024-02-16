return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-media-files.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      timeout_ms = 10000,
    },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup({
        perspective = {
          priority = "root",
          root_tell = "index.md",
        },
        filetypes = { md = true, markdown = true },
        new_file_template = {
          use_template = true,
          template = [[
# {{ title }}
Date: {{ date }}
Filename: {{ filename }}
]],
          placeholders = {
            before = {
              date = function()
                return os.date("%A, %B %d, %Y") -- Wednesday, March 1, 2023
              end,
            },
            after = {
              filename = function()
                return vim.api.nvim_buf_get_name(0)
              end,
            },
          },
        },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    log_level = vim.log.levels.DEBUG,
    opts = {
      format = {
        timeout_ms = 5000,
      },
      formatters = {
        sqlfluff = {
          args = { "fix", "--force", "--templater", "jinja", "-" },
        },
      },
      formatters_by_ft = {
        ["javascript"] = { { "prettierd", "prettier" } },
        ["javascriptreact"] = { { "prettierd", "prettier" } },
        ["typescript"] = { { "prettierd", "prettier" } },
        ["typescriptreact"] = { { "prettierd", "prettier" } },
        ["vue"] = { { "prettierd", "prettier" } },
        ["css"] = { { "prettierd", "prettier" } },
        ["scss"] = { { "prettierd", "prettier" } },
        ["less"] = { { "prettierd", "prettier" } },
        ["html"] = { { "prettierd", "prettier" } },
        ["json"] = { { "prettierd", "prettier" } },
        ["jsonc"] = { { "prettierd", "prettier" } },
        ["yaml"] = { { "prettierd", "prettier" } },
        ["markdown"] = { { "prettierd", "prettier" } },
        ["markdown.mdx"] = { { "prettierd", "prettier" } },
        ["graphql"] = { { "prettierd", "prettier" } },
        ["handlebars"] = { { "prettierd", "prettier" } },
        ["python"] = { "isort", "black" },
        ["lua"] = { "stylua" },
        ["shell"] = { "shfmt" },
        ["sh"] = { "shfmt" },
        ["zsh"] = { "shfmt" },
        ["go"] = { "gofumpt", "goimports" },
        ["rust"] = { "rustfmt" },
        ["sql"] = { "sqlfluff" },
      },
    },
  },
  {
    "prisma/vim-prisma",
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
      if require("lazyvim.util").has("nvim-dap-python") then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend("force", opts, {
        parents = 1,
        name = { ".venv", ".env", "venv", "env" },
        fd_binary_name = "fd",
      })
    end,
  },
  { "Olical/conjure", ft = { "clojure", "aniseed", "fennel", "lisp" } },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "nvim-lua/plenary.nvim",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(
        vim.list_extend(opts.sources, { { name = "emoji" }, { name = "mkdnflow" }, { name = "conjure" } })
      )
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/dbt" } })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      yaml = true,
      sql = true,
    },
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup({
        -- config goes here
      })
    end,
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function()
      local logo = [[
┬  ┌─┐┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┌─┐┌─┐  ┌─┐┌─┐┌─┐┬┌┬┐┌─┐┬  ┬┌─┐┌┬┐  ┌─┐┬┌┬┐┬ ┬┬  ┌─┐┌┬┐┌─┐┬─┐
│  ├─┤ │ ├┤   └─┐ │ ├─┤│ ┬├┤   │  ├─┤├─┘│ │ ├─┤│  │└─┐│││  └─┐│││││ ││  ├─┤ │ │ │├┬┘
┴─┘┴ ┴ ┴ └─┘  └─┘ ┴ ┴ ┴└─┘└─┘  └─┘┴ ┴┴  ┴ ┴ ┴ ┴┴─┘┴└─┘┴ ┴  └─┘┴┴ ┴└─┘┴─┘┴ ┴ ┴ └─┘┴└─
]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
