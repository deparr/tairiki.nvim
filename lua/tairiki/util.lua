local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

local path = debug.getinfo(1, "S").source:sub(2)
path = vim.fn.fnamemodify(path, ":h:h")

---@param modpath string
function M.load_mod(modpath)
	if package.loaded[modpath] then
		return package.loaded[modpath]
	end

	modpath = ("%s/%s.lua"):format(path, modpath:gsub("%.", "/"))
	local mod = loadfile(modpath)()
	package.loaded[modpath] = mod
	return mod
end

---@param c string|table<number> hex string to convert
---@return table<number> { r, g, b } of c
function M.rgb(c)
	if type(c) == "string" then
		c = string.lower(c)
		return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
	end

	local h2rgb = function(p, q, t)
		if t < 0 then t = t + 1 end
		if t > 1 then t = t - 1 end
		if t < 1 / 6 then return p + (q - p) * 6 * t end
		if t < 1 / 2 then return q end
		if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
		return p
	end

	local r, g, b
	if c[2] == 0 then
		r = c[3]; g = c[3]; b = c[3]
	else
		local q = c[3] < 0.5 and c[3] * (1 + c[2]) or c[3] + c[2] - c[3] * c[2]
		local p = 2 * c[3] - q
		r = h2rgb(p, q, c[1] + 1 / 3)
		g = h2rgb(p, q, c[1])
		b = h2rgb(p, q, c[1] - 1 / 3)
	end

	return { r * 255, g * 255, b * 255 }
end

---@param c string|table<number> color to convert. an rgb array or hex string
---@return table<number> { h, s, l } of c
function M.hsl(c)
	local rgb = type(c) == "string" and M.rgb(c) or c
	rgb[1] = rgb[1] / 255
	rgb[2] = rgb[2] / 255
	rgb[3] = rgb[3] / 255

	local max = math.max(rgb[1], rgb[2], rgb[3])
	local min = math.min(rgb[1], rgb[2], rgb[3])

	local h = 0
	local s = 0
	local l = (max + min) / 2;
	if max ~= min then
		local delta = max - min
		s = l > 0.5 and delta / (2 - max - min) or delta / (max + min)
		if max == rgb[1] then
			h = (rgb[2] - rgb[3]) / delta + (rgb[2] > rgb[3] and 6 or 0)
		elseif max == rgb[2] then
			h = (rgb[3] - rgb[1]) / delta + 2
		else
			h = (rgb[1] - rgb[2]) / delta + 4
		end

		h = h / 6
	end

	return { h, s, l }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
	local bg = M.rgb(background)
	local fg = M.rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

---@param color string color to be darkened
---@param amount number number between 0 and 1. 0 results in `bg`, 1 results in `color`
---@param bg? string color to darken towards, defaults to #000000
function M.blend_bg(color, amount, bg)
	return M.blend(color, bg or M.bg, math.abs(amount))
end

M.darken = M.blend_bg

---@param color string color to be lightened
---@param amount number number between 0 and 1. 0 results in `fg`, 1 results in `color`
---@param fg? string color to lighten towards, defaults to #000000
function M.blend_fg(color, amount, fg)
	return M.blend(color, fg or M.fg, math.abs(amount))
end

M.lighten = M.blend_fg

---@param color string|table<number> rgb color to be saturated
---@param amount? number amount to saturate, between 0 and 1. defaults to 0.1
---@return string hex color code
function M.saturate(color, amount)
	if not amount then
		amount = 0.1
	end
	local hsl = M.hsl(color)

	hsl[2] = hsl[2] + amount

	if hsl[2] > 1 then
		hsl[2] = 1.0
	elseif hsl[2] < 0 then
		hsl[2] = 0.0
	end

	local rgb = M.rgb(hsl)
	return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

return M
