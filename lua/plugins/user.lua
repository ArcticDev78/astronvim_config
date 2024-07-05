-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },
  { "Mofiqul/adwaita.nvim", lazy = false },
  -- { "wfxr/minimap.vim", lazy = false },
  {
    "wfxr/minimap.vim",
    build = "cargo install --locked code-minimap",
    --cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    init = function()
      -- vim.g.minimap_width = 10
      -- vim.g.minimap_auto_start = true
      -- vim.g.minimap_auto_start_win_enter = true
      -- vim.g.minimap_highlight_range = true
      -- vim.g.minimap_highlight_search = true
      -- vim.g.minimap_git_colors = true
      vim.cmd "let g:minimap_width = 10"
      vim.cmd "let g:minimap_auto_start = 1"
      -- vim.cmd "let g:minimap_auto_start_win_enter = 1"
      vim.cmd "let g:minimap_highlight_range = 1"
      vim.cmd "let g:minimap_highlight_search = 1"
      vim.cmd "let g:minimap_git_colors = 1"
    end,
    lazy = false,
  },
  { "sindrets/winshift.nvim", lazy = false },
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  -- "f-person/auto-dark-mode.nvim",
  -- lazy = false,
  -- config = {
  --   update_interval = 1000,
  --   set_dark_mode = function()
  --     vim.api.nvim_set_option("background", "dark")
  --     vim.cmd("colorscheme astrodark")
  --   end,
  --   set_light_mode = function()
  --     vim.api.nvim_set_option("background", "light")
  --     vim.cmd("colorscheme astrolight")
  --   end,
  --   },
  -- },
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function() require("live-server-nvim").setup {} end,
  },
  { "ActivityWatch/aw-watcher-vim", lazy = false },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {
      -- Your options go here
      name = { "venv", ".venv" },
      dap_enabled = true,
      -- auto_refresh = false
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  },
  {
    "rcarriga/nvim-notify",
    require("notify").setup {
      timeout = 600,
      stages = "fade_in_slide_out",
    },
    lazy = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      config = function()
        require("noice").setup {
          lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
          },
          -- you can enable a preset for easier configuration
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        }
      end,
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      -- "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = function() require("neogit").setup {} end,
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        -- " █████  ███████ ████████ ██████   ██████",
        -- "██   ██ ██         ██    ██   ██ ██    ██",
        -- "███████ ███████    ██    ██████  ██    ██",
        -- "██   ██      ██    ██    ██   ██ ██    ██",
        -- "██   ██ ███████    ██    ██   ██  ██████",
        -- " ",
        -- "    ███    ██ ██    ██ ██ ███    ███",
        -- "    ████   ██ ██    ██ ██ ████  ████",
        -- "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        -- "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        -- "    ██   ████   ████   ██ ██      ██",

        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    config = function() require("grug-far").setup() end,
  },
  {
    "folke/edgy.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>F"] = { function() require("edgy").toggle() end, desc = "Toggle Sidebars" },
              ["<Leader>f"] = { function() require("edgy").select() end, desc = "Pick Sidebar" },
            },
          },
        },
      },
    },
    opts = {
      exit_when_last = false,
      bottom = {
        { ft = "trouble", title = "Problems", pinned = true },
        {
          ft = "toggleterm",
          title = "Terminal",
          size = { height = 0.3 },
          -- exclude floating windows
          filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
        },
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- don't open help files in edgy that we're editing
          filter = function(buf) return vim.bo[buf].buftype == "help" end,
        },
      },
      left = {
        -- "neo-tree",
        {
          title = "Files",
          ft = "neo-tree",
          filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
          pinned = true,
          open = "Neotree position=left filesystem",
          size = { height = 0.5 },
        },
        -- {
        --   title = "Git Status",
        --   ft = "neo-tree",
        --   filter = function(buf) return vim.b[buf].neo_tree_source == "git_status" end,
        --   pinned = true,
        --   open = "Neotree position=right git_status",
        -- },
        -- {
        --   title = "Buffers",
        --   ft = "neo-tree",
        --   filter = function(buf) return vim.b[buf].neo_tree_source == "buffers" end,
        --   pinned = true,
        --   open = "Neotree position=top buffers",
        -- },
        {
          ft = "aerial",
          title = "Symbol Outline",
          pinned = true,
          open = function() require("aerial").open() end,
          size = { height = 0.2 },
        },
      },
      -- right = {
      -- {
      --   ft = "aerial",
      --   title = "Symbol Outline",
      --   pinned = true,
      --   open = function() require("aerial").open() end,
      -- },
      -- { ft = "minimap", title = "Minimap", pinned = true, size = { width = 0.1 } },
      -- },
      keys = {
        -- increase width
        ["<C-Right>"] = function(win) win:resize("width", 2) end,
        -- decrease width
        ["<C-Left>"] = function(win) win:resize("width", -2) end,
        -- increase height
        ["<C-Up>"] = function(win) win:resize("height", 2) end,
        -- decrease height
        ["<C-Down>"] = function(win) win:resize("height", -2) end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      source_selector = {
        winbar = true,
        statusline = false,
      },
    },
  },
}
