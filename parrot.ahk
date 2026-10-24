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
;        ; ' -> ZoomIt (remapped for win + shift + ')

/*
    Diacritics ----------------------------------------------------------
*/
#+;::{
    global toggleDiacritics    
    toggleDiacritics := !toggleDiacritics
    SoundBeep
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
    Oakridge ------------------------------------------------------------
*/
toggleOakridge := false
#+o::{
    global toggleOakridge
    toggleOakridge := !toggleOakridge
    SoundBeep(500)
    if (toggleOakridge) {
        ToolTip("Oakridge enabled") 
    } else {
        ToolTip("Oakridge disabled")
    }
    SetTimer(() => ToolTip(), -1000)
}

#HotIf toggleOakridge
    data := Map( 950,  [3310, 486, "3 3 0", "41", "2 0 0 0 | 2 0 0 0", 16, "Y"], 960,  [3325, 491, "3 3 0", "41", "2 0 0 0 | 2 0 0 0", 16, "N"], 970,  [3340, 496, "3 3 0", "41", "2 0 0 0 | 2 0 0 0", 17, "Y"], 980,  [3350, 501, "3 3 0", "42", "2 0 0 0 | 2 0 0 0", 17, "N"], 990,  [3365, 506, "3 3 0", "42", "2 0 0 0 | 2 0 0 0", 17, "Y"], 1000, [3380, 511, "3 3 0", "42", "2 0 0 0 | 2 0 0 0", 17, "N"], 1010, [3395, 516, "3 3 0", "43", "2 0 0 0 | 2 0 0 0", 17, "Y"], 1020, [3410, 521, "3 3 0", "43", "2 0 0 0 | 2 0 0 0", 17, "N"], 1030, [3420, 526, "3 3 0", "43", "2 0 0 0 | 2 0 0 0", 18, "Y"], 1040, [3435, 531, "3 3 1", "44", "2 0 0 0 | 2 0 0 0", 18, "N"], 1050, [3445, 536, "3 3 1", "44", "2 0 0 0 | 2 0 0 0", 18, "Y"], 1060, [3455, 541, "3 3 1", "44", "2 0 0 0 | 2 0 0 0", 18, "N"], 1070, [3470, 546, "3 3 1", "45", "2 0 0 0 | 2 0 0 0", 18, "Y"], 1080, [3485, 551, "3 3 1", "45", "2 0 0 0 | 2 0 0 0", 18, "N"], 1090, [3490, 556, "3 3 1", "45", "2 0 0 0 | 2 0 0 0", 19, "Y"], 1100, [3510, 561, "3 3 1", "46", "2 0 0 0 | 2 0 0 0", 19, "N"], 1110, [3520, 566, "3 3 1", "46", "2 0 0 0 | 2 0 0 0", 19, "Y"], 1120, [3535, 571, "3 3 1", "47", "2 0 0 0 | 2 0 0 0", 19, "N"], 1130, [3550, 576, "3 3 1", "47", "2 0 0 0 | 2 0 0 0", 19, "Y"], 1140, [3565, 581, "3 3 1", "47", "2 0 0 0 | 2 0 0 0", 19, "N"], 1150, [3580, 586, "3 3 2", "48", "3 0 0 0 | 3 0 0 0", 20, "Y"], 1160, [3600, 591, "3 3 2", "48", "3 0 0 0 | 3 0 0 0", 20, "N"], 1170, [3610, 596, "3 3 2", "48", "3 0 0 0 | 3 0 0 0", 20, "Y"], 1180, [3620, 601, "3 3 2", "48", "3 0 0 0 | 3 0 0 0", 20, "N"], 1190, [3630, 606, "3 3 2", "50", "3 0 0 0 | 3 0 0 0", 20, "Y"], 1200, [3635, 611, "3 3 2", "51", "3 0 0 0 | 3 0 0 0", 20, "N"], 1210, [3650, 616, "3 3 2", "52", "3 0 0 0 | 3 0 0 0", 21, "Y"], 1220, [3660, 621, "3 3 2", "53", "3 0 0 0 | 3 0 0 0", 21, "N"], 1230, [3670, 626, "3 3 2", "53", "3 0 0 0 | 3 0 0 0", 21, "Y"], 1240, [3680, 631, "3 3 2", "54", "3 0 0 0 | 3 0 0 0", 21, "N"], 1250, [3690, 636, "3 3 2", "54", "3 0 0 0 | 3 0 0 0", 21, "Y"], 1260, [3700, 641, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 21, "N"], 1270, [3715, 646, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "Y"], 1280, [3720, 651, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "N"], 1290, [3735, 656, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "Y"], 1300, [3740, 661, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "Y"], 1310, [3755, 666, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "Y"], 1320, [3780, 671, "3 3 2", "55", "3 0 0 0 | 3 0 0 0", 22, "N"], 1330, [3780, 676, "3 3 2", "55/56", "3 0 0 0 | 3 0 0 0", 23, "Y"], 1340, [3800, 681, "3 3 2", "55/57", "3 0 0 0 | 3 0 0 0", 23, "N"], 1350, [3810, 686, "3 3 2", "55/58", "3 0 0 0 | 3 0 0 0", 23, "N"], 1360, [3820, 691, "3 3 2", "55/59", "3 0 0 0 | 3 0 0 0", 23, "N"], 1370, [3830, 696, "3 3 2", "55/60", "3 0 0 1 | 3 0 0 1", 23, "N"], 1380, [3840, 701, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 23, "N"], 1390, [3850, 706, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1400, [3870, 711, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1410, [3880, 716, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1420, [3890, 721, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1430, [3900, 726, "3 3 2", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1440, [3905, 731, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 24, "N"], 1450, [3920, 736, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"], 1460, [3925, 741, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"], 1470, [3930, 746, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"], 1480, [3935, 750, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"], 1490, [3935, 750, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"], 1500, [3935, 750, "3 3 3", "60", "3 0 0 1 | 3 0 0 1", 25, "N"] )
    demand := 0

    1::{
        updateDemand(1)
    }
    2::{
        updateDemand(2)
    }
    3::{
        updateDemand(3)
    }
    4::{
        updateDemand(4)
    }
    5::{
        updateDemand(5)
    }
    6::{
        updateDemand(6)
    }
    7::{
        updateDemand(7)
    }
    8::{
        updateDemand(8)
    }
    9::{
        updateDemand(9)
    }
    0::{
        updateDemand(0)
    }
    BackSpace::{
        global demand
        if (SubStr(String(demand), 1, -1) == ""){
            demand := 0
        }
        else {
            demand := Integer(SubStr(String(demand), 1, -1))
        }
        ToolTip("Grid Demand: " . demand . " MW", 2948.239488, 2948.239488)
    }
    Enter::{
        global data, demand
        if (!data.Has(demand)) {
            if (data.Has(demand * 10)) {
                demand *= 10
            }
            else if (data.Has(demand * 100)) {
                demand *= 100
            }
            else if (demand == 1) {
                demand := 1000
            }
            else {
                ToolTip("Demand not found.", 2948.239488, 2948.239488)
                SetTimer(() => ToolTip(), -1000)
                return
            }
        }
        lookup := data[demand]

        ToolTip(
            "Split Deaerator Calculator" .
            "`nGrid Demand: " . demand . " MW" .
            "`nReactor Power: " . lookup[1] . " MWt" .
            "`nMCP: 3 0 0 | " . lookup[3] .
            "`nAuto Bypass " . lookup[2] .
            "`nTurbine Inlet: " . lookup[4] . "%" .
            "`nCND: " . lookup[5] .
            "`nSell Rate: " . lookup[6] . " MW/s" .
            "`nConfirmed: " . lookup[7]
            , 2948.239488, 2948.239488
        )
    }

    updateDemand(number){
        global demand
        if (demand >= 950){
            demand := 0
        }
        demand := Integer(String(demand) . number)
        ToolTip("Grid Demand: " . demand . " MW", 2948.239488, 2948.239488)
    }
#HotIf

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
    SoundBeep(300)
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
        this.morseMap := Map(".-", "a", "-...", "b", "-.-.", "c", "-..", "d", ".", "e", "..-.", "f", "--.", "g", "....", "h", "..", "i", ".---", "j", "-.-", "k", ".-..", "l", "--", "m", "-.", "n", "---", "o", ".--.", "p", "--.-", "q", ".-.", "r", "...", "s", "-", "t", "..-", "u", "...-", "v", ".--", "w", "-..-", "x", "-.--", "y", "--..", "z", "-----", "0", ".----", "1", "..---", "2", "...--", "3", "....-", "4", ".....", "5", "-....", "6", "--...", "7", "---..", "8", "----.", "9")
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