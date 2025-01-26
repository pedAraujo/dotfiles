return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")
		local colors = {
			darkgray = "#B4B6BE",
			gray = "#B4B6BE",
			innerbg = nil,
			outerbg = nil,
			normal = "#B4B6BE",
			insert = "#98bb6c",
			visual = "#ffa066",
			replace = "#e46876",
			command = nil,
		}
		local my_theme = {
			inactive = {
				a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			visual = {
				a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			replace = {
				a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			normal = {
				a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			insert = {
				a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
			command = {
				a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
				b = { fg = colors.gray, bg = colors.outerbg },
				c = { fg = colors.gray, bg = colors.innerbg },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_theme,
				icons_enabled = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {},
				lualine_b = {
					"branch",
				},
				lualine_c = {
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_x = {
					"copilot",
				},
				lualine_y = {
					{ "filetype" },
				},
				lualine_z = {},
			},
		})
	end,
}
