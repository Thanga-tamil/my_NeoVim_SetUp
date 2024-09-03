local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

require'nvim-tree'.setup {
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "▸", -- Side arrow for closed folder
          arrow_open = "▾",   -- Down arrow for open folder
        },
      },
    },
  },
}



-- Keybindings for nvim-tree
vim.api.nvim_set_keymap('n', '<C-c>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
