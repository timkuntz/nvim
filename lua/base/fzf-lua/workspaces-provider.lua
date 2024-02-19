local actions = require "fzf-lua.actions"
local config = require "fzf-lua.config"
local core = require "fzf-lua.core"
local defaults = require "fzf-lua.defaults"
local make_entry = require "fzf-lua.make_entry"

actions.workspaces = function(selected)
  local workspace = selected[1]
  require('workspaces').open(workspace)
end

defaults.defaults.workspaces = {
  prompt = 'Workspaces > ',
  actions = {
    ["default"] = actions.workspaces,
  },
  live_preview = false,
  winopts      = {
    height = 0.55,
    width  = 0.50,
  },
}

local M = {}

-- function copied from fzf-lua
M.workspaces = function(opts)
  opts = config.normalize_opts(opts, "workspaces")
  if not opts then return end

  local workspaces = require('workspaces').get()

  local contents = function(cb)
    for _, x in ipairs(workspaces) do
      x = make_entry.file(x.name, opts)
      if x then
        cb(x, function(err)
          if err then return end
          -- close the pipe to fzf, this
          -- removes the loading indicator in fzf
          cb(nil)
        end)
      end
    end
    cb(nil)
  end

  opts.fzf_opts["--no-multi"] = ""
  core.fzf_exec(contents, opts)
end

return M
