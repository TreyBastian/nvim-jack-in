local M = {}

M.config = {
  -- clj dependencies
  clj_dependencies = {
    { name = "nrepl/nrepl",       version = "RELEASE" },
    { name = "cider/cider-nrepl", version = "RELEASE" },
  },
  -- clj middleware
  clj_middleware = {
    "cider.nrepl/cider-middleware"
  },
  -- leiningen plugins
  lein_plugins = {
    { name = "cider/cider-nrepl", version = "RELEASE" },
  },
  -- buffer, background, vsplit, split, tab
  location = 'buffer',
  force_powershell = false,
}

local function is_powershell()
  return vim.o.shell == 'powershell.exe' or vim.o.shell == 'pwsh' or vim.o.shell == 'powershell' or
      vim.o.shell == 'pwsh.exe' or M.config.force_powershell == true
end


-- windows needs to add quotes for powershell because well powershell...
local function version_escape(version)
  if is_powershell() == true then
    return '""""""' .. version .. '""""""'
  end
  return '"' .. version .. '"'
end

local function map_clj_deps_to_string()
  local string = ''
  for _, v in pairs(M.config.clj_dependencies) do
    string = string .. v.name .. ' {:mvn/version ' .. version_escape(v.version) .. '} '
  end
  return string
end

local function map_clj_middleware_to_string()
  local string = ''
  for _, v in pairs(M.config.clj_middleware) do
    string = string .. '"' .. v .. '" '
  end
  return string
end

local function clj_string()
  return "clj -Sdeps " ..
      "'{:deps {" ..
      map_clj_deps_to_string() ..
      "}}' " .. "-M -m nrepl.cmdline --middleware '[" .. map_clj_middleware_to_string() .. "]' --interactive"
end

local function map_lein_plugins_to_string()
  local string = ''
  for _, v in pairs(M.config.lein_plugins) do
    string = string .. v.name .. ' ' .. version_escape(v.version) .. ' '
  end
  return string
end

local function lein_string()
  return "lein update-in :plugins conj '[" .. map_lein_plugins_to_string() .. "]' -- repl"
end

local function jack_in(execution_string, args)
  if M.config.location == "vsplit" then
    vim.cmd('vsplit')
  elseif M.config.location == "split" then
    vim.cmd('split')
  elseif M.config.location == "tab" then
    vim.cmd('tabnew')
  end

  if M.config.force_powershell == true then
    vim.cmd(':term powershell ' .. execution_string .. " " .. args)
  else
    vim.cmd(':term ' .. execution_string .. " " .. args)
  end
  if M.config.location == 'background' then
    -- swap to the previous buffer if available
    vim.cmd('bp')
  end
end

function M.setup(user_opts)
  M.config = vim.tbl_extend("force", M.config, user_opts or {})


  vim.api.nvim_create_user_command(
    'Clj', function(args)
      jack_in(clj_string(), args)
    end,
    { nargs = "*" }
  )

  vim.api.nvim_create_user_command(
    'Lein', function(args)
      jack_in(lein_string(), args)
    end,
    { nargs = "*" }
  )
end

return M
