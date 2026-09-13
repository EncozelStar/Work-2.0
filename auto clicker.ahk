#NoEnv
#SingleInstance Force
SetBatchLines -1
ListLines Off
SendMode Input

Interval := 20
IsActive := false
UI_Width := 150
UI_Height := 50

Gui, +AlwaysOnTop +ToolWindow -Caption +Border +HwndGuiHwnd
Gui, Color, FFFFFF
Gui, Font, s14 cBlack wBold, Segoe UI
Gui, Add, Text, x0 y10 w%UI_Width% Center vStatusText BackgroundTrans, Quextin

SysGet, Workspace, MonitorWorkArea
X_Pos := WorkspaceRight - UI_Width 
Y_Pos := WorkspaceBottom - UI_Height - 230 

Gui, Show, x%X_Pos% y%Y_Pos% w%UI_Width% h%UI_Height% NoActivate, Autoclicker Status
return

#IfWinActive, ahk_exe RobloxPlayerBeta.exe

*MButton::
    IsActive := !IsActive
    if (IsActive)
    {
        Gui, Color, FF0000 
        Gui, Font, cWhite
        GuiControl, Font, StatusText
        GuiControl,, StatusText, evil quextin
    }
    else
    {
        Gui, Color, FFFFFF
        Gui, Font, cBlack
        GuiControl, Font, StatusText
        GuiControl,, StatusText, Quextin
        SetTimer, ClickLoop, Off
    }
return

~$LButton::
    if (IsActive)
    {
        SetTimer, ClickLoop, %Interval%
        KeyWait, LButton
        SetTimer, ClickLoop, Off
    }
return

ClickLoop:
    Click
return

#If