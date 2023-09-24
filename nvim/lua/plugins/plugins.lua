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
  -- {
  --   "renerocksai/telekasten.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",
  --     "renerocksai/calendar-vim",
  --     "nvim-telescope/telescope-media-files.nvim",
  --   },
  --   opts = {
  --     home = vim.fn.expand("~/writing"),
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      timeout_ms = 10000,
      autoformat = true,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.black,
        nls.builtins.formatting.isort,
      })
    end,
  },
  {
    "prisma/vim-prisma",
  },
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
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" }, { name = "mkdnflow" } }))
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
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                !!!"..?!!.' ......        !!!!!!!
                !!! e2$ .<!!!!!!!!!`~!~!!!!!!~! ""!`.`
                !!!!^:!!!!!!!!!!!!!!.:!!!!!!!!! *@ !4:'
               . >! !!!!!!!!!!!!!!!!!:^:!!!!!!!!:  J!:
               .!! ,<!!!!!!!!!!!!!...`*."!!!!!!!!!!.~~
               !!~!!!!!!!!!f !!!! #$$$$$$b`!!!!!L!!!(
              !!! ! !!!!! !>b"!!!!. ^$$$*"!!~!4!!!!!!`x
             .!!!! !`!! d "= "$N !!f u `!!!~' !!!!!!!!!
             !!!!!  !XH.=m" C..^*$!.  .~L:u@ !! !!!!~:`  Let's get this dread!
            !!!!!   '`"*:$$P k  $$$$e$R""" mee"<!!!!!
           :!!!!"    $N $$$  * x$$$$$$$   <-m.` !!!!!'<!
          .!!!!f     "$ $$$.  u$$$$$$$e $ : ee `  !`:!!!`
          !!!!!.        $$$$$$$$$$$ $$   u$$" r'    !!!!!             ~4
         !!!!!          "$$$$$$&""%$$$ee$$$ @"      !!!!!h            $b`
        !!!!!             $$$$     $$$$$$$           !!!!!           @$
       !!!!! X             "&$c   $$$$$"              !!!!!       `e$$
      !!!!! !              $$."***""                   !!!!h     z$$$$$$$$$$$$$$eJ
     !!!!! !!     .....     ^"'$$$            $         !!!!    J$$$$$$$$$$$"
     !!!! !!  .d$$$$$$$$$$e( <  d            4$          ~!!! z$$F$$$$$$$$$$b
     !!! !!  J$$$$$$*****$$$$. "J<=    t'b  `)$b' ,C)`    `!~@$$$$$J'$$$$$$$
     !!~:!   $$$$"e$$$$$$$$c"$N". - ". :F$ ?P"$$$ #$$      .$$$$$$$FL$$$$$$$
     !`:!    $$"$$$$$$$$$$$$$$e $$$.   '>@ z$&$$$eC$"    .d$$$$$$$P      "*$$.
      !!     #$$$$$$$*"zddaaa""e^*F""*. "$ $$P.#$$$$E:: d$$$$$$$$           ^$
     !!~      ;$$$$"d$$$$$$$$$$$$$u       $c#d$$@$\$>`x$$$$$$$$"             "c
     !!        ;e?(."$$$$$$$$$$$$$$$$u     "$NJ$$$d"x$$$$$$$$$
]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
  },
}
