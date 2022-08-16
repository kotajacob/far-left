local M = {
	black         = "#000000",
	dark_grey     = "#767676",
	grey          = "#AAAAAA",
	light_grey    = "#CCCCCC",
	lighter_grey  = "#EEEEEE",
	lightest_grey = "#F8F8F8",
	white         = "#FFFFFF",
	red           = "#eb3232",
	mint          = "#57bda0",
	orange        = "#ffb35b",
	purple        = "#888aca",
}

M.bg             = M.white
M.bg_subtle      = M.lighter_grey
M.bg_very_subtle = M.lightest_grey
M.fg             = M.black
M.fg_subtle      = M.dark_grey
M.fg_very_subtle = M.dark_grey

-- This is a bit of syntactic sugar for creating highlight groups.
--
-- local colorscheme = require('colorscheme')
-- local hi = colorscheme.highlight
-- hi.Comment = { guifg='#ffffff', guibg='#000000', gui='italic', guisp=nil }
-- hi.LspDiagnosticsDefaultError = 'DiagnosticError' -- Link to another group
--
-- This is equivalent to the following vimscript
--
-- hi Comment guifg=#ffffff guibg=#000000 gui=italic
-- hi! link LspDiagnosticsDefaultError DiagnosticError
M.highlight = setmetatable({}, {
	__newindex = function(_, hlgroup, args)
		if ('string' == type(args)) then
			vim.cmd(('hi! link %s %s'):format(hlgroup, args))
			return
		end

		local fg = args.fg or nil
		local bg = args.bg or nil
		local gui = args.gui or nil
		local sp = args.sp or nil
		local cmd = { 'hi', hlgroup }
		if fg then table.insert(cmd, 'guifg=' .. fg) end
		if bg then table.insert(cmd, 'guibg=' .. bg) end
		if gui then table.insert(cmd, 'gui=' .. gui) end
		if sp then table.insert(cmd, 'guisp=' .. sp) end
		vim.cmd(table.concat(cmd, ' '))
	end
})

function M.setup()
	local hi = M.highlight

	hi.Normal  = { bg = M.bg, fg = M.fg }
	hi.Cursor  = { bg = M.mint, fg = M.bg }
	hi.lCursor = "Cursor"
	hi.Comment = { fg = M.fg_subtle, gui = "italic" }

	hi.Constant       = { fg = M.mint, gui = "bold" }
	hi.Character      = "Constant"
	hi.Number         = "Constant"
	hi.Boolean        = "Constant"
	hi.Float          = "Constant"
	hi.String         = "Constant"
	hi.TSConstBuiltin = "Constant"

	hi.Identifier    = { fg = M.fg, gui = "bold" }
	hi.Function      = "Identifier"
	hi.TSFunction    = "Identifier"
	hi.TSFuncBuiltin = "Identifier"

	hi.Statement  = { fg = M.fg_subtle }
	hi.Conditonal = "Statement"
	hi.Repeat     = "Statement"
	hi.Label      = "Statement"
	hi.Keyword    = "Statement"
	hi.Exception  = "Statement"

	hi.Operator = { fg = M.fg, gui = "bold" }

	hi.PreProc   = { fg = M.fg_subtle, bg = M.bg }
	hi.Include   = "PreProc"
	hi.Define    = "PreProc"
	hi.Macro     = "PreProc"
	hi.PreCondit = "PreProc"

	hi.Type         = { fg = M.fg, bg = M.bg }
	hi.StorageClass = "Type"
	hi.Structure    = "Type"
	hi.Typedef      = "Type"

	hi.Special        = { fg = M.fg_subtle, gui = "italic" }
	hi.SpecialChar    = "Special"
	hi.Tag            = "Special"
	hi.Delimiter      = "Special"
	hi.SpecialComment = { fg = M.fg_subtle, gui = "italic,bold" }
	hi.Debug          = "Special"

	hi.Underlined   = { fg = M.fg, bg = M.bg, gui = "underline" }
	hi.Ignore       = { fg = M.bg, bg = M.bg, }
	hi.Error        = { fg = M.bg, bg = M.red }
	hi.Todo         = { fg = M.mint, bg = M.bg, gui = "bold,underline" }
	hi.SpecialKey   = { fg = M.mint }
	hi.NonText      = { fg = M.dark_grey }
	hi.Directory    = { fg = M.mint }
	hi.ErrorMsg     = { fg = M.bg, bg=M.red }
	hi.IncSearch    = { bg = M.purple, fg = M.bg, gui="NONE" }
	hi.Search       = { bg = M.mint, fg = M.bg }
	hi.MoreMsg      = { fg = M.dark_grey, bg = M.bg, gui = "bold" }
	hi.ModeMsg      = "MoreMsg"
	hi.LineNr       = { fg = M.fg_very_subtle, bg = M.bg }
	hi.CursorLineNr = { fg = M.mint, bg = M.bg_very_subtle, gui = "bold" }
	hi.Question     = { fg = M.purple }
	hi.StatusLine   = { bg = M.bg_very_subtle, fg = M.fg }
	hi.StatusLineNC = { bg = M.bg_very_subtle, fg = M.dark_grey }
	hi.VertSplit    = { bg = M.bg_very_subtle, fg = M.bg_very_subtle }
	hi.Title        = { fg = M.mint, gui = "bold" }
	hi.Visual       = { fg = M.fg, bg = M.bg_subtle }
	hi.VisualNOS    = "Visual"
	hi.WarningMsg   = { fg = M.fg, bg = M.orange, gui = "bold" }
	hi.WildMenu     = { fg = M.bg, bg = M.fg }
	hi.Folded       = { fg = M.dark_grey }
	hi.FoldColumn   = { fg = M.bg_subtle }
	hi.DiffAdd      = { fg = M.mint, bg = M.bg }
	hi.DiffDelete   = { fg = M.red, bg = M.bg }
	hi.DiffChange   = { fg = M.orange, bg = M.bg }
	hi.DiffText     = { fg = M.fg, bg = M.bg }
	hi.SignColumn   = { fg = M.mint, bg = M.bg }

	hi.SpellBad = { fg = M.fg, gui = "undercurl", sp = M.red }
	hi.SpellCap = { fg = M.fg, gui = "undercurl", sp = M.mint }
	hi.SpellRare = { fg = M.fg, gui = "undercurl", sp = M.purple }
	hi.SpellLocal = { fg = M.fg, gui = "undercurl", sp = M.mint }

	hi.Pmenu        = { fg = M.fg, bg = M.bg_subtle }
	hi.PmenuSel     = { fg = M.fg, bg = M.orange }
	hi.PmenuSbar    = { fg = M.fg, bg = M.bg_subtle }
	hi.PmenuThumb   = { fg = M.fg, bg = M.bg_subtle }
	hi.TabLine      = { fg = M.fg, bg = M.bg_very_subtle }
	hi.TabLineSel   = { fg = M.purple, bg = M.bg_subtle, gui = "bold" }
	hi.TabLineFill  = { fg = M.fg, bg = M.bg_very_subtle }
	hi.CursorColumn = { bg = M.bg_very_subtle }
	hi.CursorLine   = { bg = M.bg_very_subtle }
	hi.ColorColumn  = { bg = M.bg_subtle }

	hi.MatchParen = { bg = M.mint, fg = M.bg }

	-- git-gutter
	hi.GitGutterAdd = { fg = M.mint }
	hi.GitGutterDelete = { fg = M.orange }
	hi.GitGutterChange = { fg = M.grey }
	hi.GitGutterChangeDelete = { fg = M.purple }

	-- lsp
	hi.DiagnosticError = { fg = M.red }
	hi.DiagnosticWarn = { fg = M.orange }
	hi.DiagnosticInfo = { fg = M.mint }
end

function M.lualine()
return {
  normal = {
    a = {bg = M.bg_subtle, fg = M.fg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  },
  insert = {
    a = {bg = M.mint, fg = M.fg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  },
  visual = {
    a = {bg = M.purple, fg = M.fg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  },
  replace = {
    a = {bg = M.red, fg = M.fg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  },
  command = {
    a = {bg = M.fg, fg = M.bg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  },
  inactive = {
    a = {bg = M.bg_subtle, fg = M.fg, gui = 'bold'},
    b = {bg = M.bg_very_subtle, fg = M.fg},
    c = {bg = M.bg, fg = M.fg}
  }
}
end

return M
