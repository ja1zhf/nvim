return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
   dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local fb_actions = require "telescope".extensions.file_browser.actions

    local function telescope_buffer_dir()
      return vim.fn.expand("%:p:h")
    end

    telescope.setup({
      extensions = {
        file_browser = {
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
          layout_config = { height = 40 },
          theme = "dropdown",
          hijack_netrw = true,
          display_stat = false,
          mappings = {
            ["n"] = {
              ["a"] = fb_actions.create,
              ["d"] = fb_actions.remove,
              ["r"] = fb_actions.rename
            }
          }
        }
      }
    })

    telescope.load_extension("file_browser")

    local keymap = vim.keymap

    keymap.set('n', '<leader>f', function()
      builtin.find_files({
        no_ignore = false
      })
    end)
    keymap.set('n', '<leader>r', function()
      builtin.live_grep()
    end)
    keymap.set('n', '<leader>d', function()
      builtin.diagnostics()
    end)
    keymap.set("n", "<leader>e", function()
      telescope.extensions.file_browser.file_browser()
    end)
  end
}
