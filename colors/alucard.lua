local alucard = require("alucard")

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "alucard"
vim.o.background = "dark"
vim.o.termguicolors = true

alucard.apply()
