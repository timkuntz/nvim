-- config_home = vim.fn.stdpath("config")
local nv_config = os.getenv("NV_CONFIG")

-- default setup
config = {}
config.base = {}
config.base.active = true
config.base.lualine = {}
config.base.lualine.active = true
config.base.telescope = false
config.base.fzf_lua = not config.base.telescope

-- wiki setup
config.wiki = {}
config.wiki.base = false
if nv_config == "wiki" then
  config.wiki.base = true
end

-- pde setup
-- local is_pde = nv_config == "pde"
config.pde = {}
config.pde.copilot = true
config.pde.git = true
config.pde.git_worktree = true
config.pde.harpoon = false
config.pde.nvim_surround = true

-- print(vim.inspect(config))
