local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Define custom CD commands
vim.api.nvim_create_user_command('CDMomentum', function()
  vim.cmd('cd D:/Projects/momentum/')
  print("Changed directory to Momentum!")
end, {})

vim.api.nvim_create_user_command('CDShards', function()
  vim.cmd('cd D:/Projects/Shards/')
  print("Changed directory to Shards!")
end, {})

vim.api.nvim_create_user_command('CDNotes', function()
  vim.cmd('cd D:/Koofr/Notes/')
  print("Changed directory to notes!")
end, {})

-- Quick CD Menu
vim.keymap.set('n', '<C-o>', function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values

  pickers.new({}, {
    prompt_title = "Jump to Folder",
    finder = finders.new_table({
      results = { "Momentum", "Notes", "Config", "Shards" },
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        local paths = {
          ["Momentum"] = "D:/Projects/momentum/",
          ["Notes"] = "D:/Koofr/Notes/",
          ["Config"] = "~/AppData/Local/nvim/",
          ["Shards"] = "D:/Projects/shards/",
        }
        
        -- 🚀 Close the Telescope picker first
        actions.close(prompt_bufnr)

        -- Change directory
        vim.cmd('cd ' .. paths[selection[1]])
        print("Changed directory to " .. paths[selection[1]])
      end)
      return true
    end,
  }):find()
end, { desc = "Quick CD with Telescope" })

-- Search for a note file
vim.api.nvim_create_user_command("SearchForNote", function()
  builtin.find_files({ cwd = "D:/Koofr/Notes/" })
end, {})

-- Search inside Notes folder
vim.api.nvim_create_user_command("SearchNotes", function()
  builtin.live_grep({ cwd = "D:/Koofr/Notes/" })
end, {})

-- Search for files in Projects folder
vim.api.nvim_create_user_command("SearchForFileInProjects", function()
  builtin.find_files({ cwd = "D:/Projects/" }) 
end, {})

-- Search for a config file
vim.api.nvim_create_user_command("SearchForConfigFile", function()
  builtin.find_files({ cwd = "~/AppData/Local/nvim/" }) 
end, {})

-- Quick create a new file inside the Notes folder
local function create_file_in_directory(directory)
  local file = vim.fn.input("New file: ", directory .. "/", "file")
  if file ~= "" then
    vim.cmd("edit " .. file)
  end
end

-- Create a file in your documentation directory
vim.api.nvim_create_user_command("NewNote", function()
  create_file_in_directory("D:/Koofr/Notes/Inbox")
end, {})

-- Create a file in your documentation directory
vim.api.nvim_create_user_command("NewFileInShards", function()
  create_file_in_directory("D:/Projects/shards")
end, {})

function TodoSearch()
  local todo_file = vim.fn.expand("D:/Koofr/Notes/Todos/Todo.md")
  
  -- Use Telescope's grep_string in a specific file with @ pre-filled
  require('telescope.builtin').grep_string({
    prompt_title = "Todo Items",
    search = "@",
    search_dirs = { todo_file },
    path_display = { "hidden" },
  })
end

-- Setup keybinding
vim.api.nvim_set_keymap('n', '<leader>t', ':lua TodoSearch()<CR>', { noremap = true, silent = true })
