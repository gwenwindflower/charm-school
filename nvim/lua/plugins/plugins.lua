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
    keys = {
      { "<Leader>ff", false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      timeout_ms = 10000,
      servers = {
        marksman = {},
      },
    },
  },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = { lsp = { auto_attach = true } },
    keys = {
      { "<Leader>cd", "<cmd>Navbuddy<CR>", desc = "Open Navbuddy" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
  {
    "sotte/presenting.nvim",
    opts = {},
    cmd = { "Presenting" },
    keys = {
      { "<Leader>mg", "<cmd>Presenting<CR>", desc = "Toggle Presenting" },
    },
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
          -- use Jinja templating for speed
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
        ["python"] = { "ruff" },
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
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
    -- stylua: ignore
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = function()
      local opts = {
        bottom = {
          {
            ft = "toggleterm",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          "Trouble",
          {
            ft = "trouble",
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {
          { title = "Neotest Summary", ft = "neotest-summary" },
        },
        right = {
          {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { width = 0.4 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
        },
        keys = {
          -- increase width
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }
      return opts
    end,
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
        resize = {
          enable = false,
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "marksman" })
    end,
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
  { "Olical/nfnl", ft = "fennel" },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
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
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline", "sql", "svelte" })
      end
    end,
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
    keys = {
      { "<Leader>mz", "<cmd>ZenMode<CR>", desc = "Toggle ZenMode" },
    },
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
