return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			indicator = {
				style = "underline",
			},
			separator_style = { "", "" },
			enforce_regular_tabs = false,
			view = "multiwindow",
			show_buffer_close_icons = false,
			always_show_bufferline = true,
			diagnostics = false,
			themable = true,
		},
		highlights = {
			background = { bg = "NONE" },
			fill = { bg = "NONE" },
			buffer_visible = { fg = "NONE", bg = "NONE" },
			buffer_selected = { fg = "NONE", bg = "NONE" },
			modified = { fg = "NONE", bg = "NONE" },
			modified_visible = { fg = "NONE", bg = "NONE" },
			modified_selected = { fg = "NONE", bg = "NONE" },
			separator = { fg = "NONE", bg = "NONE" },
			indicator_selected = { fg = "NONE", bg = "NONE" },
			indicator_visible = { fg = "NONE", bg = "NONE" },
		},
	},
}
