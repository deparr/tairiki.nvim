--@type Palette
local M = {
	bg = "#1d1f21",
	fg = "#afb2b0",
	purple = "#b19db8",
	green = "#b3ba7e",
	orange = "#d99667",
	blue = "#93a8b8",
	yellow = "#d9bf89",
	cyan = "#9bb0ac",
	red = "#c37d7c",
	comment = "#696969",
}

M.bg_light = "#242627"
M.bg_light2 = "#323435"
M.bg_light3 = "#323435"
M.fg_dark = "#959896"
M.fg_dark2 = "#858886"
M.fg_dark3 = "#858886"
-- todo get actual colors
M.diag = {
	error = M.red,
	info = M.cyan,
	warn = M.orange,
	hint = M.fg_dark3,
	ok = M.green,
}
M.diff = {
	add = "#4a4e3d",
	remove = "#2e282a",
	change = "#40484e",
	text = "#40484e",
}
M.syn = {
	ident = M.fg,
	constant = M.red,
	literal = M.orange,
	func = M.blue,
	string = M.green,
	type = M.yellow,
	keyword = M.purple,
	keyword_mod = M.red,
	special = M.red,
	delim = M.fg_dark3,
	exception = M.red,
	operator = M.fg_dark2,
}

return M
