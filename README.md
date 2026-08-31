EN | [RU](docs/README_RU.md)

# typebox

![AutoHotkey](https://img.shields.io/badge/AutoHotkey-334455?style=flat-square&logo=autohotkey&logoColor=white)


Small **AutoHotkey v2** utility for Windows. Opens a panel with an input field where you can paste or type text in advance, then automatically "types" it into the active window - like a macro, but more convenient for long fragments.

Runs locally, does not send data anywhere.

## Author

[xvDosha](https://github.com/xvdosha-alt)

---

## Features

- Input panel in the top-left corner of the screen
- Auto-focus in the field - you can paste (`Ctrl+V`) or type immediately
- Auto-type text into the previously active window
- **Esc** is intercepted only while the panel is open

---

## Hotkeys

| Key | Action |
|---|---|
| **F8** | Open / close panel |
| **F9** | Close panel and start auto-typing |
| **Esc** | Close panel without auto-typing |

---

## Requirements

- **Windows 10** or **Windows 11**
- [AutoHotkey v2](https://www.autohotkey.com/) - download **v2**, not v1

---

## Installation

### 1. Install AutoHotkey v2

1. Open [autohotkey.com](https://www.autohotkey.com/)
2. Click **Download AutoHotkey v2**
3. Install with default settings

### 2. Download or clone the repository

```bash
git clone https://github.com/xvdosha-alt/typebox-ahk.git
cd typebox-ahk
```

Or download a ZIP from [GitHub Releases](https://github.com/xvdosha-alt/typebox-ahk/releases).

Copy files to a Windows machine, for example:

```
C:\Tools\typebox-ahk\typebox.ahk
```

### 3. Launch

**Method 1 - double click**

Double-click `typebox.ahk`. A green **H** icon appears in the tray - the script is running.

**Method 2 - from PowerShell / CMD**

```powershell
& "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Tools\typebox\typebox.ahk"
```

**Method 3 - single exe (no AHK on other PCs)**

```powershell
& "C:\Program Files\AutoHotkey\v2\Compiler\Ahk2Exe.exe" /in typebox.ahk /out typebox.exe
```

After building, run `typebox.exe` - AutoHotkey is not needed on the target PC.

---

## Autostart with Windows

1. Press `Win + R`, enter `shell:startup`, Enter
2. Copy a shortcut to `typebox.ahk` or `typebox.exe` there

The script will start on every login.

---

## Usage

1. Open the window where you need to enter text (Notepad, browser, Discord, etc.)
2. Press **F8** - a panel appears top-left, cursor already in the input field
3. Paste or type the text you need
4. Press **F9** - the panel closes and text starts typing into the window that was active in step 1

### Close without typing

- **F8** - if the panel is already open
- **Esc** - while the panel is open

---

## Panel

| Property | Value |
|---|---|
| Position | Top-left corner (12px from edge) |
| Title bar | None |
| Close button | None |
| Always on top | Yes |

---

## Build exe

```powershell
cd C:\Tools\typebox
& "C:\Program Files\AutoHotkey\v2\Compiler\Ahk2Exe.exe" /in typebox.ahk /out typebox.exe
```

The resulting `typebox.exe` can be moved to other Windows PCs without installing AutoHotkey.

---

## FAQ

### Text types into the wrong window

Before **F8**, click the target window first. The script remembers the active window when opening the panel and returns focus there before auto-typing.

### Esc does not work in other programs

**Esc** is intercepted only while the panel is open. After closing the panel, **Esc** works normally again.

### F8/F9 do not work

- Make sure the script is running ( **H** icon in the tray)
- Verify **AutoHotkey v2** is installed, not v1
- Other programs may capture F8/F9 - close them or change keys in `typebox.ahk`

### Can I change hotkeys?

Yes. At the top of `typebox.ahk`:

```ahk
F8:: app.Toggle()
F9:: app.Submit()
```

Replace `F8` / `F9` with what you need, e.g. `^!t::` (Ctrl+Alt+T).

---

## License

MIT
