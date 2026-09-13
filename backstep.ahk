#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#NoEnv

global taps := 0
global keyPressed := false
global activated := false

#IfWinActive, ahk_exe RobloxPlayerBeta.exe

decrementTaps() {
    taps := 0
    SetTimer, decrementTaps, Off
}


~$*s::
if(!keyPressed ) {
    keyPressed := true
    taps++
    SetTimer, decrementTaps, 200
    if(taps == 2) {
        activated := true
        Send {w}
        Sleep 10
        Send {w down}
        Sleep 10
        Send {up}
        Send {down}
        Send {down down}
    }
}
return

~$*s up::
keyPressed := false
if(activated = true) {
    Send {down up}
    Send {w up}
    activated := false
}
return


~/::Suspend on
~enter::Suspend off
~Esc::Suspend off
~LButton::Suspend off
#If
