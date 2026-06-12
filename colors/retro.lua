-- colors/retro.lua
-- Retroism · yorha 主題（淺色暖調；數字/常數用 ochre，UI 強調用 olive）

local retro = {}

retro.setup = function()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "retro"

  -- ===== yorha 色票 =====
  local bg        = "#d9caba"   -- 主背景
  local bg_alt    = "#cfc0ac"   -- 次面板 / float
  local bg_dark   = "#c2b39e"   -- 更深面板
  local cursorln  = "#cfc0ac"   -- 游標行
  local fg        = "#2b2a26"   -- 主文字
  local muted     = "#8a7c66"   -- 註解 / 次要
  local border    = "#8a7c66"   -- 分隔線 / 邊框
  local sel_bg    = "#b8a98f"   -- 視覺選取
  local line_nr   = "#a89a82"   -- 行號

  local accent    = "#626335"   -- olive：UI 強調(資料夾/標題/狀態列)
  local num       = "#a8782a"   -- ochre：數字/常數/布林
  local accent_lt = "#f0e2d3"   -- 強調背景上的淺字

  -- ANSI / 語法（壓深，淺底可讀）
  local black     = "#2b2a26"
  local red       = "#9e3b2e"
  local green     = "#5e6e2f"
  local yellow    = "#a8782a"
  local blue      = "#3d5a72"
  local purple    = "#7c4a60"
  local cyan      = "#3f7068"
  local white     = "#3e3d38"

  local bright_black  = "#6b655a"
  local bright_red    = "#c0492f"
  local bright_green  = "#76883a"
  local bright_yellow = "#c08f33"
  local bright_blue   = "#4f7390"
  local bright_purple = "#98607b"
  local bright_cyan   = "#4f8a7e"
  local bright_white  = "#2b2a26"

  local function hl(g, o) vim.api.nvim_set_hl(0, g, o) end

  -- ===== 基本介面 =====
  hl("Normal",       { fg = fg, bg = bg })
  hl("LineNr",       { fg = line_nr, bg = bg })
  hl("CursorLineNr", { fg = accent, bold = true })
  hl("CursorLine",   { bg = cursorln })
  hl("Visual",       { bg = sel_bg })
  hl("NonText",      { fg = muted })

  hl("StatusLine",   { fg = accent_lt, bg = accent, bold = true })
  hl("StatusLineNC", { fg = muted, bg = bg_alt })
  hl("VertSplit",    { fg = border })

  -- ===== 語法高亮 =====
  hl("Comment",    { fg = muted, italic = true })
  hl("Constant",   { fg = num })
  hl("String",     { fg = green })
  hl("Character",  { fg = num })
  hl("Number",     { fg = num })
  hl("Boolean",    { fg = num, bold = true })
  hl("Float",      { fg = num })

  hl("Identifier", { fg = fg })
  hl("Function",   { fg = blue })
  hl("Statement",  { fg = purple, bold = true })
  hl("Keyword",    { fg = purple, bold = true })
  hl("Operator",   { fg = muted })
  hl("Type",       { fg = cyan, bold = true })
  hl("Structure",  { fg = yellow })
  hl("Tag",        { fg = red })

  -- ===== LSP / 診斷 =====
  hl("DiagnosticError", { fg = red })
  hl("DiagnosticWarn",  { fg = yellow })
  hl("DiagnosticInfo",  { fg = blue })
  hl("DiagnosticHint",  { fg = green })

  -- ===== 終端 ANSI 色 =====
  vim.g.terminal_color_0  = black
  vim.g.terminal_color_1  = red
  vim.g.terminal_color_2  = green
  vim.g.terminal_color_3  = yellow
  vim.g.terminal_color_4  = blue
  vim.g.terminal_color_5  = purple
  vim.g.terminal_color_6  = cyan
  vim.g.terminal_color_7  = white
  vim.g.terminal_color_8  = bright_black
  vim.g.terminal_color_9  = bright_red
  vim.g.terminal_color_10 = bright_green
  vim.g.terminal_color_11 = bright_yellow
  vim.g.terminal_color_12 = bright_blue
  vim.g.terminal_color_13 = bright_purple
  vim.g.terminal_color_14 = bright_cyan
  vim.g.terminal_color_15 = bright_white

  -- ===== Treesitter link =====
  hl("@comment",          { link = "Comment" })
  hl("@constant",         { link = "Constant" })
  hl("@string",           { link = "String" })
  hl("@number",           { link = "Number" })
  hl("@boolean",          { link = "Boolean" })
  hl("@type",             { link = "Type" })
  hl("@type.builtin",     { link = "Type" })
  hl("@keyword",          { link = "Keyword" })
  hl("@keyword.function", { link = "Keyword" })
  hl("@function",         { link = "Function" })
  hl("@variable",         { link = "Identifier" })
  hl("@variable.builtin", { fg = accent, bold = true })

  -- ===== TabLine =====
  hl("TabLine",     { fg = accent, bg = bg })
  hl("TabLineSel",  { fg = accent_lt, bg = accent, bold = true })
  hl("TabLineFill", { bg = "NONE" })

  -- ===== NvimTree =====
  hl("NvimTreeNormal",      { fg = fg, bg = bg })
  hl("NvimTreeNormalNC",    { fg = fg, bg = bg })
  hl("NvimTreeEndOfBuffer", { fg = bg, bg = bg })
  hl("NvimTreeWinSeparator",{ fg = border, bg = bg })
  hl("NvimTreeCursorLine",  { bg = cursorln })

  hl("NvimTreeRootFolder",        { fg = accent, bold = true })
  hl("NvimTreeFolderName",        { fg = accent, bold = true })
  hl("NvimTreeOpenedFolderName",  { fg = accent, bold = true })
  hl("NvimTreeEmptyFolderName",   { fg = red })
  hl("NvimTreeFolderIcon",        { fg = accent })
  hl("NvimTreeIndentMarker",      { fg = muted })

  hl("NvimTreeExecFile",   { fg = green, bold = true })
  hl("NvimTreeSpecialFile",{ fg = num, italic = true })
  hl("NvimTreeSymlink",    { fg = cyan })
  hl("NvimTreeImageFile",  { fg = purple })
  hl("NvimTreeModified",   { fg = num })

  hl("NvimTreeGitDirty",   { fg = num })
  hl("NvimTreeGitStaged",  { fg = green })
  hl("NvimTreeGitNew",     { fg = bright_green })
  hl("NvimTreeGitDeleted", { fg = red })
  hl("NvimTreeGitRenamed", { fg = num })
  hl("NvimTreeGitIgnored", { fg = muted })

  hl("NvimTreeLiveFilterPrefix", { fg = red, bold = true })
  hl("NvimTreeLiveFilterValue",  { fg = accent, bold = true })

  -- ===== Lazy.nvim 面板 =====
  hl("LazyNormal",       { fg = fg, bg = bg })
  hl("LazyH1",           { fg = accent_lt, bg = accent, bold = true })
  hl("LazyButton",       { fg = accent, bg = bg })
  hl("LazyButtonActive", { fg = accent_lt, bg = accent, bold = true })
  hl("LazyComment",      { fg = muted, italic = true })
  hl("LazySpecial",      { fg = purple, bold = true })
  hl("LazyReasonEvent",  { fg = yellow })
  hl("LazyReasonStart",  { fg = cyan })
  hl("LazyReasonPlugin", { fg = bright_purple })
  hl("LazyReasonCmd",    { fg = yellow })
  hl("LazyProgressDone", { fg = green })
  hl("LazyProgressTodo", { fg = muted })

  -- ===== nvim-notify =====
  for _, t in ipairs({
    { "ERROR", red }, { "WARN", yellow }, { "INFO", blue },
    { "DEBUG", purple }, { "TRACE", cyan },
  }) do
    hl("Notify" .. t[1] .. "Border", { fg = t[2], bg = bg })
    hl("Notify" .. t[1] .. "Title",  { fg = t[2], bg = bg, bold = true })
    hl("Notify" .. t[1] .. "Icon",   { fg = t[2], bg = bg })
    hl("Notify" .. t[1] .. "Body",   { fg = fg,   bg = bg })
  end

  -- ===== Telescope =====
  hl("TelescopeNormal",       { fg = fg, bg = bg })
  hl("TelescopeBorder",       { fg = border, bg = bg })
  hl("TelescopeSelection",    { fg = fg, bg = cursorln, bold = true })
  hl("TelescopePromptPrefix", { fg = accent })
  hl("TelescopeMatching",     { fg = accent, bold = true })

  -- ===== Noice Cmdline =====
  for _, suffix in ipairs({ "", "Search", "Lua", "Help" }) do
    hl("NoiceCmdlinePopupBorder" .. suffix, { fg = accent, bg = bg_alt })
    hl("NoiceCmdlineIcon" .. suffix,        { fg = accent, bg = bg_alt })
  end

  -- ===== Float =====
  hl("NormalFloat", { fg = fg, bg = bg_alt })
  hl("FloatBorder", { fg = border, bg = bg_alt })
  hl("FloatTitle",  { fg = accent, bg = bg_alt, bold = true })
  hl("FloatFooter", { fg = muted, bg = bg_alt })

  hl("DiagnosticFloatingError", { fg = red,    bg = bg_alt })
  hl("DiagnosticFloatingWarn",  { fg = yellow, bg = bg_alt })
  hl("DiagnosticFloatingInfo",  { fg = blue,   bg = bg_alt })
  hl("DiagnosticFloatingHint",  { fg = green,  bg = bg_alt })

  hl("LspReferenceTarget", { bg = sel_bg })
end

retro.setup()
return retro
