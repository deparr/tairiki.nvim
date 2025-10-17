local M = {}

---@param c tairiki.Palette
---@param opts tairiki.Config
---@return tairiki.Highlights
function M.get(c, opts)
  return {
    -- go - runtime/syntax/go.vim
    -- also uses these for more hls:
    --  vim.g.go_highlight_functions = 1
    --  vim.g.go_highlight_operators = 1
    goPackage = "Keyword",
    goImport = "Keyword",
    goStatement = "Keyword",
    goBuiltins = { fg = c.syn.special },
    goSpecialString = "SpecialChar", -- todo maybe cyan
    goVarArgs = { fg = c.syn.special },
    goPackageComment = { fg = c.doc_comment or c.comment, style = opts.code_style.comments },
    goFunctionCall = "Function",

    -- zig - runtime/syntax/zig.vim
    zigBuiltinFn = "Special",
    zigCommentLineDoc = { fg = c.doc_comment or c.comment, style = opts.code_style.comments },
    zigOperator = "Function",
    zigMacro = "Keyword",
    zigExecution = "Keyword",
    zigVarDecl = "Keyword",

    -- python - runtime/syntax/python.vim
    pythonStatement = "Keyword",
    pythonBuiltin = "Special",
    pythonDecoratorName = { fg = c.syn.special },
    pythonException = "Keyword",
    pythonAsync = "Keyword",
    pythonExceptions = "Type",
    pythonOperator = "Keyword",
    pythonEscape = "Number",

    -- javascript - runtime/syntax/javascript.vim
    javascriptBraces = "Normal",
    javascriptStatement = "Keyword",
    javascriptOperator = "Keyword",
    javascriptSpecial = "Number",
    javascriptNull = "Boolean",
    javascriptMessage = "Special",
    javascriptMember = "Special",
    javascriptGlobal = "Special",

    -- json - runtime/syntax/{json,jsonc,json5}.vim
    jsonKeyword = "Keyword",
    jsonBoolean = "Boolean",
    jsonEscape = "Number",
    jsonQuote = "Delimiter",
  }
end

return M
