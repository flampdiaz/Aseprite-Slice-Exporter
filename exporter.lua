local utils = require "utils"
local exporter = {}

function exporter.exportSlicesToPngs(sprite, outputDirectory, filenamePattern, onlyCurrentFrame)
  if not sprite then
    utils.showError("No active sprite open.")
    return 0
  end
  if not sprite.slices or #sprite.slices == 0 then
    utils.showError("This sprite has no slices.")
    return 0
  end
  if not outputDirectory or outputDirectory == "" then
    utils.showError("Choose an output folder.")
    return 0
  end
  if not filenamePattern or filenamePattern == "" then
    filenamePattern = "{slice}.png"
  end

  local frameNumber = app.activeFrame and app.activeFrame.frameNumber or 1

  -- Render the sprite (current frame) into an in-memory image
  -- This avoids SaveFileCopyAs(slice=...) issues (empty/duplicate output).
  local renderedSpriteImage = Image(sprite.width, sprite.height)
  renderedSpriteImage:drawSprite(sprite, frameNumber)

  local exportedCount = 0

  for _, currentSlice in ipairs(sprite.slices) do
    local sliceName = currentSlice.name
    if sliceName and sliceName ~= "" then
      local sliceBounds = currentSlice.bounds
      if sliceBounds.width > 0 and sliceBounds.height > 0 then
        local exportFileName = filenamePattern:gsub("{slice}", utils.sanitizeFilename(sliceName))
        local fullExportPath = app.fs.joinPath(outputDirectory, exportFileName)

        local sliceImage = Image(sliceBounds.width, sliceBounds.height)
        -- Copy pixels from full render: shift so slice top-left becomes (0,0)
        sliceImage:drawImage(renderedSpriteImage, Point(-sliceBounds.x, -sliceBounds.y))

        sliceImage:saveAs(fullExportPath)
        exportedCount = exportedCount + 1
      end
    end
  end

  return exportedCount
end

return exporter
