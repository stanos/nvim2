--vim.lsp.set_log_level("debug")

local cfg = {
	noice = true
}  -- add your config here
require("lsp_signature").setup(cfg)


local DEFAULT_FQBN = "arduino:avr:uno"

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr }) vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	--Enable completion triggered by <c-x><c-o>
	--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }
	--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	--buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	--vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gii', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	client.server_capabilities.semanticTokensProvider = nil
	--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
	'', -- Text
	'', -- Method
	'', -- Function
	'', -- Constructor
	'', -- Field
	'', -- Variable
	'', -- Class
	'ﰮ', -- Interface
	'', -- Module
	'', -- Property
	'', -- Unit
	'', -- Value
	'', -- Enum
	'', -- Keyword
	'﬌', -- Snippet
	'', -- Color
	'', -- File
	'', -- Reference
	'', -- Folder
	'', -- EnumMember
	'', -- Constant
	'', -- Struct
	'', -- Event
	'ﬦ', -- Operator
	'', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.flow.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.arduino_language_server.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"arduino-language-server",
		"-cli-config", "/Users/stanos/Library/Arduino15/arduino-cli.yaml",
		"-fqbn",
		DEFAULT_FQBN
	}
}

nvim_lsp.vimls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.bashls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.asm_lsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function() return vim.loop.cwd() end
}

nvim_lsp.clangd.setup {
	cmd = { "clangd",
		"--background-index",
		"--clang-tidy",
		"--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
		"--completion-parse=always",
		"--completion-style=bundled",
		"--cross-file-rename",
		"--debug-origin",
		"--function-arg-placeholders",
		"--header-insertion=iwyu",
		"-j=4",		-- number of workers
		-- "--resource-dir="
		"--suggest-missing-includes",
	},
	on_attach = on_attach,
	capabilities = capabilities,
}


nvim_lsp.pylsp.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

nvim_lsp.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = function() return vim.loop.cwd() end,
	extra_paths = {'~/Dev/pythonLibs', '/opt/homebrew/lib/python3.11/site-packages'}

}

nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	--filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio"},
	capabilities = capabilities
}


nvim_lsp.lua_ls.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
	end,
}



nvim_lsp.cssls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
	on_attach = on_attach,
	capabilities = capabilities
}


nvim_lsp.astro.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = '●'
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
