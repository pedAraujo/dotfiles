return {
	"neovim/neovim",
	priority = 1000,
	config = function()
		-- Aplica o colorscheme PRIMEIRO
		vim.cmd.colorscheme("default")

		-- Configurações de highlight APÓS o colorscheme
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "",
			callback = function()
				vim.cmd([[
                    hi NeoTreeFloatBorder guibg=NONE guifg=#666666
                    hi NeoTreeFloatTitle guibg=NONE guifg=#ffffff
                    hi NeoTreeTitleBar guibg=#2C2E34 guifg=#ffffff
                    hi NeoTreeFloatNormal guibg=NONE guifg=#ffffff
                    hi NeoTreeFloatNormalNC guibg=NONE guifg=#aaaaaa
                    hi NeoTreeFloatFooter guibg=NONE guifg=#ffffff
                    hi WinSeparator guibg=NONE guifg=#1D212C
                ]])
			end,
		})
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "",
			callback = function()
				vim.cmd([[
              hi IBLscope guibg=NONE guifg=#2C2E34
              hi IBLindent guibg=NONE guifg=#1D212C
            ]])
			end,
		})
		vim.cmd("colorscheme default")
	end,
}
