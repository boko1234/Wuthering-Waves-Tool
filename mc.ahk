

; ToolTip "", 1000,20,16
; SysGet , VirtualWidth, 16
; SysGet , VirtualHeight, 17
CoordMode , ToolTip, Screen
Process, Priority, , High

#Persistent
#SingleInstance

;-------------------------------------------------定义变量
; 全局变量

v_cli := False
v_Enable := False
v_p := False
show_tips_y := 1000
; $Esc::

; 	Send {Esc}
; 	CloseStatus()
; Return

;~$*
; $通常只在脚本使用 Send 函数发送包含了热键自身的按键时才需要使用此符号, 此时可以避免触发它自己
; ~触发热键时, 热键中按键原有的功能不会被屏蔽(对操作系统隐藏)
; *通配符: 发送按键自身



; 公共方法
GetColor(x, y){
	PixelGetColor , color, x, y, RGB
	StringRight color, color, 10	;
	return color
}
autolbg(){

	KeyWait, Shift, 
	KeyWait, Alt, 
	SendInput, f{WheelDown}
	; SendInput, 
}
biu(){
	Click
}
return
rbiu(){
	Click
}
return



CloseStatus(){
	global
	v_Enable := False
	v_cli := False
	v_p := False
	SetTimer biu,off
	ToolTip    ,,,,2
	SetTimer autolbg,off
	ToolTip    ,,,,1
	SetTimer fdse,off
	ToolTip ,,,,7
}
OpenF(){
	global
	v_Enable := !v_Enable
	if (v_Enable = False){
		SetTimer , autolbg, Off
		ToolTip ,,,,1
	} else {
		SetTimer , autolbg, 100
		ToolTip GG, 1000,show_tips_y,1	
	}
	SetTimer fdse,off
	ToolTip ,,,,7
}
OpenX(t=100){
	global
	v_cli := !v_cli
	If (v_cli == False){
		SetTimer biu,off
		ToolTip    ,,,,2
	}else{
		Click
		SetTimer biu,%t%
		ToolTip on, 940,show_tips_y,2	;On显示的位置坐标
	}
}

; onautof(){
; 	SetTimer , autolbg, 100
; 	ToolTip GG, 1000,show_tips_y,1	
; }
; offautof(){
; 	SetTimer , autolbg, Off
; 	ToolTip ,,,,1
; }
suspeed_func(){
	if (A_IsSuspended=1)
		ToolTip,Suspend global,929,50,10
	else if (A_IsSuspended=0)
		ToolTip,,,,10
}

escbiu(k){
	; GetColor(-709,918)=="0x374738"GetColor(67,892)=="0x2A3B2C"GetColor(1094,593)=="0x646464"
	Send {Esc}
	Sleep 800
	Click 67,892
	Sleep, 500
	Click 1094,593
	; ToolTip NO, 1000,50,16
}

userpass(u,p){
	
	
}


; label 合集
; autolbg:
; {
; 	; KeyWait, Shift, 
; 	; KeyWait, Alt, 
; 	SendInput, f
; 	SendInput, {WheelDown}
; }
; return

; biu:
; {
; 	Click
; }
; return

esc_close:
{
	; Send {Esc}
	CloseStatus()
}
return


fdse:
{

	if(GetColor(1600,551)=="0xDFD885" or GetColor(1097,165)=="0xC1A051" or GetColor(1601,399)=="0xDFD885"
		or GetColor(1600,740)=="0xDFD985"){
		; click 1320,867GetColor(1237,871)=="0x3C3C3C"
		MouseMove 1400,864
	}
	; 
	; 
	; 
	; 
	if (GetColor(1337,844)=="0x3C3C3C"){
		Click 1400,864
		; v_p = !v_p
		ToolTip ,,,,7
		SetTimer fdse,off
	} Else If (GetColor(1482,875)=="0x3C3C3C"){
		Click 
		Sleep, 500
		Click 1065,592
		ToolTip ,,,,7
		SetTimer fdse,off
	}
	

}
Return


; A_Clipboard
^F1::
{
	MouseGetPos x, y, , ,
	color := GetColor(x ,y)
	clipboard := "GetColor(" x ", " y ") == """ color """"
}
Return

~$*F8 UP::
	Suspend
	suspeed_func()

return

~$*f12 UP::
	Reload
return

~$*Esc:: Gosub, esc_close


; Client-Win64-Shipping.exe Client-Win64-Shipping.exe || Game.exe

#IfWinActive ahk_exe Client-Win64-Shipping.exe 
; if WinActive("ahk_exe Client-Win64-Shipping.exe") and WinExist("ahk_exe Client-Win64-Shipping.exe")
; #IfWinActive ahk_exe Game.exe 
; #IfWinActive ahk_exe Game.exe
; if WinActive("ahk_exe Client-Win64-Shipping.exe") or WinActive("ahk_exe Game.exe")






6::
{
	escbiu("6")
	; userpass("","")
	userpass("","")
}
return
7::
{
	escbiu("7")
	userpass("","")
}
return
8::
{
	escbiu("8")
	userpass("","")
}
return
9::
{
	escbiu("9")
	userpass("","")
	; userpass("","")
}
return


$f6::f4
; f2::l

$f4::
	Send {F2}
Return

; 自定义按键绑定
$f2::
$m::
$v::
$c::
$b::
$n::
	StringRight KeyM,A_ThisHotkey,1 
	{
		
		; if (v_Enable == True or v_cli == True or v_p := True ){
			; offautof()
			CloseStatus()
		; }
		; ToolTip %KeyM%, 800,show_tips_y,7
		; MsgBox, %KeyM%
		If KeyM=2
		{
			Send l
		}
		if KeyM=m
		{
			Send m
			; v_p := False
			; if (v_p = True)
			; {
			; 	ToolTip ,,,,7
			; 	SetTimer fdse,off
			; } else {
			; v_p = True
			ToolTip %KeyM%, 800,show_tips_y,7
			SetTimer fdse, 
			; }
		}
		if KeyM=v
		{
			Send c
		}
		if KeyM=n
		{
			Send v
		}
		if KeyM=b
		{
			Send b
		}
		if KeyM=c
		{
			Send x
		}
	}
return








~$*RButton::
	SetTimer rbiu,100
	ToolTip on, 940,1000,3
Return

RButton Up::  
	; v_cli := False
	SetTimer rbiu,off
	ToolTip    ,,,,3
return  


*x::
{
	OpenX()
}
return

*g::	;F键 开关
{
	OpenF()
}
return



WheelDown::
	Send {WheelDown 10}
return

WheelUp::
	Send {WheelUp 10}
Return


#IfWinActive


































