return {
    {
        'folke/neodev.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local neodev_status_ok, neodev = pcall(require, 'neodev')

            if not neodev_status_ok then
                return
            end

            neodev.setup()
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = 'Mason',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end
            },
            { 'williamboman/mason-lspconfig.nvim', },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            { 'SmiteshP/nvim-navic' },
			{ 'ervandew/supertab'}
        },
        config = function()

            local lsp = require('lsp-zero').preset({
				name = 'minimal',
				manage_nvim_cmp = true,
			})
            lsp.setup_nvim_cmp({
                select_behavior = 'insert'
            })
			local navic = require('nvim-navic')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({
					buffer = bufnr,
					preserve_mappings = false
				})
                if client.server_capabilities.documentSymbolProvider then
                    navic.attach(client, bufnr)
                end
            end)

            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.ensure_installed({
                -- 'pyright',
                'lua_ls',
                -- 'gopls',
                'clangd'
            })

			require('mason-lspconfig').setup({
				ensure_installed = {},
				handlers = {
					lsp.default_setup,
				}
			})

            lsp.setup()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                preselect = cmp.PreselectMode.None,
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
				mapping = cmp.mapping.preset.insert({
					['<Tab>'] = cmp_action.tab_complete(),
					['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
				})
            })
        end
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
    -- {
    --     'dgagn/diagflow.nvim',
    --     opts = {
    --         -- placement = 'inline',
    --         scope = 'line',
    --         padding_right = 5
    --     }
    -- }
}
