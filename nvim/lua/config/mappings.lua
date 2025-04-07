local builtin = require('telescope.builtin')
local dap = require('dap')

vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- STANDARD
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<ESC>:w<CR>a")
map("n", "<C-q>", ":q<CR>")
map("n", "ss", ":vs<CR>")
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-l>", ":wincmd l<CR>")

map("v", "<C-h>", "<")
map("v", "<C-l>", ">")

map("i", "<C-h>", "<ESC>ha")
map("i", "<C-j>", "<ESC>ja")
map("i", "<C-k>", "<ESC>ka")
map("i", "<C-l>", "<ESC>la")

-- Quick access
map("n", "<C-p>", builtin.find_files, { desc = "Look through files" }) 
map("n", "<C-f>", builtin.live_grep, { desc = "Live Grep" }) 
map("n", "<C-t>", "<ESC>:TodoBrowser<CR>")

map("n", "<leader>t", "<ESC>:SearchForNote<CR>")
map("n", "<leader>f", "<ESC>:SearchNotes<CR>")
map("n", "<leader>s", "<ESC>:SearchForConfigFile<CR>")
map("n", "<leader>o", "<ESC>:SearchForFileInProjects<CR>")
map("n", "<leader>n", "<ESC>:SearchForNote<CR>")

-- Development
-- Toggle comments
map("n", "<M-c>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<M-c>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- LSP
map('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<S-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<S-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>') 
map("n", "<C-y>", builtin.lsp_references, { desc = "Find all references" }) 
map("n", "<C-g>", builtin.lsp_document_symbols, { desc = "Show all document symbols" })

map("n", "<C-x>", function()
  builtin.diagnostics({
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 15, -- Adjust height as needed
      preview_cutoff = 800, -- Hide preview when narrow
    },
  })
end, { desc = "Show project diagnostics" })

-- GODOT
map('n', '<F5>', '<cmd>GodotRun<cr>')
map('n', '<F6>', '<cmd>GodotRunFZF<cr>')

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single",
    width = 250,
    offset_x = 0,
    pad_top = 0,
    pad_bottom = 0,
    pad_left = 0,
    pad_right = 0
  }
)

vim.keymap.set('n', '<C-i>', vim.lsp.buf.hover, { desc = "Show hover with custom border and background" })
vim.keymap.set('i', '<C-i>', vim.lsp.buf.hover, { desc = "Show hover with custom border and background" })

-- @Note: These are currently copied from the default, which is why they are not using my setup
-- Keymappings for debugging
vim.keymap.set('n', '<F9>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
