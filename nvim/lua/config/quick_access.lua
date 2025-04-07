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

-- Function to search for predefined todo tags across the project
function TodoBrowser()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  
  -- Define your todo tags here
  local todo_tags = {
    "@Todo",
    "@Bug", 
    "@Refactor",
    "@Note",
    "@Optimize",
    "@Performance",
    "@Fixme",
    "@Hack"
  }
  
  -- File extensions to search
  local file_extensions = { "gd", "ini", "csv", "md", "txt", "json", "tscn" }
  
  -- Build the grep command with all tags as alternatives
  local tag_pattern = table.concat(todo_tags, "|")
  
  -- Define the base grep command
  local grep_command = {"rg", "--color=never", "--line-number", "--column", "--smart-case", "--with-filename"}
  
  -- Add file extension patterns
  for _, ext in ipairs(file_extensions) do
    table.insert(grep_command, "--glob=**/*." .. ext)
  end
  
  -- Exclude .git directory
  table.insert(grep_command, "--glob=!.git/*")
  
  -- Add the pattern
  table.insert(grep_command, "-e")
  table.insert(grep_command, "(" .. tag_pattern .. ")")
  
  -- Add the search directory
  table.insert(grep_command, vim.fn.getcwd())
  
  -- Create the picker with default configuration
  local opts = {
    prompt_title = "Todo Tags",
    initial_mode = "normal",
    attach_mappings = function(prompt_bufnr, map)
      -- Default action to open the file
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if not selection then return end
        
        actions.close(prompt_bufnr)
        
        -- Extract file data from selection
        if selection.filename then
          -- Direct opening of the file at the correct line/column
          vim.cmd("edit " .. vim.fn.fnameescape(selection.filename))
          vim.api.nvim_win_set_cursor(0, {selection.lnum, (selection.col or 1) - 1})
        end
      end)
      
      return true
    end
  }
  
  -- Create and run the picker with proper parsing of ripgrep output
  pickers.new(opts, {
    finder = finders.new_oneshot_job(
      grep_command,
      {
        entry_maker = function(line)
          -- Parse the ripgrep output format: filename:line:column:text
          local filename, lnum, col, text = line:match("(.+):(%d+):(%d+):(.*)")
          
          if not filename then return nil end
          
          return {
            value = line,
            ordinal = line,
            display = line,
            filename = filename,
            lnum = tonumber(lnum),
            col = tonumber(col),
            text = text
          }
        end
      }
    ),
    sorter = conf.generic_sorter({}),
    previewer = conf.grep_previewer({}),
  }):find()
end

-- Command version
vim.api.nvim_create_user_command('TodoBrowser', TodoBrowser, {})
