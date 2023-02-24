local cmp_status, cmp = pcall(require, 'cmp')
if (not cmp_status) then return end

local lspkind_status, lspkind = pcall(require, 'lspkind')
if (not lspkind_status) then return end

local luasnip_status, luasnip = pcall(require, 'luasnip')
if (not luasnip_status) then return end

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
	 completion = cmp.config.window.bordered(),
	 documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm {
			select = true
		},
		['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
	},
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'luasnip' },
	},
--	formatting = lspkind.cmp_format {
--		mode = 'symbol',
--		maxwidth = 50,
--		ellipsis_char = '...',
--	}
}

for _,v in pairs({ '/', '?' }) do
	cmp.setup.cmdline(v, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
end

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
