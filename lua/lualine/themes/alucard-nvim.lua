local alucard = {}

local colors = require("alucard").colors()
local bg = colors.black

alucard.normal = {
    a = { fg = colors.black, bg = colors.purple, gui = "bold" },
    b = { fg = colors.purple, bg = bg },
    c = { fg = colors.white, bg = bg },
}

alucard.visual = {
    a = { fg = colors.black, bg = colors.pink, gui = "bold" },
    b = { fg = colors.pink, bg = bg },
}

alucard.inactive = {
    a = { fg = colors.white, bg = colors.gray, gui = "bold" },
    b = { fg = colors.black, bg = colors.white },
}

alucard.replace = {
    a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.yellow, bg = bg },
    c = { fg = colors.white, bg = bg },
}

alucard.insert = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
    b = { fg = colors.green, bg = bg },
    c = { fg = colors.white, bg = bg },
}

return alucard
