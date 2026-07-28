#Requires AutoHotkey v2.0
#SingleInstance Force

app := TypeBoxApp()
app.Init()

F8:: app.Toggle()
F9:: app.Submit()

class TypeBoxApp {
    Gui := 0
    Edit := 0
    IsOpen := false
    TargetHwnd := 0
    PosX := 12
    PosY := 12
    Width := 360
    Height := 100

    Init() {
        this.Gui := Gui("+AlwaysOnTop -DPIScale +ToolWindow -Caption +Border", "typebox")
        this.Gui.SetFont("s10", "Segoe UI")
        this.Gui.MarginY := 10
        this.Gui.MarginX := 10
        this.Edit := this.Gui.Add("Edit", "w340 h70 +Multi")
        Hotkey("Escape", this.OnEsc.Bind(this), "Off")
    }

    Toggle() {
        if this.IsOpen {
            this.Close()
            return
        }
        this.TargetHwnd := WinExist("A")
        this.Gui.Show("x" this.PosX " y" this.PosY " w" this.Width " h" this.Height)
        this.IsOpen := true
        Hotkey("Escape", "On")
        this.Edit.Focus()
        SendMessage(0xB1, 0, -1, this.Edit)
    }

    OnEsc(*) {
        this.Close()
    }

    Close(*) {
        if !this.IsOpen
            return
        this.Gui.Hide()
        this.IsOpen := false
        Hotkey("Escape", "Off")
        this.TargetHwnd := 0
    }

    Submit() {
        if !this.IsOpen
            return
        text := this.Edit.Value
        target := this.TargetHwnd
        this.Close()
        if text = ""
            return
        if target && WinExist("ahk_id " target)
            WinActivate("ahk_id " target)
        Sleep 80
        SendText(text)
    }
}
