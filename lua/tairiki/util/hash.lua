local bitop = bit

local M = {}

-- https://theartincode.stanis.me/008-djb2/
local function djb2(s)
  local h = 5381
  for i = 1, #s do
    h = bitop.lshift(h, 5) + h + string.byte(s, i) -- h * 33 + c
  end
  return h
end

-- Reference: https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/lib/hashing.lua
function M.hash(v, opts)
	local t = type(v)
	if t == "table" then
		local h = 0
		for p, u in next, v do
			  h = bitop.bxor(h, djb2(p .. M.hash(u, opts)))
		end
		return h
	elseif t == "function" then
    vim.notify("tairiki: can't hash arbitrary functions deterministically", vim.log.levels.WARN)
	end
	return tostring(v)
end

---@param opts tairiki.Config
function M.hash_conf(opts)
  opts = vim.tbl_deep_extend("force", {}, opts)
  if opts.colors then
    opts.colors = opts.colors(require("tairiki.palette").palettes[opts.palette], opts)
  end
  if opts.colors then
    opts.colors.regen_sub_groups = nil
  end

  if opts.highlights then
    opts.highlights = opts.highlights(require("tairiki.palette").palettes[opts.palette], opts)
  end

  return M.hash(opts, opts)
end

return M

