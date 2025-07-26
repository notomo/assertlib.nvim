local M = {}

function M.window_count()
  return #vim.api.nvim_tabpage_list_wins(0)
end

function M.window_id()
  return vim.api.nvim_get_current_win()
end

return M
