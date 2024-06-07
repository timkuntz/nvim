-- functions to make it easier to develop Lua plugins
P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require('plenary.reload').reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

MergeTables = function(defaults, custom)
    local newTable = {}
    for key, value in pairs(defaults) do
        newTable[key] = value
    end
    for key, value in pairs(custom) do
        newTable[key] = value
    end
    return newTable
end

RegisterKeys = function(keymap, opts)
  opts = opts or {}
  opts = MergeTables({
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }, opts)

  require('which-key').register(keymap, opts)
end

