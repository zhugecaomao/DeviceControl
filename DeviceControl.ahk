#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #NoTrayicon
Menu, Tray, Icon, tray.ico,1	; enabled icon
Menu, Tray, NoStandard
Menu, Tray, Add, Toggle Touch, Toggle	; adding tray-icon click option
Menu, Tray, Add, 
Menu, Tray, Standard
Menu, Tray, Default, Toggle Touch

Disabled:=0

Toggle:	; double click tray icon to disable/enable
#1::	; Hotkey to disable/enable
if (Disabled=0) {
Run DevManView_64\DevManView.exe /disable "Sentinel USB Key"	; path to DevManView and disable device with this name/ID
Disabled:=1
Menu, Tray, Icon , trayd.ico,,1	; disabled icon
ToolTip, Touchscreen disabled	; little tooltip displayed to visualize the current action
SetTimer, RemoveToolTip, 3000
return
}
else {
Run DevManView_64\DevManView.exe /enable "Sentinel USB Key"	; path to DevManView and enable device with this name/ID
Disabled:=0
Menu, Tray, Icon , tray.ico,,1	; enabled icon
ToolTip, Touchscreen enabled	; little tooltip displayed to visualize the current action
SetTimer, RemoveToolTip, 3000
return
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return