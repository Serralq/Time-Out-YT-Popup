tell application "Finder" to set volume 6

tell application "Safari"
	
	quit saving no
	delay 0.25
	activate
	
	tell application "System Events" to keystroke "m" using {option down, control down}
	delay 0.25
	
	tell window 1 to set current tab to (make new tab with properties {URL:"https://www.youtube.com/playlist?list=PLxpmxAHpgayoPH-n-LyUys7CCLKedkqcy"})
	
	tell application "System Events"
		keystroke "6" using {option down, control down}
		delay 0.25
		keystroke "m" using {option down, control down}
		delay 0.25
	end tell
	
	delay 2
	
	do JavaScript "document.querySelector('[aria-label=\"Shuffle play\"]').click();" in document 1
	
	delay 2
	
	do JavaScript "document.getElementsByClassName('ytp-fullscreen-button ytp-button')[0].click();" in document 1
end tell

delay 2

on exercise()
	set exerciseList to {"Jumping Jacks", "Planks", "Push-ups", "Pull-ups"}
	set exercises to item (random number from 1 to length of exerciseList) of exerciseList
	set results to display dialog ("One thing at a time...Exercise NOW!: " & exercises) buttons {"Nai!", "Hai!"} with icon ((path to desktop folder as text) & "HotKeys:Resources:AnyConv.com__yamanosusume2nd09.icns") as alias
	if button returned of results is equal to "Nai!" then
		exercise()
	end if
end exercise

exercise()
