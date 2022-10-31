local M = {}

local DEFAULT_COLORS = {
    comment = "#7970a9",
    menu = "#22212c",
    nontext = "#3b4048",
    visual = "#44475a",
    orange = "#ffca80",
    black = "#1a1826",
    red = "#ff5555",
    green = "#8aff80",
    yellow = "#ffff80",
    purple = "#9580ff",
    pink = "#ff80bf",
    cyan = "#80ffea",
    white = "#f8f8f2",
    selection = "#44475a",
    bright_red = "#ff6e6e",
    bright_green = "#a2ff99",
    bright_yellow = "#ffff99",
    bright_blue = "#aa99ff",
    bright_magenta = "#ff99cc",
    bright_cyan = "#99ffee",
    bright_white = "#ffffff",
    bg = "#22212c",
    fg = "#f8f8f2",
}

local colors =
    vim.tbl_deep_extend("force", DEFAULT_COLORS, vim.g.alucard_colors or {})

M.colors = function()
    return colors
end

local function apply_term_colors()
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.purple
    vim.g.terminal_color_5 = colors.pink
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.selection
    vim.g.terminal_color_9 = colors.bright_red
    vim.g.terminal_color_10 = colors.bright_green
    vim.g.terminal_color_11 = colors.bright_yellow
    vim.g.terminal_color_12 = colors.bright_blue
    vim.g.terminal_color_13 = colors.bright_magenta
    vim.g.terminal_color_14 = colors.bright_cyan
    vim.g.terminal_color_15 = colors.bright_white
    vim.g.terminal_color_background = colors.bg
    vim.g.terminal_color_foreground = colors.fg
end

M.apply = function()
    apply_term_colors()

    local highlight = function(group, fg, bg, attr, sp)
        local guifg = fg and "guifg=" .. fg or "guifg=NONE"
        local guibg = bg and "guibg=" .. bg or "guibg=NONE"
        local gui = attr and "gui=" .. attr or "gui=NONE"
        local guisp = sp and "guisp=" .. sp or ""

        vim.api.nvim_command(
            "highlight "
                .. group
                .. " "
                .. guifg
                .. " "
                .. guibg
                .. " "
                .. gui
                .. " "
                .. guisp
        )
    end

    local highlight_link = function(group, link)
        vim.api.nvim_command("highlight link " .. group .. " " .. link)
    end

    local is_italic = vim.g.alucard_italic_comment == true

    highlight("Normal", colors.fg, colors.bg)
    highlight("NormalFloat", colors.fg, colors.bg)
    highlight("Comment", colors.comment, nil, is_italic and "italic" or nil)
    highlight("Constant", colors.yellow)
    highlight("String", colors.yellow)
    highlight("Character", colors.green)
    highlight("Number", colors.purple)
    highlight("Boolean", colors.purple)
    highlight("Float", colors.purple)
    highlight("FloatBorder", colors.white)
    highlight("Operator", colors.pink)
    highlight("Keyword", colors.pink)
    highlight("Keywords", colors.cyan)
    highlight("Identifier", colors.cyan)
    highlight("Function", colors.green)
    highlight("Statement", colors.purple)
    highlight("Conditional", colors.pink)
    highlight("Repeat", colors.pink)
    highlight("Label", colors.cyan)
    highlight("Exception", colors.pink)
    highlight("PreProc", colors.comment)
    highlight("Include", colors.pink)
    highlight("Define", colors.purple)
    highlight("Title", colors.cyan)
    highlight("Macro", colors.purple)
    highlight("PreCondit", colors.cyan)
    highlight("Type", colors.cyan)
    highlight("StorageClass", colors.pink)
    highlight("Structure", colors.yellow)
    highlight("TypeDef", colors.yellow)
    highlight("Special", colors.white)
    highlight("SpecialComment", colors.comment, nil, "italic")
    highlight("Error", colors.bright_red)
    highlight("Todo", colors.purple, nil, "bold,italic")
    highlight("Underlined", colors.cyan, nil, "underline")

    highlight("Cursor", nil, nil, "reverse")
    highlight("CursorColumn", nil, colors.black, "reverse")
    highlight("CursorLineNr", colors.fg, nil, "bold")
    highlight("SignColumn", nil, colors.bg)

    highlight("Conceal", colors.comment)
    highlight("CursorColumn", nil, colors.black)
    highlight("CursorLine", nil, colors.selection)
    highlight("ColorColumn", nil, colors.selection)

    highlight("StatusLine", colors.white, colors.black)
    highlight("StatusLineNC", colors.comment)
    highlight("StatusLineTerm", colors.white, colors.black)
    highlight("StatusLineTermNC", colors.comment)

    highlight("Directory", colors.cyan)
    highlight("DiffAdd", colors.bg, colors.green)
    highlight("DiffChange", colors.orange)
    highlight("DiffDelete", colors.red)
    highlight("DiffText", colors.comment)

    highlight("ErrorMsg", colors.bright_red)
    highlight("WinSeparator", colors.purple)
    highlight("VertSplit", colors.purple)
    highlight("Folded", colors.comment)
    highlight("FoldColumn")
    highlight("Search", colors.black, colors.orange)
    highlight("IncSearch", colors.orange, colors.comment)
    highlight("LineNr", colors.comment)
    highlight("MatchParen", colors.fg, nil, "underline")
    highlight("NonText", colors.nontext)
    highlight("Pmenu", colors.white, colors.menu)
    highlight("PmenuSel", colors.white, colors.selection)
    highlight("PmenuSbar", nil, colors.bg)
    highlight("PmenuThumb", nil, colors.selection)

    highlight("Question", colors.purple)
    highlight("QuickFixLine", colors.black, colors.yellow)
    highlight("SpecialKey", colors.nontext)

    highlight("SpellBad", colors.bright_red, nil, "underline")
    highlight("SpellCap", colors.yellow)
    highlight("SpellLocal", colors.yellow)
    highlight("SpellRare", colors.yellow)

    highlight("TabLine", colors.comment)
    highlight("TabLineSel", colors.white)
    highlight("TabLineFill", nil, colors.black)
    highlight("Terminal", colors.white, colors.black)
    highlight("Visual", nil, colors.visual)
    highlight("VisualNOS", colors.visual)
    highlight("WarningMsg", colors.yellow)
    highlight("WildMenu", colors.black, colors.white)
    highlight("EndOfBuffer", colors.bg)

    -- treesitter
    highlight("TSError", colors.bright_red)
    highlight("TSPunctDelimiter", colors.fg)
    highlight("TSPunctBracket", colors.fg)
    highlight("TSPunctSpecial", colors.fg)
    highlight("TSConstant", colors.purple)
    highlight("TSConstantBuiltin", colors.purple)
    highlight("TSConstMacro", colors.cyan)
    highlight("TSStringRegex", colors.red)
    highlight("TSString", colors.yellow)
    highlight("TSStringEscape", colors.cyan)
    highlight("TSCharacter", colors.green)
    highlight("TSNumber", colors.purple)
    highlight("TSBoolean", colors.purple)
    highlight("TSFloat", colors.green)
    highlight("TSAnnotation", colors.yellow)
    highlight("TSAttribute", colors.cyan)
    highlight("TSNamespace", colors.orange)
    highlight("TSFuncBuiltin", colors.cyan)
    highlight("TSFunction", colors.green)
    highlight("TSFuncMacro", colors.green)
    highlight("TSParameter", colors.orange)
    highlight("TSParameterReference", colors.orange)
    highlight("TSMethod", colors.green)
    highlight("TSField", colors.orange)
    highlight("TSProperty", colors.fg)
    highlight("TSConstructor", colors.cyan)
    highlight("TSConditional", colors.pink)
    highlight("TSRepeat", colors.pink)
    highlight("TSLabel", colors.cyan)
    highlight("TSKeyword", colors.pink)
    highlight("TSKeywordFunction", colors.cyan)
    highlight("TSKeywordOperator", colors.pink)
    highlight("TSOperator", colors.pink)
    highlight("TSException", colors.purple)
    highlight("TSType", colors.blue)
    highlight("TSTypeBuiltin", colors.cyan, nil, "italic")
    highlight("TSStructure", colors.purple)
    highlight("TSInclude", colors.pink)
    highlight("TSVariable", colors.fg)
    highlight("TSVariableBuiltin", colors.purple)
    highlight("TSText", colors.orange)
    highlight("TSStrong", colors.orange, nil, "bold")
    highlight("TSEmphasis", colors.yellow, nil, "italic")
    highlight("TSUnderline", colors.orange)
    highlight("TSTitle", colors.pink)
    highlight("TSLiteral", colors.yellow)
    highlight("TSURI", colors.yellow, nil, "italic")
    highlight("TSTag", colors.cyan)
    highlight("TSTagDelimiter", colors.white)

    -- html
    highlight("htmlArg", colors.yellow)
    highlight("htmlBold", colors.yellow, nil, "bold")
    highlight("htmlEndTag", colors.white)
    highlight("htmlH1", colors.pink)
    highlight("htmlH2", colors.pink)
    highlight("htmlH3", colors.pink)
    highlight("htmlH4", colors.pink)
    highlight("htmlH5", colors.pink)
    highlight("htmlH6", colors.pink)
    highlight("htmlItalic", colors.purple, nil, "italic")
    highlight("htmlLink", colors.purple, nil, "underline")
    highlight("htmlSpecialChar", colors.yellow)
    highlight("htmlSpecialTagName", colors.cyan)
    highlight("htmlTag", colors.pink)
    highlight("htmlTagN", colors.pink)
    highlight("htmlTagName", colors.cyan)
    highlight("htmlTitle", colors.white)

    -- markdown
    highlight("markdownBlockquote", colors.yellow, nil, "italic")
    highlight("markdownBold", colors.orange, nil, "bold")
    highlight("markdownCode", colors.green)
    highlight("markdownCodeBlock", colors.orange)
    highlight("markdownCodeDelimiter", colors.red)
    highlight("markdownH1", colors.pink, nil, "bold")
    highlight("markdownH2", colors.pink, nil, "bold")
    highlight("markdownH3", colors.pink, nil, "bold")
    highlight("markdownH4", colors.pink, nil, "bold")
    highlight("markdownH5", colors.pink, nil, "bold")
    highlight("markdownH6", colors.pink, nil, "bold")
    highlight("markdownHeadingDelimiter", colors.red)
    highlight("markdownHeadingRule", colors.comment)
    highlight("markdownId", colors.purple)
    highlight("markdownIdDeclaration", colors.cyan)
    highlight("markdownIdDelimiter", colors.purple)
    highlight("markdownItalic", colors.yellow, nil, "italic")
    highlight("markdownLinkDelimiter", colors.purple)
    highlight("markdownLinkText", colors.pink)
    highlight("markdownListMarker", colors.cyan)
    highlight("markdownOrderedListMarker", colors.red)
    highlight("markdownRule", colors.comment)

    -- diff
    highlight("diffAdded", colors.green)
    highlight("diffRemoved", colors.red)
    highlight("diffFileId", colors.yellow, nil, "bold,reverse")
    highlight("diffFile", colors.nontext)
    highlight("diffNewFile", colors.green)
    highlight("diffOldFile", colors.red)

    highlight("debugPc", nil, colors.cyan)
    highlight("debugBreakpoint", colors.red, nil, "reverse")

    -- telescope
    highlight("TelescopePromptBorder", colors.comment)
    highlight("TelescopeResultsBorder", colors.comment)
    highlight("TelescopePreviewBorder", colors.comment)
    highlight("TelescopeSelection", colors.white, colors.selection)
    highlight("TelescopeMultiSelection", colors.purple, colors.selection)
    highlight("TelescopeNormal", colors.fg, colors.bg)
    highlight("TelescopeMatching", colors.green)
    highlight("TelescopePromptPrefix", colors.purple)

    -- nvim-tree
    highlight("NvimTreeCursorLine", nil, colors.selection)
    highlight("NvimTreeEmptyFolderName", colors.comment)
    highlight("NvimTreeEndOfBuffer", colors.bg)
    highlight("NvimTreeFolderIcon", colors.purple)
    highlight("NvimTreeFolderName", colors.fg)
    highlight("NvimTreeGitDirty", colors.yellow)
    highlight("NvimTreeGitNew", colors.bright_green)
    highlight("NvimTreeImageFile", colors.pink)
    highlight("NvimTreeIn", nil, colors.selection)
    highlight("NvimTreeIndentMarker", colors.nontext)
    highlight("NvimTreeNormal ", colors.fg, colors.menu)
    highlight("NvimTreeOpenedFolderName", colors.fg)
    highlight("NvimTreeRootFolder", colors.fg, nil, "bold")
    highlight("NvimTreeSpecialFile", colors.pink, nil, "underline")
    highlight("NvimTreeVertSplit", colors.bg, colors.bg)
    highlight("NvimTreeWindowPicker", colors.white, colors.black)

    -- lsp
    highlight("DiagnosticError", colors.red)
    highlight("DiagnosticWarn", colors.yellow)
    highlight("DiagnosticInfo", colors.cyan)
    highlight("DiagnosticHint", colors.cyan)
    highlight("DiagnosticUnderlineError", nil, nil, "undercurl", colors.red)
    highlight("DiagnosticUnderlineWarn", nil, nil, "undercurl", colors.yellow)
    highlight("DiagnosticUnderlineInfo", nil, nil, "undercurl", colors.cyan)
    highlight("DiagnosticUnderlineHint", nil, nil, "undercurl", colors.cyan)
    highlight("DiagnosticSignError", colors.red)
    highlight("DiagnosticSignWarn", colors.yellow)
    highlight("DiagnosticSignInfo", colors.cyan)
    highlight("DiagnosticSignHint", colors.cyan)
    highlight("DiagnosticFloatingError", colors.red)
    highlight("DiagnosticFloatingWarn", colors.yellow)
    highlight("DiagnosticFloatingInfo", colors.cyan)
    highlight("DiagnosticFloatingHint", colors.cyan)
    highlight("DiagnosticVirtualTextError", colors.red)
    highlight("DiagnosticVirtualTextWarn", colors.yellow)
    highlight("DiagnosticVirtualTextInfo", colors.cyan)
    highlight("DiagnosticVirtualTextHint", colors.cyan)
    highlight("LspDiagnosticsDefaultError", colors.red)
    highlight("LspDiagnosticsDefaultWarning", colors.yellow)
    highlight("LspDiagnosticsDefaultInformation", colors.cyan)
    highlight("LspDiagnosticsDefaultHint", colors.cyan)
    highlight("LspDiagnosticsUnderlineError", colors.red, nil, "undercurl")
    highlight(
        "LspDiagnosticsUnderlineWarning",
        colors.yellow,
        nil,
        "undercurl"
    )
    highlight(
        "LspDiagnosticsUnderlineInformation",
        colors.cyan,
        nil,
        "undercurl"
    )
    highlight("LspDiagnosticsUnderlineHint", colors.cyan, nil, "undercurl")
    highlight("LspReferenceText", colors.orange)
    highlight("LspReferenceRead", colors.orange)
    highlight("LspReferenceWrite", colors.orange)
    highlight("LspFloatWinNormal", colors.fg)
    highlight("LspFloatWinBorder", colors.comment)
    highlight("LspLinesDiagBorder", colors.comment)

    -- indent-blankline
    highlight(
        "IndentBlanklineContextChar",
        colors.bright_red,
        nil,
        "nocombine"
    )

    --barbar
    highlight("BufferCurrentTarget", colors.red)
    highlight("BufferVisibleTarget", colors.red)
    highlight("BufferInactiveTarget", colors.red)

    -- nvim-cmp
    highlight(
        "CmpItemAbbrDeprecated",
        colors.white,
        colors.menu,
        "strikethrough"
    )
    highlight("CmpItemAbbrMatch", colors.cyan, colors.menu)
    highlight("CmpItemAbbrMatchFuzzy", colors.cyan, colors.menu)
    highlight("CmpBorderedWindow_Normal", colors.white)
    highlight("CmpBorderedWindow_FloatBorder", colors.comment)
    highlight("CmpBorderedWindow_CursorLine", colors.white, colors.selection)

    highlight_link("CmpItemAbbr", "Pmenu")
    highlight_link("CmpItemKind", "Pmenu")
    highlight_link("CmpItemKindClass", "TSType")
    highlight_link("CmpItemKindColor", "cssColor")
    highlight_link("CmpItemKindConstant", "TSConstant")
    highlight_link("CmpItemKindConstructor", "TSType")
    highlight_link("CmpItemKindEnum", "TSField")
    highlight_link("CmpItemKindEnumMember", "TSField")
    highlight_link("CmpItemKindEvent", "TSConstant")
    highlight_link("CmpItemKindField", "TSField")
    highlight_link("CmpItemKindFile", "TSURI")
    highlight_link("CmpItemKindFolder", "TSURI")
    highlight_link("CmpItemKindFunction", "TSFunction")
    highlight_link("CmpItemKindInterface", "TSType")
    highlight_link("CmpItemKindKeyword", "TSKeyword")
    highlight_link("CmpItemKindMethod", "TSMethod")
    highlight_link("CmpItemKindModule", "TSNamespace")
    highlight_link("CmpItemKindOperator", "TSOperator")
    highlight_link("CmpItemKindProperty", "TSProperty")
    highlight_link("CmpItemKindReference", "TSParameterReference")
    highlight_link("CmpItemKindSnippet", "TSText")
    highlight_link("CmpItemKindStruct", "TSStructure")
    highlight_link("CmpItemKindText", "TSText")
    highlight_link("CmpItemKindTypeParameter", "TSParameter")
    highlight_link("CmpItemKindUnit", "TSField")
    highlight_link("CmpItemKindValue", "TSField")
    highlight_link("CmpItemKindVariable", "TSVariable")
    highlight_link("CmpItemMenu", "Pmenu")
end

return M
