local config = require("tairiki.config")

local M = {}

M.setup = config.setup

function M.load(opts)
	opts = config.extend(opts)

	require("tairiki.theme").load(opts)
end

return M
