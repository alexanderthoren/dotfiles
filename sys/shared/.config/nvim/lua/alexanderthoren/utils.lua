local M = {}

M.Venv_python_path = function()
  local where = M.Venv_bin_detection("python")
  if where == "python" then
    return "/usr/bin/python"
  end
  return where
end

M.Venv_bin_detection = function(tool)
  local cwd = vim.loop.cwd()
  if vim.fn.executable(cwd .. "/.venv/bin/" .. tool) == 1 then
    return cwd .. "/.venv/bin/" .. tool
  end
  return tool
end

M.file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

return M
