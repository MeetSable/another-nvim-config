return {

    'zaldih/themery.nvim',
    cmd = 'Themery',
    config = function()
        local status_ok, themery = pcall(require, 'themery')
        if not status_ok then
            return
        end
		local themeConfig
		if vim.fn.has('win32') == 1 then
			themeConfig = "~\\AppData\\Local\\nvim\\lua\\settings\\colorscheme.lua"
		elseif vim.fn.has('linux') == 1 then
			themeConfig = "~/.config/nvim/lua/settings/colorscheme.lua"
		end

        themery.setup({
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
            },
			themeConfigFile = themeConfig,
            livePreview = true,
        })
    end
}
