config_home = vim.fn.stdpath("config")
nv_config = os.getenv("NV_CONFIG")

-- default setup
config = {}
config.default = {}
config.default.active = true

-- wiki setup
config.wiki = {}
config.wiki.base = false
if nv_config == "wiki" then
  config.wiki.base = true
end

-- pde setup
config.pde = {}
config.pde.harpoon = false
config.pde.nvim_surround = false
if nv_config == "pde" then
  config.pde.harpoon = true
  config.pde.nvim_surround = true
end

-- print(vim.inspect(config))
