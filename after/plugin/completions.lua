local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')

require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-o>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = 'buffer' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'snippy' },
		{ name = "cmp_tabnine"},
		{ name = 'calc' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = "git" },
		{ name = "crates" },
		{ name = "dictionary"},
	}),
	formatting = {
		format = function(entry, vim_item)
			-- if you have lspkind installed, you can use it like
			-- in the following line:
	 		vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
	 		vim_item.menu = source_mapping[entry.source.name]
	 		if entry.source.name == "cmp_tabnine" then
	 			local detail = (entry.completion_item.data or {}).detail
	 			vim_item.kind = ""
	 			if detail and detail:find('.*%%.*') then
	 				vim_item.kind = vim_item.kind .. ' ' .. detail
	 			end

	 			if (entry.completion_item.data or {}).multiline then
	 				vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
	 			end
	 		end
	 		local maxwidth = 80
	 		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
	 		return vim_item
	  end,
  },
})

require("cmp_git").setup()
