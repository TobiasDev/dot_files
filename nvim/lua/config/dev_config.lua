local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-b>"] 		= cmp.mapping.scroll_docs(-4),
    ["<C-f>"] 		= cmp.mapping.scroll_docs(4),
    ["<C-Space>"] 	= cmp.mapping.complete(),
    ["<C-e>"] 		= cmp.mapping.abort(),
    ["<Tab>"] 		= cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name 	= "nvim_lsp" }, 
    { name 	= "luasnip" },
  }, {
    { name 	= "buffer" },
    { name 	= "path" },
  }),
})

local dap = require('dap')
dap.adapters.godot = {
  type = "server",
  host = '127.0.0.1',
  port = 6006,
}


require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })

require("lspconfig").gdscript.setup{}
require("lspconfig").gdshader_lsp.setup{}

require("todo-comments").setup{}

require("nvim-autopairs").setup{}

require("Comment").setup{}
