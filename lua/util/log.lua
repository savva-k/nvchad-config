-- Function to log messages to a file
local function log_to_file(message)
  local logfile = io.open(vim.fn.expand "~/nvim-custom.log", "a")
  if logfile then
    logfile:write(message .. "\n")
    logfile:close()
  end
end

return {
  log_to_file = log_to_file,
}
