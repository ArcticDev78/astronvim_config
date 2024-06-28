return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- My custom Find-and-Replace keybinding for the Grug-Far plugin
          ["<Leader>fR"] = { "<cmd>GrugFar<cr>", desc = "Find and Replace" },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          ["<Leader>gg"] = {
            "<cmd>Neogit<cr>",
            desc = "Neogit toggle",
          },

          -- Open compiler
          -- vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true }),
          ["<F6>"] = { "<cmd>CompilerOpen<cr>" },

          -- Redo last selected option
          -- vim.api.nvim_set_keymap(
          --   "n",
          --   "<S-F6>",
          --   "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
          --     .. "<cmd>CompilerRedo<cr>",
          --   { noremap = true, silent = true }
          -- ),

          -- Toggle compiler results
          -- vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true }),

          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
          -- ["<F6>"] = { "<cmd>CompilerOpen<cr>" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
