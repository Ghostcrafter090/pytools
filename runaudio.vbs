function FileExists(FilePath)
	Set fso = CreateObject("Scripting.FileSystemObject")
	if fso.FileExists(FilePath) then
		FileExists = 1
	else
		FileExists = 0
	end if
end function

if WScript.Arguments.Count = 0 then
	WScript.Echo "Missing parameters"
end if

vol = 100
bal = 0
speed = 1
limiter = "null"

if WScript.Arguments.Count < 2 then
	vol = 100
	bal = 0
	speed = 1
	limiter = "null"
else 
	vol = Wscript.Arguments(1)
	bal = Wscript.Arguments(2)
	speed = Wscript.Arguments(3)
	if Wscript.Arguments(3) = 0 then
		speed = 1.0
	end if
	limiter = Wscript.Arguments(4)
end if

if FileExists("remember.derp") = 0 then
	Set Sound = CreateObject("WMPlayer.OCX.7") 
	Sound.URL = WScript.Arguments.Item(0)
	Sound.Settings.Volume = vol
	Sound.Settings.Balance = bal
	Sound.Settings.Rate = speed
	Sound.Controls.play 
	do while Sound.currentmedia.duration = 0 
		wscript.sleep 100 
	loop 
	wscript.sleep (int(Sound.currentmedia.duration)+1)*1000
end if
wscript.quit 0