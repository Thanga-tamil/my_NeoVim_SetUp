vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cc", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', 'w', 'b', {noremap = true})
vim.api.nvim_set_keymap('n', 'dw', 'db', {noremap = true})
vim.api.nvim_set_keymap('x', 'w', 'b', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>y', 'yi(', {noremap = true})
-- Map to visually select text inside brackets (without copying)
vim.api.nvim_set_keymap('n', '<leader>v', 'vi(', {noremap = true})
-- Map to visually select text inside brackets (including the brackets)
vim.api.nvim_set_keymap('n', '<leader>s', 'va(', {noremap = true})
-- Map to visually select text inside curly braces (including the braces)
vim.api.nvim_set_keymap('n', '<leader>vv', 'va{', {noremap = true})

vim.cmd [[
    nnoremap <leader>t :NERDTreeToggle<CR>
    nnoremap <leader>d :NERDTreeFocus<CR>
]]
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.NERDTreeDirIcon = ''
vim.g.NERDTreeFileIcon = ''

vim.api.nvim_set_keymap('i', '<Tab>[', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'r', '<C-r>', {noremap = true})

vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    java = {'checkstyle', 'pmd'},
    python = {'pylint', 'flake8'},
}
vim.g.ale_fixers = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    java = {'google_java_format'},
    python = {'autopep8', 'black'},

}

--vim.api.nvim_set_keymap('n', '<Leader>e', ':ALEFix<CR>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<Leader>ee', ':ALEDetail<CR>', {noremap = true, silent = true})



