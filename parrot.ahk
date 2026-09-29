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
    global diacritics    
    diacritics := !diacritics
    SoundBeep
    if (diacritics) {
        ToolTip("Diacritics enabled")
    } else {
        ToolTip("Diacritics disabled")
    }
    SetTimer(() => ToolTip(), -1000) ;
}
#HotIf

diacritics := false
#Hotif diacritics
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