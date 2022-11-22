local M = {}

local DEFAULT_COLORS = {
    comment = "#7970a9",
    selection = "#44475a",
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

    highlight("Boolean", colors.purple)
    highlight("Character", colors.green)
    highlight("ColorColumn", nil, colors.selection)
    highlight("Comment", colors.comment, nil, is_italic and "italic" or nil)
    highlight("Conceal", colors.comment)
    highlight("Conditional", colors.pink)
    highlight("Constant", colors.yellow)
    highlight("Cursor", nil, nil, "reverse")
    highlight("CursorColumn", nil, colors.black)
    highlight("CursorColumn", nil, colors.black, "reverse")
    highlight("CursorLine", nil, colors.selection)
    highlight("CursorLineNr", colors.fg, nil, "bold")
    highlight("Define", colors.purple)
    highlight("DiffAdd", colors.bg, colors.green)
    highlight("DiffChange", colors.orange)
    highlight("DiffDelete", colors.red)
    highlight("DiffText", colors.comment)
    highlight("Directory", colors.cyan)
    highlight("EndOfBuffer", colors.bg)
    highlight("Error", colors.bright_red)
    highlight("ErrorMsg", colors.bright_red)
    highlight("Exception", colors.pink)
    highlight("Float", colors.purple)
    highlight("FloatBorder", colors.white)
    highlight("FoldColumn")
    highlight("Folded", colors.comment)
    highlight("Function", colors.green)
    highlight("Identifier", colors.cyan)
    highlight("IncSearch", colors.orange, colors.comment)
    highlight("Include", colors.pink)
    highlight("Keyword", colors.pink)
    highlight("Keywords", colors.cyan)
    highlight("Label", colors.cyan)
    highlight("LineNr", colors.comment)
    highlight("Macro", colors.purple)
    highlight("MatchParen", colors.fg, nil, "underline")
    highlight("NonText", colors.nontext)
    highlight("Normal", colors.fg, colors.bg)
    highlight("NormalFloat", colors.fg, colors.bg)
    highlight("Number", colors.purple)
    highlight("Operator", colors.pink)
    highlight("Pmenu", colors.white, colors.menu)
    highlight("PmenuSbar", nil, colors.bg)
    highlight("PmenuSel", colors.white, colors.selection)
    highlight("PmenuThumb", nil, colors.selection)
    highlight("PreCondit", colors.cyan)
    highlight("PreProc", colors.comment)
    highlight("Question", colors.purple)
    highlight("QuickFixLine", colors.black, colors.yellow)
    highlight("Repeat", colors.pink)
    highlight("Search", colors.black, colors.orange)
    highlight("SignColumn", nil, colors.bg)
    highlight("Special", colors.pink)
    highlight("SpecialComment", colors.comment, nil, "italic")
    highlight("SpecialKey", colors.nontext)
    highlight("SpellBad", colors.bright_red, nil, "underline")
    highlight("SpellCap", colors.yellow)
    highlight("SpellLocal", colors.yellow)
    highlight("SpellRare", colors.yellow)
    highlight("Statement", colors.purple)
    highlight("StatusLine", colors.white, colors.black)
    highlight("StatusLineNC", colors.comment)
    highlight("StatusLineTerm", colors.white, colors.black)
    highlight("StatusLineTermNC", colors.comment)
    highlight("StorageClass", colors.pink)
    highlight("String", colors.yellow)
    highlight("Structure", colors.yellow)
    highlight("TabLine", colors.comment)
    highlight("TabLineFill", nil, colors.black)
    highlight("TabLineSel", colors.white)
    highlight("Terminal", colors.white, colors.black)
    highlight("Title", colors.cyan)
    highlight("Todo", colors.purple, nil, "bold,italic")
    highlight("Type", colors.cyan)
    highlight("TypeDef", colors.yellow)
    highlight("Underlined", colors.cyan, nil, "underline")
    highlight("VertSplit", colors.purple)
    highlight("Visual", nil, colors.visual)
    highlight("VisualNOS", colors.visual)
    highlight("WarningMsg", colors.yellow)
    highlight("WildMenu", colors.black, colors.white)
    highlight("WinSeparator", colors.purple)

    -- treesitter
    highlight("@annotation", colors.yellow)
    highlight("@attribute", colors.cyan)
    highlight("@boolean", colors.purple)
    highlight("@character", colors.green)
    highlight("@conditional", colors.pink)
    highlight("@constant", colors.purple)
    highlight("@constant.builtin", colors.purple)
    highlight("@constant.macro", colors.cyan)
    highlight("@constructor", colors.cyan)
    highlight("@error", colors.bright_red)
    highlight("@exception", colors.pink)
    highlight("@field", colors.fg)
    highlight("@float", colors.purple)
    highlight("@function", colors.green)
    highlight("@function.builtin", colors.cyan)
    highlight("@function.macro", colors.green)
    highlight("@include", colors.pink)
    highlight("@keyword", colors.pink)
    highlight("@keyword.function", colors.cyan)
    highlight("@keyword.operator", colors.pink)
    highlight("@label", colors.cyan)
    highlight("@method", colors.green)
    highlight("@namespace", colors.fg)
    highlight("@number", colors.purple)
    highlight("@operator", colors.pink)
    highlight("@parameter", colors.fg)
    highlight("@parameter.reference", colors.orange)
    highlight("@property", colors.fg)
    highlight("@punctuation.bracket", colors.pink)
    highlight("@punctuation.delimiter", colors.fg)
    highlight("@punctuation.special", colors.fg)
    highlight("@repeat", colors.pink)
    highlight("@string", colors.yellow)
    highlight("@string.escape", colors.cyan)
    highlight("@string.regex", colors.red)
    highlight("@structure", colors.purple)
    highlight("@tag", colors.green)
    highlight("@tag.delimiter", colors.white)
    highlight("@text", colors.orange)
    highlight("@text.emphasis", colors.yellow, nil, "italic")
    highlight("@text.literal", colors.green)
    highlight("@text.strong", colors.orange, nil, "bold")
    highlight("@text.title", colors.purple)
    highlight("@text.underline", colors.orange)
    highlight("@text.uri", colors.yellow, nil, "italic")
    highlight("@type", colors.blue)
    highlight("@type.builtin", colors.cyan, nil, "italic")
    highlight("@variable", colors.fg)
    highlight("@variable.builtin", colors.purple)

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
    highlight(
        "IndentBlanklineContextChar",
        colors.bright_red,
        nil,
        "nocombine"
    )

    --barbar
    highlight("BufferCurrentIndex", colors.pink)
    highlight("BufferCurrentSign", colors.pink)
    highlight("BufferCurrentTarget", colors.red)
    highlight("BufferInactiveTarget", colors.red)
    highlight("BufferTabPages", colors.pink)
    highlight("BufferVisibleTarget", colors.red)

    -- nvim-cmp
    highlight("CmpBorderedWindow_CursorLine", colors.white, colors.selection)
    highlight("CmpBorderedWindow_FloatBorder", colors.comment)
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
