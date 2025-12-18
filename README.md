# Aseprite Slice Exporter

An Aseprite extension that exports each slice as an individual PNG file using the slice name.

This tool is designed for artists and developers who work with slices (UI elements, tiles, icons, shapes) and want a simple, open, script-based way to export them without using the Aseprite CLI.

---

## Features

- Exports one PNG per slice
- Uses the slice name as the filename
- Preserves slice bounds exactly
- No empty or duplicated images
- Does not rely on the Aseprite CLI
- Integrated directly into the Aseprite File menu

---

## Installation

1. Go to the **Releases** page:  
   👉 [https://github.com/flampdiaz/aseprite-slice-exporter/releases](https://github.com/flampdiaz/aseprite-slice-exporter/releases)
2. Download the latest file:  
   **aseprite-slice-exporter-vX.Y.Z.zip**
3. Open Aseprite and go to:  
   **Edit → Preferences → Extensions**
4. Click **Add Extension** and select the downloaded ZIP file
5. Restart Aseprite if prompted

### Updating

To update the extension, download the newest release ZIP and repeat the same installation steps above.  
Updates are installed manually.

---

## Usage

1. Open a sprite that contains slices
2. Go to `File → Export Slices as PNGs…`
3. Select any file inside the folder where you want the PNGs exported
4. Click **Export**

Each slice will be exported as an individual PNG.

---

## How It Works

The extension renders the active sprite frame into memory, crops each slice using its bounds, and saves each slice as a PNG using the slice name.

Because some Aseprite builds do not provide a native folder picker for scripts, the export dialog asks you to select **any file inside the target folder**. The extension automatically exports the PNG files into that folder.

---

## License

This project is licensed under the **GNU General Public License v3.0 (GPLv3)**.

You are free to use, study, and modify this extension.

- Any modified or redistributed version **must remain open source** and licensed under GPLv3.
- Proper **credit to the original author must be preserved**.
- Improvements and changes must be shared publicly under the same license.

Using this extension as a tool does **not** require your own projects (games, assets, pipelines) to be open source.