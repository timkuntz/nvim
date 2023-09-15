config_home = vim.fn.stdpath("config")
nv_config = os.getenv("NV_CONFIG")

-- default setup
config = {}
config.default = {}
config.default.active = true

-- pde setup
config.pde = {}
config.pde.harpoon = false
if nv_config == "pde" then
  config.pde.harpoon = true
end

print(vim.inspect(config))
