-- Cinder Muted: cinder-grove.nvim's highlight builder driven by the
-- cinder-muted palette. Requires cinder-grove.nvim to be installed.
local M = {}

function M.load()
  -- Merge into the active grove config so user options like transparent stay set.
  local config = require('cinder-grove.config').get()
  config.colors = vim.tbl_deep_extend('force', config.colors, require('cinder-muted.palette'))
  require('cinder-grove').setup(config)
  require('cinder-grove').load()
  vim.g.colors_name = 'cinder-muted'
end

return M
