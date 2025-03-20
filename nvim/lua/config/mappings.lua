local builtin = require('telescope.builtin')

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
map("v", "<leader>c", '"+y')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

map("v", "<C-h>", "<")
map("v", "<C-l>", ">")

map("i", "<C-h>", "<ESC>ha")
map("i", "<C-j>", "<ESC>ja")
map("i", "<C-k>", "<ESC>ka")
map("i", "<C-l>", "<ESC>la")

-- Quick access
map("n", "<C-p>", "<ESC>:Telescope find_files<CR>")
map("n", "<C-f>", "<ESC>:Telescope live_grep<CR>")
map("n", "<C-t>", "<ESC>:TodoTelescope<CR>")

map("n", "<leader>t", "<ESC>:SearchForNote<CR>")
map("n", "<leader>f", "<ESC>:SearchNotes<CR>")
map("n", "<leader>s", "<ESC>:SearchForConfigFile<CR>")
map("n", "<leader>o", "<ESC>:SearchForFileInProjects<CR>")

-- Development
-- Toggle comments
map("n", "<M-c>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<M-c>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

-- LSP
map('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<C-j>', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
map('n', '<C-r>', '<cmd>lua vim.lsp.buf.rename()<cr>')
map('n', '<S-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<S-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts) 
map("n", "<C-u>", builtin.lsp_references, { desc = "Find all references" }) 
map("n", "<C-g>", builtin.lsp_document_symbols, { desc = "Show all document symbols" })
-- map("n", "<C-x>", builtin.diagnostics, { desc = "Show project diagnostics" })


map("n", "<C-x>", function()
  builtin.diagnostics({
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 15, -- Adjust height as needed
      preview_cutoff = 1000, -- Hide preview when narrow
    },
  })
end, { desc = "Show project diagnostics" })


-- GODOT
map('n', '<F5>', '<cmd>GodotRun<cr>', opts)
map('n', '<F6>', '<cmd>GodotRunFZF<cr>', opts)

