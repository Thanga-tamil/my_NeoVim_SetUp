local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>z', function()
    local search_term = vim.fn.input("Grep > ")
    builtin.grep_string({ search = search_term })
end)
