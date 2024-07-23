local mark = require("harpoon.mark")
local ui = require("harpoon.mark")

vim.keymap.set("n", "<leader>a", function()
    require('harpoon.mark').add_file()
end)

vim.keymap.set("n", "<leader>h", function()
    require('harpoon.ui').toggle_quick_menu()
end)

vim.keymap.set("n", "n", function() require('harpoon.ui').nav_file(1) end)
vim.keymap.set("n", "m", function() require('harpoon.ui').nav_file(2) end)
vim.keymap.set("n", ",", function() require('harpoon.ui').nav_file(3) end)
vim.keymap.set("n", ".", function() require('harpoon.ui').nav_file(4) end)

