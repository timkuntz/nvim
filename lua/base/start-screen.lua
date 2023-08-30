return {
  "mhinz/vim-startify",
  dependencies = {
    "natecraddock/workspaces.nvim",
  },
  lazy = false,
  init = function()
    -- don't change the directory to the directory
    -- of the selected file
    vim.g.startify_change_to_dir = 0

    -- automatically save the loaded session on quit
    vim.g.startify_session_persistence = 1

    local workspaces = require('workspaces')
    -- call workspaces setup so the Workspace* commands are available
    workspaces.setup({})

    -- returns the list of registered workspaces added through :WorkspaceAdd
    -- along with the command for opening them
    local workspaceList = function()
      local items = {}
      for _, props in pairs(workspaces.get()) do
        -- Startify does not support 'cmd' as a function so we call a custom
        -- global function as though we typed it in the vim command line
        table.insert(items, { line = props.name, cmd = 'lua CustomWorkspaceOpen("' .. props.name .. '")' })
      end
      return items
    end

    -- create a local function for return the default startify lists with
    -- a new workspaces list at the top
    local buildStartifyLists = function()
      return {
        { header = { 'Sessions' },                type = 'sessions' },
        { header = { 'MRU ' .. vim.fn.getcwd() }, type = 'dir' },
        { header = { 'MRU' },                     type = 'files' },
        { header = { 'Workspaces' },              type = workspaceList },
        { header = { 'Bookmarks' },               type = 'bookmarks' },
        { header = { 'Commands' },                type = 'commands' },
      }
    end

    -- a new global function for opening the workspaces
    CustomWorkspaceOpen = function(workspaceName)
      workspaces.open(workspaceName)
      -- rebuild the lists after changing workspace directories
      vim.g.startify_lists = buildStartifyLists()
      -- refresh the startify buffer so the new workspace directory
      -- appears in the "MRU <path>" header
      vim.cmd('Startify')
    end

    vim.g.startify_lists = buildStartifyLists()
  end
}

