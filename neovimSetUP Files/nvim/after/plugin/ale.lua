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
vim.api.nvim_set_keymap('n', '<leader>a', ':ALEFix<CR>', { noremap = true, silent = true })
