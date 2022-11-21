local M = {}

local DEFAULT_COLORS = {
    comment = "#7970a9",
    selection = "#44475a",
    menu = "#22212c",
    nontext = "#3b4048",
    visual = "#44475a",
    orange = "#ffca80",
    gray = "#999999",
    dark_gray = "#666666",
    black = "#1a1826",
    red = "#ff5555",
    green = "#8aff80",
    yellow = "#ffff80",
    purple = "#9580ff",
    pink = "#ff80bf",
    cyan = "#80ffea",
    white = "#f8f8f2",
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

    highlight("Boolean", colors.white)
    highlight("Character", colors.white)
    highlight("ColorColumn", nil, colors.selection)
    highlight("Comment", colors.dark_gray, nil, is_italic and "italic" or nil)
    highlight("Conceal", colors.dark_gray)
    highlight("Conditional", colors.dark_gray)
    highlight("Constant", colors.white)
    highlight("Cursor", nil, nil, "reverse")
    highlight("CursorColumn", nil, colors.black)
    highlight("CursorColumn", nil, colors.black, "reverse")
    highlight("CursorLine", nil, colors.selection)
    highlight("CursorLineNr", colors.fg, nil, "bold")
    highlight("Define", colors.gray)
    highlight("DiffAdd", colors.bg, colors.green)
    highlight("DiffChange", colors.orange)
    highlight("DiffDelete", colors.red)
    highlight("DiffText", colors.dark_gray)
    highlight("Directory", colors.white)
    highlight("EndOfBuffer", colors.bg)
    highlight("Error", colors.bright_white)
    highlight("ErrorMsg", colors.bright_white)
    highlight("Exception", colors.pink)
    highlight("Float", colors.white)
    highlight("FloatBorder", colors.white)
    highlight("FoldColumn")
    highlight("Folded", colors.dark_gray)
    highlight("Function", colors.white)
    highlight("Identifier", colors.white)
    highlight("IncSearch", colors.orange, colors.comment)
    highlight("Include", colors.gray)
    highlight("Keyword", colors.gray)
    highlight("Keywords", colors.gray)
    highlight("Label", colors.gray)
    highlight("LineNr", colors.dark_gray)
    highlight("Macro", colors.gray)
    highlight("MatchParen", colors.fg, nil, "underline")
    highlight("NonText", colors.nontext)
    highlight("Normal", colors.fg, colors.bg)
    highlight("NormalFloat", colors.fg, colors.bg)
    highlight("Number", colors.white)
    highlight("Operator", colors.gray)
    highlight("Pmenu", colors.white, colors.menu)
    highlight("PmenuSbar", nil, colors.bg)
    highlight("PmenuSel", colors.white, colors.selection)
    highlight("PmenuThumb", nil, colors.selection)
    highlight("PreCondit", colors.cyan)
    highlight("PreProc", colors.gray)
    highlight("Question", colors.white)
    highlight("QuickFixLine", colors.black, colors.yellow)
    highlight("Repeat", colors.gray)
    highlight("Search", colors.black, colors.orange)
    highlight("SignColumn", nil, colors.bg)
    highlight("Special", colors.white)
    highlight("SpecialComment", colors.dark_gray, nil, "italic")
    highlight("SpecialKey", colors.nontext)
    highlight("SpellBad", colors.bright_white, nil, "underline")
    highlight("SpellCap", colors.yellow)
    highlight("SpellLocal", colors.yellow)
    highlight("SpellRare", colors.yellow)
    highlight("Statement", colors.white)
    highlight("StatusLine", colors.white, colors.black)
    highlight("StatusLineNC", colors.dark_gray)
    highlight("StatusLineTerm", colors.white, colors.black)
    highlight("StatusLineTermNC", colors.dark_gray)
    highlight("StorageClass", colors.white)
    highlight("String", colors.bright_white)
    highlight("Structure", colors.white)
    highlight("TabLine", colors.dark_gray)
    highlight("TabLineFill", nil, colors.black)
    highlight("TabLineSel", colors.white)
    highlight("Terminal", colors.white, colors.black)
    highlight("Title", colors.white)
    highlight("Todo", colors.bright_white, nil, "bold,italic")
    highlight("Type", colors.white)
    highlight("TypeDef", colors.white)
    highlight("Underlined", colors.white, nil, "underline")
    highlight("VertSplit", colors.dark_gray)
    highlight("Visual", nil, colors.visual)
    highlight("VisualNOS", colors.visual)
    highlight("WarningMsg", colors.yellow)
    highlight("WildMenu", colors.black, colors.white)
    highlight("WinSeparator", colors.dark_gray)

    -- treesitter
    highlight("@annotation", colors.gray)
    highlight("@attribute", colors.gray)
    highlight("@boolean", colors.white)
    highlight("@character", colors.white)
    highlight("@character.special", colors.white)
    highlight("@comment", colors.dark_gray)
    highlight("@conditional", colors.white)
    highlight("@constant", colors.white)
    highlight("@constant.builtin", colors.white)
    highlight("@constant.macro", colors.gray)
    highlight("@constructor", colors.white)
    highlight("@debug", colors.white)
    highlight("@define", colors.white)
    highlight("@error", colors.bright_white)
    highlight("@exception", colors.white)
    highlight("@field", colors.white)
    highlight("@float", colors.white)
    highlight("@function", colors.white)
    highlight("@function.builtin", colors.white)
    highlight("@function.macro", colors.white)
    highlight("@include", colors.gray)
    highlight("@keyword", colors.gray)
    highlight("@keyword.function", colors.gray)
    highlight("@keyword.operator", colors.gray)
    highlight("@label", colors.gray)
    highlight("@method", colors.white)
    highlight("@namespace", colors.gray)
    highlight("@number", colors.white)
    highlight("@operator", colors.gray)
    highlight("@parameter", colors.white)
    highlight("@parameter.reference", colors.gray)
    highlight("@property", colors.white)
    highlight("@punctuation.bracket", colors.gray)
    highlight("@punctuation.delimiter", colors.gray)
    highlight("@punctuation.special", colors.gray)
    highlight("@repeat", colors.gray)
    highlight("@string", colors.bright_white)
    highlight("@string.escape", colors.white)
    highlight("@string.regex", colors.white)
    highlight("@string.special", colors.white)
    highlight("@structure", colors.white)
    highlight("@symbol", colors.white)
    highlight("@tag", colors.white)
    highlight("@tag.attribute", colors.gray)
    highlight("@tag.delimiter", colors.gray)
    highlight("@text", colors.white)
    highlight("@text.emphasis", colors.white, nil, "italic")
    highlight("@text.literal", colors.white)
    highlight("@text.strong", colors.white, nil, "bold")
    highlight("@text.title", colors.white)
    highlight("@text.underline", colors.white, nil, "underline")
    highlight("@text.uri", colors.white, nil, "italic")
    highlight("@type", colors.white)
    highlight("@type.builtin", colors.white, nil, "italic")
    highlight("@type.definition", colors.white)
    highlight("@variable", colors.white)
    highlight("@variable.builtin", colors.white)

    -- html
    highlight("htmlArg", colors.gray)
    highlight("htmlBold", colors.gray, nil, "bold")
    highlight("htmlEndTag", colors.white)
    highlight("htmlH1", colors.white)
    highlight("htmlH2", colors.white)
    highlight("htmlH3", colors.white)
    highlight("htmlH4", colors.white)
    highlight("htmlH5", colors.white)
    highlight("htmlH6", colors.white)
    highlight("htmlItalic", colors.white, nil, "italic")
    highlight("htmlLink", colors.white, nil, "underline")
    highlight("htmlSpecialChar", colors.gray)
    highlight("htmlSpecialTagName", colors.white)
    highlight("htmlTag", colors.gray)
    highlight("htmlTagN", colors.gray)
    highlight("htmlTagName", colors.white)
    highlight("htmlTitle", colors.white)

    -- markdown
    highlight("markdownBlockquote", colors.yellow, nil, "italic")
    highlight("markdownBold", colors.orange, nil, "bold")
    highlight("markdownCode", colors.green)
    highlight("markdownCodeBlock", colors.orange)
    highlight("markdownCodeDelimiter", colors.red)
    highlight("markdownH1", colors.purple, nil, "bold")
    highlight("markdownH2", colors.purple, nil, "bold")
    highlight("markdownH3", colors.purple, nil, "bold")
    highlight("markdownH4", colors.purple, nil, "bold")
    highlight("markdownH5", colors.purple, nil, "bold")
    highlight("markdownH6", colors.purple, nil, "bold")
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
    highlight("diffFile", colors.nontext)
    highlight("diffFileId", colors.yellow, nil, "bold,reverse")
    highlight("diffNewFile", colors.green)
    highlight("diffOldFile", colors.red)
    highlight("diffRemoved", colors.red)

    highlight("debugBreakpoint", colors.red, nil, "reverse")
    highlight("debugPc", nil, colors.cyan)

    -- telescope
    highlight("TelescopeMatching", colors.green)
    highlight("TelescopeMultiSelection", colors.purple, colors.selection)
    highlight("TelescopeNormal", colors.fg, colors.bg)
    highlight("TelescopePreviewBorder", colors.comment)
    highlight("TelescopePromptBorder", colors.comment)
    highlight("TelescopePromptPrefix", colors.purple)
    highlight("TelescopeResultsBorder", colors.comment)
    highlight("TelescopeSelection", colors.white, colors.selection)

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
    highlight("DiagnosticFloatingError", colors.red)
    highlight("DiagnosticFloatingHint", colors.cyan)
    highlight("DiagnosticFloatingInfo", colors.cyan)
    highlight("DiagnosticFloatingWarn", colors.yellow)
    highlight("DiagnosticHint", colors.cyan)
    highlight("DiagnosticInfo", colors.cyan)
    highlight("DiagnosticSignError", colors.red)
    highlight("DiagnosticSignHint", colors.cyan)
    highlight("DiagnosticSignInfo", colors.cyan)
    highlight("DiagnosticSignWarn", colors.yellow)
    highlight("DiagnosticUnderlineError", nil, nil, "undercurl", colors.red)
    highlight("DiagnosticUnderlineHint", nil, nil, "undercurl", colors.cyan)
    highlight("DiagnosticUnderlineInfo", nil, nil, "undercurl", colors.cyan)
    highlight("DiagnosticUnderlineWarn", nil, nil, "undercurl", colors.yellow)
    highlight("DiagnosticVirtualTextError", colors.red)
    highlight("DiagnosticVirtualTextHint", colors.cyan)
    highlight("DiagnosticVirtualTextInfo", colors.cyan)
    highlight("DiagnosticVirtualTextWarn", colors.yellow)
    highlight("DiagnosticWarn", colors.yellow)
    highlight("LspDiagnosticsDefaultError", colors.red)
    highlight("LspDiagnosticsDefaultHint", colors.cyan)
    highlight("LspDiagnosticsDefaultInformation", colors.cyan)
    highlight("LspDiagnosticsDefaultWarning", colors.yellow)
    highlight("LspDiagnosticsUnderlineError", colors.red, nil, "undercurl")
    highlight("LspDiagnosticsUnderlineHint", colors.cyan, nil, "undercurl")
    highlight(
        "LspDiagnosticsUnderlineInformation",
        colors.cyan,
        nil,
        "undercurl"
    )
    highlight(
        "LspDiagnosticsUnderlineWarning",
        colors.yellow,
        nil,
        "undercurl"
    )
    highlight("LspFloatWinBorder", colors.comment)
    highlight("LspFloatWinNormal", colors.fg)
    highlight("LspLinesDiagBorder", colors.comment)
    highlight("LspReferenceRead", colors.orange)
    highlight("LspReferenceText", colors.orange)
    highlight("LspReferenceWrite", colors.orange)

    -- indent-blankline
    highlight("IndentBlanklineContextChar", colors.gray, nil, "nocombine")

    --barbar
    highlight("BufferCurrentIndex", colors.pink)
    highlight("BufferCurrentSign", colors.pink)
    highlight("BufferCurrentTarget", colors.red)
    highlight("BufferInactiveTarget", colors.red)
    highlight("BufferTabPages", colors.pink)
    highlight("BufferVisibleTarget", colors.red)

    -- nvim-cmp
    highlight("CmpBorderedWindow_CursorLine", colors.white, colors.selection)
    highlight("CmpBorderedWindow_FloatBorder", colors.dark_gray)
    highlight("CmpBorderedWindow_Normal", colors.white)
    highlight(
        "CmpItemAbbrDeprecated",
        colors.white,
        colors.menu,
        "strikethrough"
    )
    highlight("CmpItemAbbrMatch", colors.cyan, colors.menu)
    highlight("CmpItemAbbrMatchFuzzy", colors.cyan, colors.menu)
    highlight_link("CmpItemAbbr", "Pmenu")
    highlight_link("CmpItemKind", "Pmenu")
    highlight_link("CmpItemKindClass", "@type")
    highlight_link("CmpItemKindColor", "DevIconCss")
    highlight_link("CmpItemKindConstant", "@constant")
    highlight_link("CmpItemKindConstructor", "@type")
    highlight_link("CmpItemKindEnum", "@field")
    highlight_link("CmpItemKindEnumMember", "@field")
    highlight_link("CmpItemKindEvent", "@constant")
    highlight_link("CmpItemKindField", "@field")
    highlight_link("CmpItemKindFile", "@text.uri")
    highlight_link("CmpItemKindFolder", "@text.uri")
    highlight_link("CmpItemKindFunction", "@function")
    highlight_link("CmpItemKindInterface", "@type")
    highlight_link("CmpItemKindKeyword", "@keyword")
    highlight_link("CmpItemKindMethod", "@method")
    highlight_link("CmpItemKindModule", "@namespace")
    highlight_link("CmpItemKindOperator", "@operator")
    highlight_link("CmpItemKindProperty", "@property")
    highlight_link("CmpItemKindReference", "@parameter.reference")
    highlight_link("CmpItemKindSnippet", "@text")
    highlight_link("CmpItemKindStruct", "@structure")
    highlight_link("CmpItemKindText", "@text")
    highlight_link("CmpItemKindTypeParameter", "@parameter")
    highlight_link("CmpItemKindUnit", "@field")
    highlight_link("CmpItemKindValue", "@field")
    highlight_link("CmpItemKindVariable", "@variable")
    highlight_link("CmpItemMenu", "Pmenu")
end

return M
