local util = require "lspconfig.util"
--TODO: rm? local comment = require 'comment'

local texlab_build_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Cancelled = 3,
}

local texlab_forward_status = vim.tbl_add_reverse_lookup {
  Success = 0,
  Error = 1,
  Failure = 2,
  Unconfigured = 3,
}

local function buf_build(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, "texlab")
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
  }
  if texlab_client then
    texlab_client.request("textDocument/build", params, function(err, result)
      if err then error(tostring(err)) end
      print("Build " .. texlab_build_status[result.status])
    end, bufnr)
  else
    print "method textDocument/build is not supported by any servers active on the current buffer"
  end
end

local function buf_search(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local texlab_client = util.get_active_client_by_name(bufnr, "texlab")
  local params = {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = { line = vim.fn.line "." - 1, character = vim.fn.col "." },
  }
  if texlab_client then
    texlab_client.request("textDocument/forwardSearch", params, function(err, result)
      if err then error(tostring(err)) end
      print("Search " .. texlab_forward_status[result.status])
    end, bufnr)
  else
    print "method textDocument/forwardSearch is not supported by any servers active on the current buffer"
  end
end

return {
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  root_dir = function(fname) return util.root_pattern ".latexmkrc"(fname) or util.find_git_ancestor(fname) end,
  single_file_support = true,
  -- LSP Settings =================================================================================
  settings = {
    texlab = {
      rootDirectory = nil,
      -- Build -----------------------------------------------------------------
      --build = {
      --  executable = "tectonic",
      --  args = {
      --    "-X",
      --    "compile",
      --    "%f",
      --    "--synctex",
      --    "--keep-logs",
      --    "--keep-intermediates",
      --    "--outdir=build",
      --  },
      --  onSave = true,
      --  forwardSearchAfter = true,
      --},

      build = {
        executable = "latexmk",
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f",
          '-output-directory="build"',
          "-outdir=build",
          "-auxdir=build",
        },
        onSave = true,
        forwardSearchAfter = true,
      },
      auxDirectory = "build",
      -- Forward Search --------------------------------------------------------
      forwardSearchAfter = true,
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = false,
      },
      diagnosticsDelay = 300,
      latexFormatter = "latexindent",
      latexindent = {
        ["local"] = nil, -- local is a reserved keyword
        modifyLineBreaks = false,
      },
      bibtexFormatter = "texlab",
      formatterLineLength = 80,
    },
  },
  -- Commands =====================================================================================
  commands = {
    TexlabClean = {
      function()
        -- TODO: Clean aux files
        buf_build(0)
      end,
      description = "Build the current buffer",
    },
    TexlabBuild = {
      function()
        -- TODO: Create build dir ?
        buf_build(0)
      end,
      description = "Build the current buffer",
    },
    TexlabForward = {
      function() buf_search(0) end,
      description = "Forward search from current position",
    },
  },
  -- Doc ==========================================================================================
  docs = {
    description = [[
https://github.com/latex-lsp/texlab

A completion engine built from scratch for (La)TeX.

See https://github.com/latex-lsp/texlab/blob/master/docs/options.md for configuration options.
]],
  },
}
