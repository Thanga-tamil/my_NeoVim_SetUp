vim.g.mapleader = " "
vim.keymap.set("n", "<A-s>", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>c", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', 'w', 'b', { noremap = true })
vim.api.nvim_set_keymap('n', 'dw', 'db', { noremap = true })
vim.api.nvim_set_keymap('x', 'w', 'b', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>y', 'yi(', { noremap = true })
-- Map to visually select text inside brackets (without copying)
vim.api.nvim_set_keymap('n', '<leader>v', 'vi(', { noremap = true })
-- Map to visually select text inside brackets (including the brackets)
vim.api.nvim_set_keymap('n', '<leader>s', 'va(', { noremap = true })
-- Map to visually select text inside curly braces (including the braces)
vim.api.nvim_set_keymap('n', '<leader>ss', 'va{', { noremap = true })
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Remap z key to insert four spaces in normal mode
vim.api.nvim_set_keymap('n', 'z', 'i<Space><Space><Space><Space><Space><Esc>',
     { noremap = true })

vim.cmd [[
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>d :NERDTreeFocus<CR>
]]
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
vim.g.NERDTreeDirIcon = ''
vim.g.NERDTreeFileIcon = ''

--normal mode
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'r', '<C-r>', { noremap = true })

vim.g.ale_linters = {
    javascript = { 'eslint' },
    typescript = { 'eslint' },
    java = { 'checkstyle', 'pmd' },
    python = { 'pylint', 'flake8' },
}
vim.g.ale_fixers = {
    javascript = { 'eslint' },
    typescript = { 'eslint' },
    java = { 'google_java_format' },
    python = { 'autopep8', 'black' },

}

vim.api.nvim_set_keymap('n', '<Leader>e', ':ALEFix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ee', ':ALEDetail<CR>', { noremap = true, silent = true })
--  Function to replace the current word under the cursor


--\<<C-R>=expand('<cword>')<CR>\>//g<Left><Left>
--'<,'>s/text/change/g -- to change same words in single line
vim.api.nvim_set_keymap('n', '<Leader>r', [[:%s/]], { noremap = true, silent = true })
--visual Block mode
vim.api.nvim_set_keymap('n', '<Leader>q', '<C-V>', { noremap = true })

vim.api.nvim_set_keymap('n', "<leader>'", "va'", { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>''", 'va"', { noremap = true })
vim.api.nvim_set_keymap('n', "<leader>`", "va`", { noremap = true })
--vim.api.nvim_set_keymap('n', "<leader>`", "va`y", { noremap = true })
--add y to "va'y" to copy at the single click

-- Move selected lines up
--vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move selected lines down
--vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Fix indentation for single line or selected multiple lines
vim.api.nvim_set_keymap('n', '<C-i>', '==', { noremap = true, silent = true })  -- Normal mode: Fix indentation for single line
vim.api.nvim_set_keymap('v', '<C-i>', '=gv', { noremap = true, silent = true }) -- Visual mode: Fix indentation for selected lines
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
