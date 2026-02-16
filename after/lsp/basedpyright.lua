return {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard", -- off, basic, standard, strict
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      }
    }
  }
}
