return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = { enabled = true },
      setup = {
        ruby_lsp = function()
          vim.lsp.commands["rubyLsp.openFile"] = function(cmd)
            local uri_frag = cmd.arguments[1][1]
            local uri, line = uri_frag:match("^(.+)#L(%d+)$")
            uri = uri or uri_frag
            local bufnr = vim.uri_to_bufnr(uri)
            vim.fn.bufload(bufnr)
            vim.api.nvim_set_current_buf(bufnr)
            vim.api.nvim_win_set_cursor(0, { tonumber(line) or 1, 0 })
          end
        end,
      },
    },
  },
}
