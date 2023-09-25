return {
	-- Git related actions
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		enabled = config.pde.git,
	},
	-- git Hub related actions
	{
		"tpope/vim-rhubarb",
		enabled = config.pde.git,
		keys = {
			{ "<leader>gb", "<Cmd>GBrowse<Cr>", desc = "[G]ithub [B]rowse" },
		},
	},
	-- Adds git releated signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
    enabled = false,
		event = "VeryLazy",
		enabled = config.pde.git,
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}

