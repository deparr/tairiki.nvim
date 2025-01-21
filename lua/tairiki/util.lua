local M = {}

M.bg = "#000000"
M.fg = "#ffffff"

---@param c string
local function rgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
	local bg = rgb(background)
	local fg = rgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

---@param hex string color to be darkened
---@param amount number number between 0 and 1. 0 results in `bg`, 1 results in `hex`
---@param bg? string color to darken towards, defaults to #000000
function M.blend_bg(hex, amount, bg)
	return M.blend(hex, bg or M.bg, math.abs(amount))
end
M.darken = M.blend_bg

---@param hex string color to be lightened
---@param amount number number between 0 and 1. 0 results in `fg`, 1 results in `hex`
---@param fg? string color to lighten towards, defaults to #000000
function M.blend_fg(hex, amount, fg)
	return M.blend(hex, fg or M.fg, math.abs(amount))
end
M.lighten = M.blend_fg

return M

