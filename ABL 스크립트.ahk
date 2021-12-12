#NoEnv
#SingleInstance Force

; 통계서버 url
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

Gui, Font, S30 C000000 +Center Bold, 맑은 고딕
Gui, Add, Text, x0 y100 w%A_ScreenWidth% h53 +Center, [ABL 생명 APT 훈련 모의훈련 진행 중]
Gui, Font, S20 C000000, 맑은 고딕
Gui, Add, Text, x0 y180 w%A_ScreenWidth% h35 +Center , 이 PC는 훈련용 악성코드에 감염되었습니다.
Gui, Add, Text, x0 y220 w%A_ScreenWidth% h35 +Center , ● 본인 PC에서 개인정보 및 회사정보가 유출되고 있습니다.
Gui, Add, Text, x0 y260 w%A_ScreenWidth% h35 +Center , ● 본인 PC를 통해 다른 임직원 PC에 악성코드를 전파하고 있습니다.
Gui, Font, S20 C000000 Bold, 맑은 고딕
Gui, Add, Text, x0 y320 w%A_ScreenWidth% h35 +Center ,  ※ 훈련용 악성코드 감염으로 인해 PC사용이 5분간 차단됩니다.
Gui, Add, Text, x0 y360 w%A_ScreenWidth% h35 +Center vcnt, %cnt% 초가 지난 후에 PC 사용이 가능합니다.
Gui, Font, S15 C000000, 맑은 고딕
Gui, Add, Picture, x%imgw% y450 +Center, memo.png
Gui, Font, S25 C000000, 맑은 고딕
Gui, Add, Text, x0 y710 w%A_ScreenWidth% h43 +Center, 관련 문의사항은 정보보안팀으로 연락주시기 바랍니다.

SetTimer, call, 1000
SetTimer, TaskManager, 100

Gui, Color, FFFFFF
Gui, +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Show, Maximize
FileDelete, memo.png

; Start Timer
call:
{
	GuiControl, , cnt, %cnt% 초가 지난 후 사용 가능합니다.
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
^+F12:: ExitApp		; 프로그램 강제종료 (치트키)

; TaskMgr
TaskManager:
{
	BlockInput, On
	WinClose, Windows 작업 관리자
	WinClose, 작업 관리자
	Process, Close, Taskmgr.exe
	Process, Close, C:\Windows\System32\Taskmgr.exe
}