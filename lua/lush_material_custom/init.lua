-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl
-- local colors = require('lush_theme.colors')

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local colors = {
    -- bg = hsl(0, 0, 16),
    bg = hsl(180, 0, 13),
    -- fg = hsl(0, 0, 85),
    fg = hsl(43, 43, 85),
    -- red = hsl(357, 81, 69),
    red = hsl(6, 80, 59),
    -- green = hsl(84, 66, 73),
    -- green = hsl(61, 66, 44),
    green = hsl(64, 66, 50),
    yellow = hsl(39, 100, 71),
    blue = hsl(221, 100, 75),
    purple = hsl(276, 68, 75),
    cyan = hsl(197, 100, 77),

    debug = hsl("#ff00ff"),

    darkgreen = hsl(84, 40, 14),
    darkblue = hsl(213, 89, 26),
    darkred = hsl(357, 40, 16),

    columns = hsl(0, 0, 20),
    nontext = hsl(0, 0, 30),
    borders = hsl(0, 0, 40),
    comment = hsl(0, 0, 54),
    selected_tab = hsl(225, 12, 32),
    lightgrey = hsl(210, 17, 40),
    lightgrey2 = hsl(210, 17, 72),
  }

  -- vim.g.terminal_color_0          = colors.borders
  -- vim.g.terminal_color_1          = colors.red
  -- vim.g.terminal_color_2          = colors.green
  -- vim.g.terminal_color_3          = colors.yellow
  -- vim.g.terminal_color_4          = colors.blue
  -- vim.g.terminal_color_5          = colors.purple
  -- vim.g.terminal_color_6          = colors.cyan
  -- vim.g.terminal_color_7          = colors.lightgrey2
  -- vim.g.terminal_color_8          = colors.borders
  -- vim.g.terminal_color_9          = colors.red
  -- vim.g.terminal_color_10         = colors.green
  -- vim.g.terminal_color_11         = colors.yellow
  -- vim.g.terminal_color_12         = colors.blue
  -- vim.g.terminal_color_13         = colors.purple
  -- vim.g.terminal_color_14         = colors.cyan
  -- vim.g.terminal_color_15         = colors.fg
  -- vim.g.terminal_color_background = colors.bg
  -- vim.g.terminal_color_foreground = colors.fg

  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn  { bg = colors.columns }, -- Columns set with 'colorcolumn'
    Conceal      { fg = colors.nontext }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = colors.fg, fg = colors.bg }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    iCursor      { bg = colors.yellow, fg = colors.bg },
    vCursor      { bg = colors.blue, fg = colors.bg },
    rCursor      { bg = colors.red, fg = colors.bg },
    -- CursorColumn { bg = colors.columns }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine   { bg = colors.columns }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { bg = colors.bg }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = colors.bg }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = colors.blue }, -- Directory names (and other special names in listings)

    DiffAdd      { bg = colors.darkgreen, fg = colors.green }, -- Diff mode: Added line |diff.txt|
    DiffChange   { bg = colors.darkblue, fg = colors.blue }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { bg = colors.darkred, fg = colors.red }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg = colors.cyan, fg = colors.bg }, -- Diff mode: Changed text within a changed line |diff.txt|

    diffAdded   { DiffAdd },
    diffRemoved { DiffDelete },
    diffChanged { DiffChange },
    diffText { DiffText },
    diffLine { bg = colors.yellow, fg = colors.bg  },
    diffSubname { bg = colors.yellow, fg = colors.bg  },

    EndOfBuffer  { fg = colors.borders }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = colors.red }, -- Error messages on the command line
    VertSplit    { fg = colors.borders }, -- Column separating vertically split windows
    WinSeparator { VertSplit },
    FloatBorder { fg = colors.fg, bg = colors.bg },
    Folded       { bg = colors.nontext, fg = colors.fg }, -- Line used for closed folds
    FoldColumn   { fg = colors.fg }, -- 'foldcolumn'
    SignColumn   { fg = colors.fg }, -- Column where |signs| are displayed
    IncSearch    { bg = colors.cyan, fg = colors.bg, gui = "bold" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = colors.borders }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = colors.fg, gui = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { bg = colors.borders, fg = colors.fg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = colors.blue }, -- |more-prompt|
    NonText      { fg = colors.nontext }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { bg = colors.bg, fg = colors.fg }, -- Normal text
    -- NormalFloat  { }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { bg = colors.nontext }, -- Popup menu: Normal item.
    PmenuSel     { bg = colors.lightgrey2, fg = colors.bg }, -- Popup menu: Selected item.
    PmenuSbar    { bg = colors.nontext }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = colors.lightgrey2 }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = colors.green }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = colors.blue, fg = colors.bg,  gui = "bold" }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { fg = colors.nontext }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { fg = colors.red, gui = "underline" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { fg = colors.blue, gui = "underline" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { fg = colors.purple, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { fg = colors.cyan, gui = "underline" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.

    StatusLine   { bg = colors.columns, fg = colors.fg }, -- Status line of current window
    StatusLineNC { bg = colors.bg, fg = colors.fg }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    StatusLineNameError { bg = colors.columns, fg = colors.red },
    StatusLineNameWarning { bg = colors.columns, fg = colors.yellow },
    StatusLine2 { bg = colors.columns, fg = colors.fg },

    StatusLineModeNormal   { bg = colors.columns, fg = colors.fg },
    StatusLineModePending  { bg = colors.columns, fg = colors.fg },
    StatusLineModeInsert   { bg = colors.columns, fg = colors.fg },
    StatusLineModeVisual   { bg = colors.columns, fg = colors.fg },
    StatusLineModeVLine    { bg = colors.columns, fg = colors.fg },
    StatusLineModeVBlock   { bg = colors.columns, fg = colors.fg },
    StatusLineModeSelect   { bg = colors.columns, fg = colors.fg },
    StatusLineModeSLine    { bg = colors.columns, fg = colors.fg },
    StatusLineModeSBlock   { bg = colors.columns, fg = colors.fg },
    StatusLineModeReplace  { bg = colors.columns, fg = colors.fg },
    StatusLineModeVReplace { bg = colors.columns, fg = colors.fg },
    StatusLineModeCommand  { bg = colors.columns, fg = colors.fg },
    StatusLineModeEx       { bg = colors.columns, fg = colors.fg },
    StatusLineModeShell    { bg = colors.columns, fg = colors.fg },
    StatusLineModeTerminal { bg = colors.columns, fg = colors.fg },

    StatusLineGitAdd    { bg = colors.columns, fg = colors.green },
    StatusLineGitChange { bg = colors.columns, fg = colors.blue },
    StatusLineGitDelete { bg = colors.columns, fg = colors.red },

    StatusLineError     { fg = colors.bg, bg = colors.red },
    StatusLineWarn      { fg = colors.bg, bg = colors.yellow },
    StatusLineInfo      { fg = colors.bg, bg = colors.blue },
    StatusLineHint      { fg = colors.bg, bg = colors.cyan },

    WinBar              { fg = colors.fg, gui = "bold" },
    WinBarNC            { fg = colors.comment, gui = "bold" },
    WinBarLocation      { fg = colors.comment },
    WinBarNameError     { fg = colors.red, gui = "bold" },
    WinBarNameWarning   { fg = colors.yellow, gui = "bold" },

    TabLine      { bg = colors.bg, fg = colors.fg }, -- Tab pages line, not active tab page label
    TabLineFill  { bg = colors.bg, fg = colors.fg }, -- Tab pages line, where there are no labels
    TabLineSel   { bg = colors.selected_tab, fg = colors.fg }, -- Tab pages line, active tab page label

    Title        { fg = colors.fg }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = colors.borders, fg = colors.fg }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = colors.red }, -- Warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { bg = colors.nontext, fg = colors.fg }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = colors.comment }, -- Any comment

    Constant       { fg = colors.red }, -- (*) Any constant
    String         { fg = colors.green }, --   A string constant: "this is a string"
    Character      { fg = colors.red }, --   A character constant: 'c', '\n'
    Number         { fg = colors.blue }, --   A number constant: 234, 0xff
    Boolean        { fg = colors.red }, --   A boolean constant: TRUE, false
    Float          { fg = colors.blue }, --   A floating point constant: 2.3e10

    Identifier     { fg = colors.purple }, -- (*) Any variable name
    Function       { fg = colors.yellow }, --   Function name (also: methods for classes)

    Statement      { fg = colors.blue }, -- (*) Any statement
    Conditional    { fg = colors.blue }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = colors.blue }, --   for, do, while, etc.
    Label          { fg = colors.blue }, --   case, default, etc.
    Operator       { fg = colors.blue }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = colors.blue }, --   any other keyword
    Exception      { fg = colors.blue }, --   try, catch, throw

    PreProc        { fg = colors.cyan }, -- (*) Generic Preprocessor
    Include        { fg = colors.cyan }, --   Preprocessor #include
    Define         { fg = colors.cyan }, --   Preprocessor #define
    Macro          { fg = colors.cyan }, --   Same as Define
    PreCondit      { fg = colors.cyan }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = colors.yellow }, -- (*) int, long, char, etc.
    StorageClass   { fg = colors.yellow }, --   static, register, volatile, etc.
    Structure      { fg = colors.blue }, --   struct, union, enum, etc.
    Typedef        { fg = colors.yellow }, --   A typedef

    Special        { fg = colors.blue }, -- (*) Any special symbol
    SpecialChar    { fg = colors.red }, --   Special character in a constant
    Tag            { fg = colors.cyan }, --   You can use CTRL-] on this
    Delimiter      { fg = colors.fg }, --   Character that needs attention
    SpecialComment { fg = colors.green }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = colors.debug }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { fg = colors.debug }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = colors.red }, -- Any erroneous construct
    Todo           { fg = colors.fg, gui = "bold" }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    -- LSP
    DiagnosticError            { fg = colors.red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { fg = colors.yellow } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { fg = colors.blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = colors.cyan } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { fg = colors.red } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { fg = colors.yellow } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { fg = colors.blue } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { fg = colors.cyan } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { fg = colors.red, gui = "underline" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { fg = colors.yellow, gui = "underline" } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { fg = colors.blue, gui = "underline" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { fg = colors.cyan, gui = "underline" } , -- Used to underline "Hint" diagnostics.
    DiagnosticFloatingError    { fg = colors.red } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn     { fg = colors.yellow } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     { fg = colors.blue } , -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     { fg = colors.cyan } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError        { fg = colors.red } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { fg = colors.yellow } , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { fg = colors.blue } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { fg = colors.cyan } , -- Used for "Hint" signs in sign column.

    -- vim-sneak
    Sneak { Search },

    -- voldikss/vim-floaterm
    FloatermBorder { bg = colors.bg, fg = colors.fg },

    -- nvim-telescope/telescope
    TelescopeTitle          { gui = "bold" },
    TelescopeSelection      { bg = colors.nontext, fg = colors.fg },
    TelescopeMatching       { fg = colors.yellow, gui = "bold" },
    TelescopeMultiSelection { fg = colors.purple, gui = "bold" },

    -- folke/todo-comments
    CommentYellow { fg = colors.yellow, gui = "bold" },
    CommentRed    { fg = colors.red, gui = "bold" },
    CommentBlue   { fg = colors.blue, gui = "bold" },
    CommentCyan   { fg = colors.cyan, gui = "bold" },
    CommentPurple { fg = colors.purple, gui = "bold" },
    CommentGreen  { fg = colors.green, gui = "bold" },
    CommentWhite  { fg = colors.fg, gui = "bold" },

    -- lukas-reineke/indent-blankline
    IndentBlanklineChar        { fg = colors.nontext },
    IndentBlanklineContextChar { fg = colors.lightgrey2, gui = "nocombine" },

    -- hrsh7th/nvim-cmp
    CmpItemAbbrDeprecated { fg = colors.red },
    CmpItemAbbrMatch      { fg = colors.yellow, gui = "bold" },
    CmpItemAbbrMatchFuzzy { fg = colors.yellow, gui = "bold" },

    -- lewis6991/gitsigns
    GitSignsAdd    { fg = colors.green },
    GitSignsDelete { fg = colors.red },
    GitSignsChange { fg = colors.blue },

    -- airblade/vim-gitgutter
    GitGutterAdd    { fg = colors.green },
    GitGutterDelete { fg = colors.red },
    GitGutterChange { fg = colors.blue },


    -- markdown
    -- htmlH1 { fg = colors.bg, bg = colors.green },
    -- htmlH2 { fg = colors.bg, bg = colors.blue },
    -- htmlH3 { fg = colors.bg, bg = colors.yellow },
    -- htmlH4 { fg = colors.bg, bg = colors.purple },
    -- htmlH5 { fg = colors.bg, bg = colors.red },
    -- htmlH6 { fg = colors.bg, bg = colors.cyan },
    mkdHeading { fg = colors.borders },
    htmlLink { fg = colors.blue, gui = "underline" },
    mkdLink { fg = colors.blue, gui = "underline" },
    mkdURL { fg = colors.blue, gui = "underline" },
    htmlItalic { gui = "italic" },
    mkdItalic { gui = "italic" },
    htmlBold { gui = "bold" },
    mkdBold { gui = "bold" },
    htmlBoldItalic { gui = "bold,italic" },
    mkdBoldItalic { gui = "bold,italic" },
    htmlStrike { gui = "strikethrough" },
    mkdStrike { gui = "strikethrough" },
    mkdCodeDelimiter { fg = colors.borders },
    mkdCodeStart { fg = colors.borders },
    mkdCodeEnd { fg = colors.borders },
    mkdCode { fg = colors.yellow },


    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    sym"@annotation"            { PreProc },
    sym"@attribute"             { PreProc },
    sym"@boolean"               { Boolean }, -- Boolean
    sym"@character"             { Character }, -- Character
    sym"@character.special"     { SpecialChar }, -- SpecialChar
    sym"@comment"               { Comment }, -- Comment
    sym"@conditional"           { Conditional }, -- Conditional
    sym"@constant"              { Constant }, -- Constant
    sym"@constant.builtin"      { Special }, -- Special
    -- sym"@constant.macro"        { Define },
    sym"@constant.macro"    { Macro }, -- Define
    sym"@constructor"           { Special }, -- Special
    sym"@debug"                 { Debug }, -- Debug
    sym"@define"                { Define }, -- Define
    sym"@exception"             { Exception }, -- Exception
    sym"@field"                 { Identifier }, -- Identifier
    sym"@float"                 { Float }, -- Float
    sym"@function"              { Function }, -- Function
    sym"@function.builtin"      { Special }, -- Special
    sym"@function.call"         { Function },
    sym"@function.macro"        { Macro }, -- Macro
    sym"@include"               { Include }, -- Include
    sym"@keyword"               { Keyword }, -- Keyword
    sym"@keyword.function"      { Keyword },
    sym"@keyword.operator"      { Operator },
    sym"@keyword.return"        { Keyword },
    sym"@label"                 { Label }, -- Label
    sym"@macro"                 { Macro }, -- Macro
    sym"@method"                { Function }, -- Function
    sym"@method.call"           { Function },
    -- sym"@namespace"             { Include },
    sym"@namespace"         { Identifier }, -- Identifier
    -- sym"@none"               { },
    sym"@number"                { Number }, -- Number
    sym"@operator"              { Operator }, -- Operator
    sym"@parameter"             { Identifier }, -- Identifier
    sym"@parameter.reference"   { Identifier },
    sym"@preproc"               { PreProc}, -- PreProc
    sym"@property"              { Delimiter }, -- Identifier
    sym"@punctuation"           { Delimiter }, -- Delimiter
    sym"@punctuation.bracket"   { Delimiter },
    sym"@punctuation.delimiter" { Delimiter },
    sym"@punctuation.special"   { Delimiter },
    sym"@repeat"                { Repeat }, -- Repeat
    sym"@storageclass"          { StorageClass }, -- StorageClass
    sym"@string"                { String }, -- String
    sym"@string.escape"         { SpecialChar }, -- SpecialChar
    sym"@string.regex"          { String },
    sym"@string.special"        { SpecialChar }, -- SpecialChar
    sym"@structure"             { Structure }, -- Structure
    sym"@symbol"                { Identifier },
    -- sym"@tag"                   { Label },
    sym"@tag"               { Tag }, -- Tag
    sym"@tag.attribute"         { Identifier },
    sym"@tag.delimiter"         { Delimiter },
    -- sym"@text"               { @none },
    sym"@text.danger"           { WarningMsg },
    sym"@text.emphasis"         { gui = "italic" },
    sym"@text.environment"      { Macro },
    sym"@text.environment.name" { Type },
    sym"@text.literal"          { String }, -- Comment
    sym"@text.math"             { Special },
    sym"@text.note"             { SpecialComment },
    sym"@text.reference"        { Constant }, -- Identifier
    sym"@text.strike"           { gui = "strikethrough" },
    sym"@text.strong"           { gui = "bold" },
    sym"@text.title"            { Title }, -- Title
    sym"@text.underline"        { Underlined }, -- Underlined
    -- sym"@text.uri"              { Underlined },
    sym"@text.uri"              { Underlined, fg = colors.blue }, -- Underlined
    sym"@text.warning"          { Todo },
    sym"@text.todo"             { Todo }, -- Todo
    sym"@type"                  { Type }, -- Type
    sym"@type.builtin"          { Type },
    sym"@type.definition"       { Typedef }, -- Typedef
    sym"@type.qualifier"        { Type },
    sym"@variable"              { Identifier }, -- Identifier
    sym"@variable.builtin"      { Special },
  }


end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
