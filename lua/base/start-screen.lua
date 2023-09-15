return {
  "mhinz/vim-startify",
  dependencies = {
    "natecraddock/workspaces.nvim",
    "natecraddock/sessions.nvim",
  },
  lazy = false,
  init = function()
    -- don't change the directory to the directory
    -- of the selected file
    vim.g.startify_change_to_dir = 0

    -- disable the 'e' empty buffer and 'q' quit menu
    vim.g.startify_enable_special = 0

    -- automatically save the loaded session on quit
    vim.g.startify_session_persistence = 1

    -- when opening a workspace, create and/or load a session automatically
    -- the session will be unique to the git branch (if it exists)
    -- this will allow different workflows per branch
    require('workspaces').setup({
      hooks = {
        open = function()
          local session_dir = vim.fn.stdpath("data") .. '/' .. 'sessions' .. '/'
          local session_name = vim.fn.getcwd():match("^.+/(.+)$")
          local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
          if branch ~= "" then
            session_name = session_name .. '-' .. branch
          end
          local session_path = session_dir .. session_name
          -- if session exists load, else save (create)
          local f=io.open(session_path,"r")
          if f~=nil then
            io.close(f)
            require("sessions").load(session_path, { silent = true })
            P('Loaded session: ' .. session_path)
          else
            require("sessions").save(session_path, { silent = true })
            P('Created session: ' .. session_path)
          end
        end,
      }
    })
    require('telescope').load_extension("workspaces")

    vim.g.startify_commands = {
      {n = {'  New File', 'enew'}},
      {f = {'  Open File', 'Telescope find_files'}},
      {b = {'  Browse Files', 'NeoTreeFocusToggle'}},
      {o = {'  Open Project', 'Telescope workspaces'}},
      -- TODO open a directory browser so user can select without having to :cd first
      {a = {'  Add Project (current directory)', 'WorkspacesAdd'}},
      {m = {'  Recent files (in project)', "lua require('telescope.builtin').oldfiles({ cwd_only = true })"}},
      {r = {'  Recent files (all)', 'Telescope oldfiles'}},
      {t = {'󰊄  Find Text', 'Telescope live_grep'}},
      {g = {'  Git Change Branch', 'Telescope git_branches'}},
      {p = {'  Plugins (extensions)', 'Lazy'}},
      {q = {'󰅚  Quit', 'qa!'}},
    }

    -- create a local function for return the default startify lists
    local buildStartifyLists = function()
      return {
        { header = { 'Menu' },                    type = 'commands' },
        -- { header = { 'Projects' },                type = workspaceList },
        -- { header = { 'Sessions' },                type = 'sessions' },
        -- { header = { 'MRU ' .. vim.fn.getcwd() }, type = 'dir' },
        -- { header = { 'MRU' },                     type = 'files' },
        -- { header = { 'Bookmarks' },               type = 'bookmarks' },
      }
    end

    vim.g.startify_lists = buildStartifyLists()

    vim.g.startify_custom_footer = {
      ':cd <directory> to add a new project',
    }
  end
}
