#Requires AutoHotkey v2.0
#SingleInstance
; keypress/direction to array index
k_up := 1
k_down := 2
k_left := 3
k_right := 4

direction := [ "{Tab}", "{Backspace}", "{Enter}", "{Space}" ]
keymap := [
		["e","t","a","o"],
		["i","n","s","h"],
		["r","d","l","c"],
		["u","m","w","f"],
		["g","y","p","b"],
		["v","k","j","x"],
		["q","z",",","."],
		["!","?",",","."],
		["1","2","3","4"],
		["5","6","7","8"],
		["9","0","-","="],
		["[","]","{","}"],
		["!","!","!","!"],
		["!","!","!","!"],
		["Up","Down","Left","Right"]
]

^F5::
^F6::
^F7::
^F8::
{
	UpdateOSD()
}

^F5 UP::
^F6 UP::
^F7 UP::
^F8 UP::
{
	UpdateOSD()
}

^F9::TheThing(k_up)

^F10::TheThing(k_down)

^F11::TheThing(k_left)

^F12::TheThing(k_right)


TheThing(derp)
{
	nibble := UpdateOSD()
	if (nibble > 0)
	{
		V := keymap[nibble][derp]
		Send nibble == 15 ? "{" V "}" : "{Raw}" V
	}
	if (nibble == 0)
	{
		Send direction[derp]
	}

}


MyGui := Gui()
MyGui.Opt("+AlwaysOnTop -Caption +ToolWindow ")  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
MyGui.BackColor := "EEAA99"  ; Can be any RGB color (it will be made transparent below).
MyGui.SetFont("s32 cLime q5")  ; Set a large font size (32-point).

UpText := MyGui.Add("Text", "x200 y0 w120 h75 Center",)  ; XX & YY serve to auto-size the window."x260 y48 w100 h100 +0x200",
RtText := MyGui.Add("Text", "x300 y100 w120 h75 Center",) 
LtText := MyGui.Add("Text", "x100 y100 w120 h75 Center",) 
DnText := MyGui.Add("Text", "x200 y200 w120 h75 Center",) 
MyGui.AddPicture("w75 h-1 x222 y90", "move.png")

; Make all pixels of this color transparent and make the text itself translucent (150):
WinSetTransColor(MyGui.BackColor " 255", MyGui)
UpdateOSD()  ; Make the first update immediate rather than waiting for the timer.
MyGui.Show("Center w600 h600 NoActivate")  ; NoActivate avoids deactivating the currently active window.
MyGui.Hide()
UpdateOSD(*)
{
	nibble := 0
	if GetKeyState("F5", "P")
	{
		nibble += 1
	}
	if GetKeyState("F6", "P")
	{
		nibble += 2
	}
	if GetKeyState("F7", "P")
	{
		nibble += 4
	}
	if GetKeyState("F8", "P")
	{
		nibble += 8
	}
    if (nibble > 0) ; && nibble < 9)
    {
	    V := keymap[nibble]
	    UpText.Value := V[k_up]
	    RtText.Value := V[k_right]
	    LtText.Value := V[k_left]
	    DnText.Value := V[k_down]

	    MyGui.Restore()
	}
	Else
	{
		MyGui.Hide()
		if (nibble < 0 || nibble > 15)
		{
			nibble := 0
		}
	}
	return nibble
}