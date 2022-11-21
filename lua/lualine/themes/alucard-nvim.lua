local alucard = {}

local colors = require("alucard").colors()
local bg = colors.black

alucard.normal = {
    a = { fg = colors.black, bg = colors.gray, gui = "bold" },
    b = { fg = colors.white, bg = bg },
    c = { fg = colors.white, bg = bg },
}

alucard.visual = {
    a = { fg = colors.black, bg = colors.gray, gui = "bold" },
    b = { fg = colors.white, bg = bg },
}

alucard.inactive = {
    a = { fg = colors.white, bg = colors.dark_gray, gui = "bold" },
    b = { fg = colors.black, bg = colors.white },
}

alucard.replace = {
    a = { fg = colors.black, bg = colors.gray, gui = "bold" },
    b = { fg = colors.white, bg = bg },
    c = { fg = colors.white, bg = bg },
}

alucard.insert = {
    a = { fg = colors.black, bg = colors.gray, gui = "bold" },
    b = { fg = colors.white, bg = bg },
    c = { fg = colors.white, bg = bg },
}

return alucard
