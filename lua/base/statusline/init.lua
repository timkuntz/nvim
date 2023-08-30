return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "meuter/lualine-so-fancy.nvim",
    },
    event = "VeryLazy",
    config = function()
      local components = require "base.statusline.components"

      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = {},
          section_separators = {},
          disabled_filetypes = {
            statusline = { "alpha", "lazy" },
            winbar = {
              "help",
              "alpha",
              "lazy",
            },
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "fancy_mode", width = 3 } },
          lualine_b = { components.git_repo, "branch" },
          lualine_c = {
            { "fancy_cwd", substitute_home = true },
            components.diff,
            { "fancy_diagnostics" },
            components.noice_command,
            components.noice_mode,
            -- { require("NeoComposer.ui").status_recording },
            components.separator,
            components.lsp_client,
          },
          lualine_x = { "filename", components.spaces, "encoding", "fileformat", "filetype", "progress" },
          lualine_y = {},
          lualine_z = { "location" },
        },
        -- tabline = {
        --   lualine_a = {},
        --   lualine_b = { 'buffers' },
        --   lualine_c = {},
        --   lualine_x = {},
        --   lualine_y = { 'tabs' },
        --   lualine_z = {}
        -- },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "neo-tree", "toggleterm", "quickfix" },
      }
    end,
  },
}


