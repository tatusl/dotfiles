local ts = require "nvim-treesitter"

-- markdown + markdown_inline are installed so nvim-treesitter provides a parser
-- that matches its own queries (this is what fixes the .md highlighter error)
ts.install {
  "lua",
  "vim",
  "vimdoc",
  "html",
  "css",
  "typescript",
  "javascript",
  "markdown",
  "markdown_inline",
}

-- the main branch has no `highlight`/`indent` modules; highlighting is enabled
-- per-buffer via vim.treesitter.start() and indentation via the experimental
-- indentexpr.
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if not lang then
      return
    end
    -- language.add returns (true) only when a parser actually exists; it returns
    -- (nil, err) otherwise (e.g. the "blink-cmp-menu" completion buffer), so we
    -- must check its return value rather than pcall's status.
    local ok, has_parser = pcall(vim.treesitter.language.add, lang)
    if ok and has_parser then
      vim.treesitter.start(args.buf, lang)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
