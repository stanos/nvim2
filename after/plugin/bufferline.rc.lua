local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
	options = {
		mode = "tabs",
		always_show_bufferline = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		color_icons = true
	},
})
