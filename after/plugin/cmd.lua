-- Set the leader key to space
vim.g.mapleader = ' '

-- Map <leader>x to toggle comments for multiple lines in Visual Block mode
vim.api.nvim_set_keymap('x', '<leader>x', ':<C-u>lua ToggleComment()<CR>', { noremap = true, silent = true })

function ToggleComment()
    local filetype = vim.bo.filetype
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local commented = true

    local function is_commented(line, comment_syntax)
        return line:match("^%s*" .. vim.pesc(comment_syntax))
    end

    local lines = vim.fn.getline(start_line, end_line)

    -- Detect if lines are commented
    for _, line in ipairs(lines) do
        if (filetype == 'python' and not is_commented(line, "#"))
            or ((filetype == 'javascript' or filetype == 'html' or filetype == 'java' or filetype == 'javascriptreact' or filetype == 'typescriptreact') and not is_commented(line, "//"))
            or (filetype == 'lua' and not is_commented(line, "--")) then
            commented = false
            break
        end
    end

    -- Toggle comments
    for i, line in ipairs(lines) do
        if (filetype == 'python') then
            if commented then
                lines[i] = line:gsub("^%s*#%s*", "")
            else
                lines[i] = "# " .. line
            end
        elseif (filetype == 'javascript' or filetype == 'html' or filetype == 'java' or filetype == 'javascriptreact' or filetype == 'typescriptreact') then
            if commented then
                lines[i] = line:gsub("^%s*//%s*", "")
            else
                lines[i] = "// " .. line
            end
        elseif (filetype == 'lua') then
            if commented then
                lines[i] = line:gsub("^%s*--%s*", "")
            else
                lines[i] = "-- " .. line
            end
        end
    end

    -- Set the updated lines back to the buffer
    vim.fn.setline(start_line, lines)
end

-- Key mappings for normal and visual modes
vim.api.nvim_set_keymap('n', '<C-_>', ':lua ToggleComment()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-_>', ':lua ToggleComment()<CR>', { noremap = true, silent = true })
