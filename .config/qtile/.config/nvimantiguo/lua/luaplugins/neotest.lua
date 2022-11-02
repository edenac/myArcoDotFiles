require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})
require("lua-dev").setup({
  library = { plugins = { "neotest" }, types = true },
})
local lib = require("neotest.lib")

function PlenaryNeotestAdapter.discover_positions(path)
  local query = [[
  ;; describe blocks
  ((function_call
      name: (identifier) @func_name (#match? @func_name "^describe$")
      arguments: (arguments (_) @namespace.name (function_definition))
  )) @namespace.definition


  ;; it blocks
  ((function_call
      name: (identifier) @func_name
      arguments: (arguments (_) @test.name (function_definition))
  ) (#match? @func_name "^it$")) @test.definition

  ;; async it blocks (async.it)
  ((function_call
      name: (
        dot_index_expression
          field: (identifier) @func_name
      )
      arguments: (arguments (_) @test.name (function_definition))
    ) (#match? @func_name "^it$")) @test.definition
    ]]
  return lib.treesitter.parse_positions(path, query, { nested_namespaces = true })
end
