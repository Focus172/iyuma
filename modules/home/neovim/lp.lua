M.run = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].filetype ~= "markdown" then
    vim.notify("Only Markdown is supported")
    return
  end
  local root = get_root(bufnr)
  for id, node in markdown_query:iter_captures(root, bufnr, 0, -1) do
    local name = markdown_query.captures[id]
    if name == "content" then
      local range = { node:range() }
      local code_block = vim.treesitter.get_node_text(node, bufnr)
      local result = run_code_block(code_block)
      table.insert(result, 1, "```text")
      table.insert(result, 1, "")
      table.insert(result, #result + 1, "```")
      vim.api.nvim_buf_set_lines(bufnr, range[3] + 1, range[3] + 1, false, result)
    end
  end
end

