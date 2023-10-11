return {
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},

	-- {
	-- 	-- Add indentation guides even on blank lines
	-- 	-- See `:help indent_blankline.txt`
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	opts = {
	-- 		char = "┊",
	-- 		show_trailing_blankline_indent = false,
	-- 		use_treesitter = true,
	-- 		-- filetype = {'vim', 'lua', 'json', 'ruby', 'javascript', 'typescript'},
	-- 		filetype_exclude = {'startify'},
	-- 	},
	-- },

	-- "gc" to comment visual regions/lines
{
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	keys = { { "gc", mode = { "n", "v" } }, { "gcc", mode = { "n", "v" } }, { "gbc", mode = { "n", "v" } } },
	config = function(_, _)
		local opts = {
			ignore = "^$",
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		}
		require("Comment").setup(opts)
	end,
},
}

