require('mustafa')
vim.wo.number = true
--vim.wo.relativenumber = true
require("autoclose").setup()


-- Function to check if a file or directory exists in the system
local function is_executable(path)
    local executable_found = io.popen("test -x " .. path .. " && echo 'true' || echo 'false'")
    local result = executable_found:read("*a")
    executable_found:close()
    return result:match("^true") ~= nil
end

-- Path to win32yank
local win32yank_path = "/mnt/c/win32yank.exe"

-- Check if win32yank is available
local has_win32yank = is_executable(win32yank_path)

-- Set clipboard mappings if win32yank is available
if has_win32yank then
    vim.cmd([[
        " Use win32yank for clipboard integration
        let g:clipboard = {
            \   'name': 'win32yank-wsl2',
            \   'copy': {
            \      '+': ']] .. win32yank_path .. [[ -i --crlf',
            \      '*': ']] .. win32yank_path .. [[ -i --crlf',
            \   },
            \   'paste': {
            \      '+': ']] .. win32yank_path .. [[ -o --lf',
            \      '*': ']] .. win32yank_path .. [[ -o --lf',
            \   },
            \   'cache_enabled': 0,
            \}
    ]])
end

