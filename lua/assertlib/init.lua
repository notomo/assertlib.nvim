local M = {}

function M.list()
  local module_paths = vim.api.nvim_get_runtime_file("lua/assertlib/function/*.lua", true)
  local module_names = vim
    .iter(module_paths)
    :map(function(path)
      path = path:gsub("\\", "/")
      local splitted = vim.split(path, "/", { plain = true })
      local file_name = splitted[#splitted]
      local name = file_name:sub(1, #file_name - 4)
      return name
    end)
    :totable()

  local from = require("assertlib.asserter").from

  local all = {}
  for _, module_name in ipairs(module_names) do
    local module = require("assertlib.function." .. module_name)
    local asserters = from(module)
    vim.list_extend(all, asserters)
  end

  table.sort(all, function(a, b)
    return a.name > b.name
  end)

  return all
end

function M.register(register_fn)
  local asserters = M.list()
  for _, asserter in ipairs(asserters) do
    register_fn(asserter.name, function(self)
      return function(_, args)
        local result = asserter.get_result(args)
        self:set_positive(asserter.positive_message(result))
        self:set_negative(asserter.negative_message(result))
        return asserter.is_ok(result)
      end
    end)
  end
end

function M.typed(assert)
  ---@cast assert +AssertlibAssert
  ---@cast assert -string
  return assert
end

return M
