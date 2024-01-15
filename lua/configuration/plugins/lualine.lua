return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local function cat()
      return "󰄛 "
    end

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "material"
      },
      sections = {
        lualine_x = {
          { cat },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" }
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" }
        }
      }
    })
  end
}
