return {
  "ThePrimeagen/harpoon",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  enabled = config.pde.harpoon;
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    save_on_toggle = true,
  },
  init = function()
    require("telescope").load_extension('harpoon')
  end,
  keys = {
    { "<S-h><S-h>", "<CMD>Telescope harpoon marks<CR>", desc = "Harpoon UI" },
    { "<S-h>a", "<CMD>lua require('harpoon.mark').add_file()<CR>", desc = "Harpoon add file" },
  },
}

