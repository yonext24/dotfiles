local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Función para obtener el nombre del archivo sin extensión
local function filename_to_camelcase()
  local filename = vim.fn.expand '%:t:r' -- obtiene "categories-filter"
  local parts = vim.split(filename, '-', { plain = true })
  for idx, part in ipairs(parts) do
    parts[idx] = part:gsub('^%l', string.upper) -- capitaliza la primera letra de cada parte
  end
  return table.concat(parts, '')
end

ls.add_snippets({ 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }, {
  s('clg', {
    t { 'console.log(' },
    i(1, ''),
    t { ')' },
  }),
})

ls.add_snippets('typescriptreact', {
  s('component', { -- Se activa escribiendo "component"
    t 'export function ',
    f(filename_to_camelcase, {}), -- Inserta dinámicamente el nombre del archivo
    t '() {',
    t { '', '  return (' },
    t { '', '    ' },
    i(1, ''),
    t { '', '  )' },
    t { '', '}' },
  }),
})

ls.add_snippets('javascriptreact', {
  s('component', {
    t 'export function ',
    f(filename_to_camelcase, {}),
    t '() {',
    t { '', '  return (' },
    t { '', '    ' },
    i(1, ''),
    t { '' },
    t { '', '  )' },
    t { '', '}' },
  }),
})

ls.add_snippets('typescriptreact', {
  ls.parser.parse_snippet('state', 'const [${1:value}, set${1/^(.)/(\\u$1)/}] = useState<${2:type}>(${3:init});'),
})
