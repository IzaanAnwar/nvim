local function boiler ()
    local selLang = vim.fn.input("[1] JAVA \n[2] C Language\n: =>")
    local pathToFile = ""

    if selLang == "2" then
        pathToFile = "/home/izaan/.config/nvim/lua/core/btext.txt"
    elseif selLang == "1" then
        pathToFile = "/home/izaan/.config/nvim/lua/core/javab.txt"
    else
        print("\nSELECT CORRECT OPTION")
    end

    local file = io.open(pathToFile, "r")
    if not file then
        error("[FAILED_TO_OPEN :: SOURCE FILE]")
        vim.cmd("!clear")
    end
    local content = file:read("*a")
    file:close()
    local api = vim.api
    local curBuf = api.nvim_get_current_buf()
    local curBufName = api.nvim_buf_get_name(curBuf)
    print(curBufName)

    local prFile = io.open(curBufName, "w")
    if not prFile then
        error("[FAILED_TO_OPEN :: SOURCE FILE]")
    end
    prFile:write(content)
    prFile:close()
    vim.cmd("edit!")
end

local function setup()
    vim.cmd("command! Boiler lua require('core.boiler').boiler()")
end

return {
    setup = setup,
    boiler = boiler
}
