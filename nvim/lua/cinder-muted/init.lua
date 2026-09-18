-- Cinder Muted: cinder-grove.nvim's highlight builder driven by the
-- cinder-muted palette. Requires cinder-grove.nvim to be installed.
local M = {}

function M.load()
  require('cinder-grove').setup({ colors = require('cinder-muted.palette') })
  require('cinder-grove').load()
end

return M
