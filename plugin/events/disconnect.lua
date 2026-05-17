vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("OpencodeDisconnect", { clear = true }),
  pattern = "OpencodeEvent:server.instance.disposed",
  callback = function()
    local server = require("opencode.events").connected_server
    if server then
      server:disconnect()
    end
  end,
  desc = "Shut down SSE subscription when server disposes",
})
