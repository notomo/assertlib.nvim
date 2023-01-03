local helper = require("vusted.helper")
local plugin_name = helper.get_module_root(...)

function helper.before_each() end

function helper.after_each()
  helper.cleanup()
  helper.cleanup_loaded_modules(plugin_name)
end

return helper
