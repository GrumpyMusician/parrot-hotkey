#Requires AutoHotkey v2.0

#+F23::return

#HotIf GetKeyState("F23", "P")
/*
    Powertoys -----------------------------------------------------------
*/
#+a::#^t ; Toggle always on top
;        ; C -> Color picker
;        ; T -> Text extractor
;        ; ; -> ZoomIt (remapped for win + shift + ;)

/*
    Utility -------------------------------------------------------------
*/
#+Up::PgUp
#+Down::PgDn
#+/::Send("{Media_Play_Pause}")
#+,::Send("{Media_Prev}")
#+.::Send("{Media_Next}")

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
    :?*:dz::đ
#Hotif