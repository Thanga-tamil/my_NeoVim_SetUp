-- Define the function to format the current buffer
local function format_buffer()
    vim.lsp.buf.format({ async = true })
end

-- Set the function globally to ensure it's accessible
_G.format_buffer = format_buffer

-- Create an autocommand group for LSP attachments
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        -- Define key mappings for LSP functionalities
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        -- Key mapping for formatting the buffer with Ctrl+Z
        vim.keymap.set('n', '<C-s>', format_buffer, opts)
    end,
})

-- Existing LSP and completion configurations
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Initialize mason and mason-lspconfig before lsp-zero setup
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'jdtls', 'html', 'eslint' },
})


require('lspconfig').lua_ls.setup({
    capabilities = lsp_capabilities,
})

require('lspconfig').html.setup({
    capabilities = lsp_capabilities,
})

require('lspconfig').eslint.setup({
    capabilities = lsp_capabilities,
})

-- require('lspconfig').jdtls.setup({
--     capabilities = lsp_capabilities,
--     cmd = { 'jdtls' },
--     root_dir = require('lspconfig.util').root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
-- 
--     settings = {
--         java = {
--             contentProvider = {
--                 preferred = 'fernflower'
--             },
--             configuration = {
--                 update_build_configuration = true
--             }
--         }
--     },
--     on_attach = function(client, bufnr)
--         -- Disable the LSP's own highlighting to avoid conflicts
--         client.server_capabilities.documentHighlightProvider = false
--         client.server_capabilities.semanticTokensProvider = false
--     end,
-- })

-- Setup nvim-cmp
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                nvim_lua = 'Π',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- Setup lsp-zero
--local lsp_zero = require('lsp-zero').preset({
--   name = 'minimal',
--  set_lsp_keymaps = false,
--   manage_nvim_cmp = true,
--    suggest_lsp_servers = false,
--})

--lsp_zero.on_attach(function(client, bufnr)
--   lsp_zero.default_keymaps({ buffer = bufnr })
--end)
