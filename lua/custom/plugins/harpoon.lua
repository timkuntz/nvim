return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  enabled = true,
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    save_on_toggle = true,
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    -- require("telescope").load_extension('harpoon')
  end,
  keys = {
    { "<C-j><C-j>", function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end, desc = "Harpoon UI" },
    { "<C-k><C-k>", function() require'harpoon':list():add() end, desc = "Harpoon add file" },
    { "<C-h><C-h>", function() require'harpoon':list():prev() end, desc = "Harpoon prev file" },
    { "<C-l><C-l>", function() require'harpoon':list():next() end, desc = "Harpoon next file" },
  },
}

