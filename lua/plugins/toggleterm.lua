return {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
        local status_ok, toggleterm = pcall(require, 'toggleterm')

        if not status_ok then
            return
        end

        toggleterm.setup({
            size = 13,
            open_mapping = [[<c-t>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            persist_size = true,
            direction = 'float',
			border = 'curved',
        })
		local Terminal  = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
			border = "double",
		},
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
		end,
		-- function to run on closing the terminal
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    end,
}
