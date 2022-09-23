local M = {}

function M.current_line()
  return vim.api.nvim_get_current_line()
end

function M.filetype()
  return vim.bo.filetype
end

return M
