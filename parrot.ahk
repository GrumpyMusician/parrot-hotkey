#Requires AutoHotkey v2.0

#+F23::return

#HotIf GetKeyState("F23", "P")
/*
    Powertoys -----------------------------------------------------------
*/
#+BackSpace::#^t ; Toggle always on top
#+-::#^- ; Increase Opacity
#+=::#^= ; Decrease Opacity
;        ; C -> Color picker
;        ; T -> Text extractor
;        ; ; -> ZoomIt (remapped for win + shift + ;)

/*
    Diacritics ----------------------------------------------------------
*/
#+o::{
    global toggleDiacritics    
    toggleDiacritics := !toggleDiacritics
    SoundBeep(300)
    if (toggleDiacritics) {
        ToolTip("Diacritics enabled")
    } else {
        ToolTip("Diacritics disabled")
    }
    SetTimer(() => ToolTip(), -1000)
}
#HotIf

toggleDiacritics := false
#Hotif toggleDiacritics
    :?*:aa::ā
    :?*:ee::ē
    :?*:ii::ī
    :?*:oo::ō
    :?*:uu::ū
    :?*:ae::ä
    :?*:oe::ö
    :?*:ue::ü
    :?*:dz::ð
#Hotif

/*
    Morse Code ----------------------------------------------------------
*/


/*
    Morse Code ----------------------------------------------------------
*/

#MaxThreadsPerHotkey 4

toggleMorse := false
morse := MorseClass(78)

#+Space::{
    global toggleMorse, morse
    toggleMorse := !toggleMorse
    morse.clearBuffers()
    SoundBeep
    if (toggleMorse) {
        ToolTip("Morse enabled")
    } else {
        ToolTip("Morse disabled")
    }
    SetTimer(() => ToolTip(), -1000)
}

#HotIf toggleMorse
    Space::{
        global morse
        morse.cancelTimers()
        morse.setSpaceDnTime()
        morse.setFlag(true)
    }
    Space Up::{
        global morse
        morse.setSpaceUpTime()
        if (morse.getSpaceUpTime() - morse.getSpaceDnTime()
            < morse.getUnitLength() * 2) {
            morse.appendRawBuffer(".")
        } else {
            morse.appendRawBuffer("-")
        }
        morse.setFlag(false)
        morse.updateToolTip()
        morse.scheduleCharacter()
    }
#HotIf
class MorseClass {
    __New(unitLength) {
        this.morseMap := Map(
            ".-", "a", "-...", "b", "-.-.", "c",
            "-..", "d", ".", "e", "..-.", "f",
            "--.", "g", "....", "h", "..", "i",
            ".---", "j", "-.-", "k", ".-..", "l",
            "--", "m", "-.", "n", "---", "o",
            ".--.", "p", "--.-", "q", ".-.", "r",
            "...", "s", "-", "t", "..-", "u",
            "...-", "v", ".--", "w", "-..-", "x",
            "-.--", "y", "--..", "z",
            "-----", "0", ".----", "1", "..---", "2",
            "...--", "3", "....-", "4", ".....", "5",
            "-....", "6", "--...", "7", "---..", "8",
            "----.", "9"
        )
        this.unitLength := unitLength
        this.spaceDnTime := 0
        this.spaceUpTime := 0
        this.rawBuffer := ""
        this.uncommittedBuffer := ""
        this.flag := false
        this.charTimer := ObjBindMethod(this, "commitToBuffer")
        this.wordTimer := ObjBindMethod(this, "commitToComputer")
    }
    getFlag() {
        return this.flag
    }
    setFlag(newFlag := "") {
        if (newFlag == "") {
            this.flag := !this.flag
        } else {
            this.flag := newFlag
        }
    }
    getUnitLength() {
        return this.unitLength
    }
    getSpaceDnTime() {
        return this.spaceDnTime
    }
    setSpaceDnTime() {
        this.spaceDnTime := A_TickCount
    }
    getSpaceUpTime() {
        return this.spaceUpTime
    }
    setSpaceUpTime() {
        this.spaceUpTime := A_TickCount
    }
    getRawBuffer() {
        return this.rawBuffer
    }
    appendRawBuffer(char) {
        this.rawBuffer .= char
    }
    cancelTimers() {
        SetTimer(this.charTimer, 0)
        SetTimer(this.wordTimer, 0)
    }
    clearBuffers() {
        this.cancelTimers()
        this.rawBuffer := ""
        this.uncommittedBuffer := ""
        this.flag := false
        this.updateToolTip()
        SetTimer(() => ToolTip(), -500)
    }
    scheduleCharacter() {
        SetTimer(this.charTimer, -this.unitLength * 2)
    }
    commitToBuffer() {
        if (this.flag)
            return
        if (this.morseMap.Has(this.rawBuffer)) {
            this.uncommittedBuffer .= this.morseMap[this.rawBuffer]
        }
        this.rawBuffer := ""
        this.updateToolTip()
        if (this.uncommittedBuffer != "")
            SetTimer(this.wordTimer, -this.unitLength * 4)
    }
    commitToComputer() {
        if (this.flag)
            return
        if (this.uncommittedBuffer != "") {
            SendText(this.uncommittedBuffer . " ")
            this.uncommittedBuffer := ""
        }
        this.updateToolTip()
        SetTimer(() => ToolTip(), -500)
    }

    updateToolTip() {
        ToolTip(this.uncommittedBuffer . this.rawBuffer . "‸")
    }
}