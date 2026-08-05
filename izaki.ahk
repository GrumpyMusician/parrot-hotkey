#Requires AutoHotkey v2.0

diacritics := false

~LShift & RShift::
~RShift & LShift::{
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

#HotIf diacritics
    :?*:aa::ā
    :?*:ee::ē
    :?*:ii::ī
    :?*:oo::ō
    :?*:uu::ū
    :?*:ae::ä
    :?*:oe::ö
    :?*:ue::ü
    :?*:dz::đ
#HotIf 