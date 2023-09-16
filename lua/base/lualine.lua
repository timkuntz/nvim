return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'RRethy/nvim-base16',
  },
  enabled = config.base.lualine.active,
  -- See `:help lualine.txt`
  init = function()
    -- loading this has negative side-effects on telescope input
    -- require('base16-colorscheme').setup()

    local lualine = require('lualine')

    local lsp = {
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = ' LSP:',
    }

    local colorscheme_mode = {
      function()
        return vim.o.background == "light" and "󰖨" or ""
      end,
      on_click = function(_, _)
        if vim.o.background == "light" then
          vim.o.background = "dark"
        else
          vim.o.background = "light"
        end
      end,
    }

    local home = {
      function()
        return ""
      end,
      on_click = function()
        vim.cmd "Startify"
        vim.cmd "only"
      end,
    }

    local config = {
      options = {
        icons_enabled = true,
        -- theme = 'base16',
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = { lsp },
        lualine_y = {'encoding', 'fileformat', 'filetype'},
        lualine_z = {'progress', 'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
          tabline = {
            lualine_a = { home },
            lualine_b = { 'buffers' },
            lualine_c = {},
            lualine_x = {},
            lualine_y = { 'tabs' },
            lualine_z = { colorscheme_mode }
          },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }

    lualine.setup(config)
  end,
}
