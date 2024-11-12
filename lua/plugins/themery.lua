return {
    'zaldih/themery.nvim',
    cmd = 'Themery',
	lazy = false,
    config = function()
            require("themery").setup({
            themes = {
                {
                    name = 'material',
                    colorscheme = 'material',
                    before = [[
						vim.opt.background = "dark"
						vim.g.material_style = 'darker'
					]]
                },
                {
                    name = 'vscode',
                    colorscheme = 'vscode',
					before = [[vim.opt.background = "dark"]]
                },
                {
                    name = 'gruvbox dark',
                    colorscheme = 'gruvbox',
					before = [[
						vim.opt.background = "dark"
						vim.cmd("let g:gruvbox_contrast_dark='medium'")
					]]
                },
				{
					name = 'gruvbox baby',
					colorscheme = 'gruvbox-baby',
					before = [[
						vim.g.gruvbox_baby_telescope_theme = 1
					]]
				},
				{
					name = 'gruvbox light',
					colorscheme = 'gruvbox',
					before = [[
						vim.opt.background = "light"
						vim.cmd("let g:gruvbox_contrast_light='soft'")
					]],
				},
                {
                    name = 'catppuccin',
                    colorscheme = 'catppuccin',
					before = [[vim.opt.background = "dark"]]
                },
                {
                    name = 'tokyonight',
                    colorscheme = 'tokyonight',
					before = [[vim.opt.background = "dark"]]
                },
				{
					name = 'onedark',
					colorscheme = 'onedark',
					before = [[vim.opt.background = "dark"]]
				},
				{
					name = 'mono dark',
					colorscheme = '256_noir'
				}
            },
			-- themeConfigFile = themeConfig,
            livePreview = true,
        })
    end
}
