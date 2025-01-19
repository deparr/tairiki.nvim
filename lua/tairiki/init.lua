local M = {}

local global_conf = {}

function M.setup(opts)
	global_conf = opts
end


function M.load()
	local palettes = require "tairiki.palette"
	local group = require "tairiki.groups"

	group.load(palettes.dimmed, global_conf)
end

return M
