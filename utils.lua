local utils = {}

function utils.showError(errorMessage)
  app.alert{ title="Export Slices", text=errorMessage }
end

function utils.sanitizeFilename(filename)
  return (filename:gsub("[/\\:%*%?\"%<%>%|]", "_"))
end

return utils
