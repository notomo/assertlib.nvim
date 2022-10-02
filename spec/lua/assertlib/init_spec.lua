local helper = require("assertlib.test.helper")
local assertlib = helper.require("assertlib")

describe("assertlib.list()", function()
  before_each(helper.before_each)
  after_each(helper.after_each)

  local get_asserter = function(asserters, name)
    local filtered = vim.tbl_filter(function(asserter)
      return asserter.name == name
    end, asserters)
    return filtered[1]
  end

  describe("returns asseter", function()
    it("that has name", function()
      local got = assertlib.list()
      local asserter = get_asserter(got, "list_length")
      assert.equals("list_length", asserter.name)
    end)

    it("that can make result", function()
      local got = assertlib.list()
      local asserter = get_asserter(got, "list_length")

      local result = asserter.get_result({ { 1, 2 }, 3 })
      assert.is_same(2, result.actual)
      assert.equals(3, result.expected)

      local ok = asserter.is_ok(result)
      assert.is_false(ok)
    end)

    it("that can make messages", function()
      local got = assertlib.list()
      local asserter = get_asserter(got, "list_length")

      local result = asserter.get_result({ { 1, 2 }, 3 })

      local positive_message = asserter.positive_message(result)
      assert.equals("string", type(positive_message))

      local negative_message = asserter.negative_message(result)
      assert.equals("string", type(negative_message))
    end)

    it("that does not include duplicated names", function()
      local asserters = assertlib.list()
      local names = vim.tbl_map(function(asserter)
        return asserter.name
      end, asserters)
      table.sort(names, function(a, b)
        return a > b
      end)

      local duplicated = vim.tbl_filter(function(name)
        local count = #vim.tbl_filter(function(e)
          return e == name
        end, names)
        return count > 1
      end, names)
      duplicated = vim.fn.uniq(duplicated)

      assert.equals(0, #duplicated, "duplicated names: " .. vim.inspect(duplicated))
    end)
  end)
end)
