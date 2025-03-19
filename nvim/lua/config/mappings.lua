-- Keep keybindings in a easy location
vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- STANDARD
map('n', '<C-s>', ':w<CR>') 
map('i', '<C-s>', '<ESC>:w<CR>a') 
map('n', '<C-q>', ':q<CR>') 
map('n', 'ss', ':vs<CR>') 
map('n', '<C-h>', ':wincmd h<CR>') 
map('n', '<C-l>', ':wincmd l<CR>') 
map('v', '<leader>c', '"+y')
map('n', '<leader>p', '"+p')
map('v', '<leader>p', '"+p')

map('v', '<C-h>', '<') 
map('v', '<C-l>', '>') 

map('i', '<C-h>', '<ESC>ha')     
map('i', '<C-j>', '<ESC>ja')     
map('i', '<C-k>', '<ESC>ka')     
map('i', '<C-l>', '<ESC>la')     
-- GODOT
map('n', '<F5>', '<cmd>GodotRun<cr>', opts)

-- LSP
-- TODO: These commands might need to change
map('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<S-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<S-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', '<C-j>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

-- Miught be removed
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)

-- TELESCOPE
local builtin = require('telescope.builtin')

map('n', '<C-o>', builtin.lsp_references, { desc = 'Find all references' })
map('n', '<C-p>', builtin.find_files, { desc = 'Find files in current directory' })
map('n', '<C-f>', builtin.live_grep, { desc = 'Live grep in current directory' })
map('n', '<C-g>', builtin.lsp_document_symbols, { desc = 'Show all document symbols ' })

-- NOTE: Using the one from TROUBLE instead, since I can not see the full message with Telescope diagnostics
-- map('n', '<C-x>', builtin.diagnostics, {desc = 'Show project diagnostics'}) 

-- Turned off since I never use them currently, but saved for the future ability of using them
-- map('n', '<C-b>', builtin.buffers, { desc = 'Telescope buffers' })

-- Special search in external folders
map('n', '<leader>t', '<cmd>Telescope find_files search_dirs=D:/Koofr/Notes<cr>', opts)
map('n', '<leader>f', '<cmd>Telescope live_grep search_dirs=D:/Koofr/Notes<cr>', opts)
map('n', '<leader>s', '<cmd>Telescope find_files search_dirs=~/AppData/Local/nvim/<cr>', opts)
map('n', '<leader>o', '<cmd>Telescope find_files search_dirs=D:/Projects<cr>', opts)
map('n', '<leader>of', '<cmd>Telescope live_grep search_dirs=D:/Projects<cr>', opts)

-- TODO
map('n', '<C-t>', ':TodoTelescope<CR>', { desc = 'Telescope find files' })

-- TROUBLE
map('n', '<C-x>', '<cmd>Trouble diagnostics toggle<cr>', opts)

-- CMP
-- NOTE: Sadly I can not figure out how to fully get it working here, and I have therefor simply done all the mappings for it, in the cmp.lua

----- UPDATING VIM
-- MISSING: 
-- NERDTree????
-- Snippets, what is LUASnip or Friendly snippets that comes with CMP
