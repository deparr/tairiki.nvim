for k in pairs(package.loaded) do
  if k:match(".*tairiki*") then
    package.loaded[k] = nil
  end
end

require("tairiki").setup()
require("tairiki").colorscheme()
