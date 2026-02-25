## LucyK
Chorded keyboard using AHK and an azeron cyborg2

[chorded keyboard](https://en.wikipedia.org/wiki/Chorded_keyboard)

Requires AutoHotkey v2.0
Uses Azeron Cyborg2, but any input device could work. 

lucy-cyborg.txt is the text string for importing the profile using the azeron software.
move.png is used for the overlay, and needs to be in the same directory as the ahk script.

# How do:

1. Import and activate the profile in the azeron software. (lucy-cyborg.txt)
2. Run the AHK script. (LucyK.ahk)
3. ???
4. Profit.

Using the four finger buttons individually or in combinations, selects a set of four characters.While holding the finger buttons, the set of characters are displayed in an overlay, with each character displayed corisponding to the direction you move the thumbstick to select it.

Using the thumbstick alone send Tab(Forward), Backspace(Back), Enter(Left), and Space(Right)

The two outer thumb buttons are used for Shift and capslock.
The top button will hold shift while sending the next character, then release it.
The bottom button will toggle on "capslock". It's not actually capslock because reasons.
While "capslock" is on, pressing either of the thumb buttons will toggle it off.

Links:
AutoHotkey - https://github.com/AutoHotkey/AutoHotkey
Azeron - https://www.azeron.eu/
move.png - https://feathericons.com/
