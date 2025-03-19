return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP support
        "hrsh7th/cmp-buffer", -- Buffer completions
        "hrsh7th/cmp-path", -- File path completions
        "L3MON4D3/LuaSnip", -- ✅ Replace VimSnip with LuaSnip
        "saadparwaiz1/cmp_luasnip", -- ✅ Connect LuaSnip to nvim-cmp
        "onsails/lspkind.nvim", -- VSCode-like icons
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- ✅ Use LuaSnip
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.close(),
                ["<Tab>"] = cmp.mapping.confirm { select = true },
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- ✅ Corrected from vsnip
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- Enable LuaSnip
        -- require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
    end,
}
