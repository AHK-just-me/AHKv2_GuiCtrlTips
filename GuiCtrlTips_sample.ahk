#Requires AutoHotkey v2.0
; ======================================================================================================================
; Release date: 2023-05-28
; ======================================================================================================================
#Include GuiCtrlTips.ahk
MainGui := Gui( , "ToolTips")
MainGui.Tips := GuiCtrlTips(MainGui)      ; create a GuiCtrlTips instance
MainGui.Tips.SetBkColor(0x404040)         ; set the background colour
MainGui.Tips.SetTxColor(0xFFFFFF)         ; set the text colour
MainGui.Tips.SetMargins(4, 4, 4, 4)       ; set the tect margins
MainGui.Tips.SetFont(24, "Arial", , 1)    ; set the font
MainGui.MarginX := 10
MainGui.MarginY := 10
MainBtn1 := MainGui.AddButton("w200 h20", "Button1")
MainBtn1.OnEvent("Click", ToggleBtn1)
MainGui.Tips.SetTip(MainBtn1, "Click me first")
Btn1TT := True
MainBtn2 := MainGui.AddButton("w200 h20", "Button2")
MainGui.Tips.SetTip(MainBtn2, "I'm button 2!`r`nI show a multi-line tooltip.`r`nLet's see, how long it is shown!")
MainBtn3 := MainGui.AddButton("w200 h20", "Show 10 seconds!")
MainBtn3.OnEvent("Click", (*) => MainGui.Tips.SetDelayTime("AUTOPOP", 10000))
MainBtn4 := MainGui.AddButton("w200 h20", "Default time!")
MainBtn4.OnEvent("Click", (*) => MainGui.Tips.SetDelayTime("AUTOPOP", -1))
MainTxt5 := MainGui.AddText("w200 h20 +0x0100 Border", "Text")
MainGui.Tips.SetTip(MainTxt5, "Gotcha!")
MainBtn6 := MainGui.AddButton("w200 h20 ym", "Button6")
MainBtn7 := MainGui.AddButton("w200 h20", "Button7")
MainBtn8 := MainGui.AddButton("w200 h20", "Avtivate!")
MainBtn8.OnEvent("Click", (*) => MainGui.Tips.Activate())
MainBtn9 := MainGui.AddButton("w200 h20", "Deactivate!")
MainBtn9.OnEvent("Click", (*) => MainGui.Tips.Deactivate())
MainEdt0 := MainGui.AddEdit("w200 h20", "Edit")
MainGui.Tips.SetTip(MainEdt0, "Finally we have an Edit!", True)
MainCBB1 := MainGui.AddComboBox("xm w410", ["Red", "Green", "Blue"])
MainGui.Tips.SetTip(MainCBB1, "That's the tooltip of a ComboBox")
MainGui.Show()
; ----------------------------------------------------------------------------------------------------------------------
ToggleBtn1(*) {
   Global Btn1TT := !Btn1TT
   MainGui.Tips.SetTip(MainBtn1, Btn1TT ? "Click me first" : "")
}
