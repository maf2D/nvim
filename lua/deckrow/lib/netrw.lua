local Netrw = {}

function Netrw.open_at_current_file()
    local file = vim.fn.expand("%:t")
    vim.cmd.Ex()
    if file ~= "" then
        vim.schedule(function()
            vim.fn.search("\\<" .. file .. "\\>")
        end)
    end
end

return Netrw
