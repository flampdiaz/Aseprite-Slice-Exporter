local exporter = require "exporter"
local utils = require "utils"

local dialogManager = {}

function dialogManager.showExportDialog()
  local activeSprite = app.activeSprite
  if not activeSprite then return utils.showError("No active sprite open.") end

  local exportDialog = Dialog("Export Slices as PNGs")

  exportDialog:file{
    id="outputDirectory",
    label="Output folder",
    filename=app.fs.userDocsPath or "",
    open=false,
    save=false
  }

  exportDialog:entry{
    id="filenamePattern",
    label="Filename pattern",
    text="{slice}.png"
  }

  exportDialog:check{
    id="onlyCurrentFrame",
    label="Only current frame",
    selected=true
  }

  exportDialog:button{
    id="export",
    text="Export",
    onclick=function()
      local dialogData = exportDialog.data
      local outputDirectoryPath = app.fs.filePath(dialogData.outputDirectory)
      
      local exportedCount = exporter.exportSlicesToPngs(
        activeSprite,
        outputDirectoryPath,
        dialogData.filenamePattern,
        dialogData.onlyCurrentFrame
      )
      
      if exportedCount > 0 then
          app.alert("Exported " .. exportedCount .. " slice PNG(s).")
          exportDialog:close()
      end
    end
  }

  exportDialog:button{ id="cancel", text="Cancel" }
  exportDialog:show{ wait=false }
end

return dialogManager
