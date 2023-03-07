local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

require("telescope").load_extension("emoji")
require('telescope').load_extension('lazygit')
require('telescope').load_extension('packer')
require('telescope').load_extension('media_files')
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
	},
	extensions = {
		file_browser = {
			initial_mode = "normal",
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function() vim.cmd('normal vbd') end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd('startinsert')
					end
				},
			},
		},

		frecency = {
      db_root = "home/my_username/path/to/db_root",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/Users/stanos/.config",
        ["data"]    = "/Users/stanos/.local/share",
        ["project"] = "/Users/stanos/projects",
        ["wiki"]    = "/Users/stanos/wiki"
      }
    },
		media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      -- filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    },
	},
}

telescope.load_extension("file_browser")

vim.keymap.set('n', 'tff',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = true
		})
	end)

vim.keymap.set('n', 'tr', function()
	builtin.live_grep()
end)

vim.keymap.set("n", "tf", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		initial_mode = "normal",
		layout_config = {}
	})
end)
vim.keymap.set('n', 'tt', ":Telescope<CR>")
vim.keymap.set("n", "<leader>ne", function()
	telescope.extensions.file_browser.file_browser({
		path = "~/.config/nvim",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		initial_mode = "normal",
		layout_config = {}
	})
end)

vim.keymap.set('n', 'ti', function()
	builtin.symbols({ sources = { 'emoji', 'kaomoji', 'gitmoji' } })
end)

vim.keymap.set('n', 'ti', function()
	builtin.symbols({ sources = { 'emoji', 'kaomoji', 'gitmoji' } })
end)

vim.keymap.set('n', 'tfr', function ()
	telescope.extensions.frecency.frecency()
end)
