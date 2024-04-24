vim.g.mapleader = " "
vim.keymap.set("n", "<leader>bb", vim.cmd.Ex)

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

vim.api.nvim_set_keymap('n', '<Leader>e', ':ALEFix<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ee', ':ALEDetail<CR>', {noremap = true, silent = true})

