-- mod-version:3

-- Embedded JavaScript templating
-- provides .ejs syntax support (fork of language_html.lua).

local syntax = require "core.syntax"

syntax.add {
  name = "EJS",
  files = { "%.ejs$" },
  block_comment = { "<!--", "-->" },
  patterns = {
    {
      pattern = {
        "<%%",
        "%%>"
      },
      syntax = '.js',
      type = "function"
    },
    {
      pattern = {
        "<%s*[sS][cC][rR][iI][pP][tT]%f[%s>].->",
        "<%s*/%s*[sS][cC][rR][iI][pP][tT]%s*>"
      },
      syntax = ".js",
      type = "function"
    },
    {
      pattern = {
        "<%s*[sS][tT][yY][lL][eE]%f[%s>].->",
        "<%s*/%s*[sS][tT][yY][lL][eE]%s*>"
      },
      syntax = ".css",
      type = "function"
    },
    { pattern = { "<!%-%-", "%-%->" },     type = "comment"  },
    { pattern = { '%f[^>][^<]', '%f[<]' }, type = "normal"   },
    { pattern = { '"', '"', '\\' },        type = "string"   },
    { pattern = { "'", "'", '\\' },        type = "string"   },
    { pattern = "0x[%da-fA-F]+",           type = "number"   },
    { pattern = "-?%d+[%d%.]*f?",          type = "number"   },
    { pattern = "-?%.?%d+f?",              type = "number"   },
    { pattern = "%f[^<]![%a_][%w_]*",      type = "keyword2" },
    { pattern = "%f[^<][%a_][%w_]*",       type = "function" },
    { pattern = "%f[^<]/[%a_][%w_]*",      type = "function" },
    { pattern = "[%a_][%w_]*",             type = "keyword"  },
    { pattern = "[/<>=]",                  type = "operator" },
  },
  symbols = {},
}