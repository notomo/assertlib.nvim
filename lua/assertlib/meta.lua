--- @meta

--- @class AssertlibAssert
local M = {}

-- TODO: param type

function M.is_true(got, msg) end
function M.is_false(got, msg) end
function M.is_boolean(got, msg) end
function M.is_number(got, msg) end
function M.is_string(got, msg) end
function M.is_table(got, msg) end
function M.is_nil(got, msg) end
function M.is_userdata(got, msg) end
function M.is_function(got, msg) end
function M.is_thread(got, msg) end
function M.returned_arguments(count, got) end
function M.same(want, got, msg) end
function M.match(pattern, got, msg) end
function M.near(want, got, tolerance, msg) end
function M.equal(want, got, msg) end
function M.unique(want, got, msg) end
function M.error(fn, want, msg) end
function M.error_matche(fn, pattern, msg) end
function M.truthy(got, msg) end
function M.falsy(got, msg) end

function M.buffer_name_tail(want) end
function M.buffer_full_name(want) end
function M.buffer_number(want) end
function M.current_line(want) end
function M.cursor_row(want) end
function M.cursor_column(want) end
function M.cursor_word(want) end
function M.cursor_position(want) end
function M.exists_message(want) end
function M.exists_pattern(want, bufnr) end
function M.filetype(want) end
function M.list_length(got, length) end
function M.mode(want) end
function M.tab_count(want) end
function M.tab_number(want) end
function M.window_count(want) end
function M.window_id(want) end

M.no = M

return M
