local function create_focus_mapping()
    local function on_focus_key(direction, letter)
        return string.format(':lua require("focus").init_focus("%s", "%s")<CR>', direction, letter)
    end

    for letter = 97, 122 do -- ASCII codes for lowercase letters a-z
        vim.api.nvim_set_keymap('n', string.char(letter), on_focus_key("f", string.char(letter)), {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', string.upper(string.char(letter)), on_focus_key("b", string.char(letter)), {noremap = true, silent = true})
    end
end

function SetFocus(letter)
    vim.cmd(string.format('normal! %s%s<CR>', vim.v.count, letter))
    vim.cmd('startinsert!')
end

function InitFocus(direction, letter)
    if direction == "f" then
        vim.cmd(':normal! f') -- Enter forward focus mode
    elseif direction == "b" then
        vim.cmd(':normal! F') -- Enter backward focus mode
    end
    vim.cmd('startinsert!') -- Enter insert mode
end

return {
    create_focus_mapping = create_focus_mapping,
    set_focus = SetFocus,
    init_focus = InitFocus
}
