; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;; #z::Run www.autohotkey.com

;; ^!n::
;; IfWinExist Untitled - Notepad
;; 	WinActivate
;; else
;; 	Run Notepad
;; return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.



; Emacs Keybind
; =============
#InstallKeybdHook
#UseHook
#IfWinActive, ahk_class IEFrame
	^u::
		Send {AltDown}{v}{c}{AltUp}
		Return
Return
#IfWinActive

is_pre_x = 0	; C-x Mode
is_pre_a = 0	; C-x Mode
is_pre_spc = 0 	; C-SPC (Region) Mode
is_pre_view = 0	; M-s (View) Mode
is_mc_left = 0	; MouseClick
is_mc_right = 0	; MouseClick


; Emacs Keyboard Cond
; -------------------
is_target()
{
	IfWinActive, ahk_class ConsoleWindowClass ; Cygwin
		Return 1 
	IfWinActive, ahk_class MEADOW ; Meadow
		Return 1 
	IfWinActive, ahk_class CDynaApp ; Dyna
		Return 1
	IfWinActive, ahk_class cygwin/x X rl-xterm-XTerm-0
		Return 1
	;; IfWinActive, ahk_class XLMAIN ; Microsoft Excel
	;; 	Return 1
	IfWinActive, ahk_class PP10FrameClass ; PowerPoint
		Return 1
	IfWinActive, ahk_class gdkWindowToplevel ; Inkscape
		Return 1
	IfWinActive, ahk_class Fireworks_MX_MainWindow ; Fireworks
		Return 1
	IfWinActive, ahk_class mintty ; Mintty
		Return 1
;	IfWinActive, ahk_class Chrome_WidgetWin_1 ; Google Chrome
;		Return 1
	IfWinActive, ahk_class Chrome_WidgetWin_0 ; Atom
		Return 1
	IfWinActive, ahk_class GomPlayer1.x
		Return 1
	IfWinActive, xyzzy
		Return 1
	IfWinActive, ahk_class classFoxitReader
		Return 1
	IfWinActive, ahk_class 3B01DD37-FF0E-422c-98AE-5A4AFDAB8930
		Return 1
	IfWinActive, ahk_class OpusApp
		Return 1
	IfWinActive, ahk_class SunAwtFrame
		Return 1
	IfWinActive, Atom
		Return 1
;	IfWinActive,ahk_class Vim ;Windows”«ª”ªµGVIM
;		Return 1
;	IfWinActive,ahk_class Xming X
;		Return 1
;	IfWinActive,ahk_class SunAwtFrame
;		Return 1
;	IfWinActive,ahk_class Emacs ;NTEmacs
;		Return 1  
;	IfWinActive,ahk_class XEmacs ;Cygwin”«ª”ªµXEmacs
;		Return 1
	Return 0
}

 
; Emacs Keybind Function
; ----------------------
delete_char()
{
	Send {Del}
	global is_pre_spc = 0
	Return
}
delete_backward_char()
{
	Send {BS}
	global is_pre_spc = 0
	Return
}
kill_line()
{
	Send {Home}{ShiftDown}{End}{Right}{SHIFTUP}
	Sleep 10 ;[ms]
	Send ^{x}
	global is_pre_spc = 0
	Return
}
open_line()
{
	Send {Home}{Enter}{Up}{Home}
	global is_pre_spc = 0
	Return
}
quit()
{
	Send {ESC}
	global is_pre_spc = 0
	Return
}
newline()
{
	Send {Enter}
	global is_pre_spc = 0
	Return
}
indent_for_tab_command()
{
	Send {Tab}
	global is_pre_spc = 0
	Return
}
newline_and_indent()
{
	Send {Enter}{Tab}
	global is_pre_spc = 0
	Return
}
isearch_forward()
{
	Send ^f
	global is_pre_spc = 0
	Return
}
isearch_backward()
{
	Send ^f
	global is_pre_spc = 0
	Return
}
kill_region()
{
	Send ^x
	global is_pre_spc = 0
	Return
}
kill_ring_save()
{
	Send ^c
	global is_pre_spc = 0
	Return
}
kill_word()
{
	Send +^{Right}
	Sleep 10
	Send ^{x}
	global is_pre_spc = 0
	Return
}
yank()
{
	Send ^v
	global is_pre_spc = 0
	Return
}
undo()
{
	Send ^z
	global is_pre_spc = 0
	Return
}

; ### C-x Mode
find_file()
{
	Send ^o
	global is_pre_x = 0
	Return
}
save_buffer()
{
	Send, ^s
	global is_pre_x = 0
	Return
}
kill_emacs()
{
	Send !{F4}
	global is_pre_x = 0
	Return
}

; ### Move
move_beginning_of_line()
{
	global
	if is_pre_spc
		Send +{HOME}
	Else
		Send {HOME}
	Return
}
move_end_of_line()
{
	global
	if is_pre_spc
		Send +{END}
	Else
		Send {END}
	Return
}
previous_line()
{
	global
	if is_pre_spc
		Send +{Up}
	Else
		Send {Up}
	Return
}
next_line()
{
	global
	if is_pre_spc
		Send +{Down}
	Else
		Send {Down}
	Return
}
forward_char()
{
	global
	if is_pre_spc
		Send +{Right}
	Else
		Send {Right}
	Return
}
backward_char()
{
	global
	if is_pre_spc
		Send +{Left} 
	Else
		Send {Left}
	Return
}
forward_word()
{
	global
	if is_pre_spc
		Send +^{Right}
	Else
		Send ^{Right}
	Return
}
backward_word()
{
	global
	if is_pre_spc
		Send +^{Left}
	Else
		Send ^{Left}
	Return
}
forward_paragraph()
{
	global
	if is_pre_spc
		Send +^{Down}
	Else
		Send ^{Down}
	Return
}
backward_paragraph()
{
	global
	if is_pre_spc
		Send +^{Up}
	Else
		Send ^{Up}
	Return
}
scroll_up()
{
	global
	if is_pre_spc
		Send +{PgUp}
	Else
		Send {PgUp}
	Return
}
scroll_down()
{
	global
	if is_pre_spc
		Send +{PgDn}
	Else
		Send {PgDn}
	Return
}
;; recenter()
;; {
;; 	Return
;; }
beginning_of_buffer()
{
	global
	if is_pre_spc
		Send +^{Home}
	Else
		Send ^{Home}
	Return
}
end_of_buffer()
{
	global
	if is_pre_spc
		Send +^{End}
	Else
		Send ^{End}
	Return
}
beginning_of_defun()
{
	global
	if is_pre_spc
		Send +^{PgUp}
	Else
		Send ^{PgUp}
	Return
}
end_of_defun()
{
	global
	If is_pre_spc
		Send +^{PgDn}
	Else
		Send ^{PgDn}
	Return
}
next_buffer()
{
	global
	If is_pre_spc
	{
		Send {Esc}
		Sleep 10 ;[ms]
		Send ^{Tab}
	}
	Else
		Send ^{Tab}
	Return
}
previous_buffer()
{
	global
	If is_pre_spc
	{
		Send {Esc}
		Sleep 10 ;[ms]
		Send +^{Tab}
	}
	Else
		Send +^{Tab}
	Return
}

; ### Comment and Uncomment
comment()
{
	global
	if is_pre_spc
	{
		clipboard =
		Send ^c
		ClipWait, 1
		if ErrorLevel <> 0
			return
		NewClip =
		WaitingForFirstCharOfLine = y
		AutoTrim, off
		Loop, parse, clipboard
		{
			if WaitingForFirstCharOfLine = y
			{
				if A_LoopField not in %A_Space%,%A_Tab%
				{
					NewClip = %NewClip%`'
					WaitingForFirstCharOfLine = n
				}
			}
			else if A_LoopField = `n
				WaitingForFirstCharOfLine = y
			NewClip = %NewClip%%A_LoopField%
		}
		clipboard = %NewClip%
		Send, ^v
		is_pre_spc = 0
	}
	Return
}
uncomment()
{
	global
	if is_pre_spc
	{
		clipboard =
		Send ^c
		ClipWait, 1
		if ErrorLevel <> 0
			return
		NewClip =
		WaitingForFirstCharOfLine = y
		AutoTrim, off
		Loop, parse, clipboard
		{
			if WaitingForFirstCharOfLine = y
			{
				if A_LoopField not in %A_Space%,%A_Tab%
				{
					if A_LoopField <> `'
						NewClip = %NewClip%%A_LoopField%
					WaitingForFirstCharOfLine = n
				}
				else
					NewClip = %NewClip%%A_LoopField%
			}
			else
			{
				if A_LoopField = `n
					WaitingForFirstCharOfLine = y
				NewClip = %NewClip%%A_LoopField%
			}
		}
		clipboard = %NewClip%
		Send, ^v
		is_pre_spc = 0
	}
	Return
}


; Emacs Keybind Setkey
; --------------------
; ### C-x Mode
^x::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		is_pre_x = 1
	Return 
^f::
	If WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
			find_file()
		Else
			forward_char()
	}
	Return  
^c::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class #32770") WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
		kill_emacs()
	}
	Return  

; ### M-s (View) Mode
!s::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
		{
			is_pre_view = 0
			SetScrollLockState, AlwaysOff
		}
		Else
		{
			is_pre_view = 1
			SetScrollLockState, AlwaysOn
		}
	}
	Return 
j::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			next_line()
		Else
			Send %A_ThisHotkey%
	}
	Return 
k::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			previous_line()
		Else
			Send %A_ThisHotkey%
	}
	Return 
h::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			backward_char()
		Else
			Send %A_ThisHotkey%
	}
	Return 
l::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			forward_char()
		Else
			Send %A_ThisHotkey%
	}
	Return 
u::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			scroll_up()
		Else
			Send %A_ThisHotkey%
	}
	Return 
sc039::
	If is_target()
		Send {SPACE}
	Else
	{
		If is_pre_view
			scroll_down()
		Else
			Send {SPACE}
	}
	Return 
y::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			previous_buffer()
		Else
			Send %A_ThisHotkey%
	}
	Return 
b::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			next_buffer()
		Else
			Send %A_ThisHotkey%
	}
	Return 
p::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			beginning_of_buffer()
		Else
			Send %A_ThisHotkey%
	}
	Return 
n::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_view
			end_of_buffer()
		Else
			Send %A_ThisHotkey%
	}
	Return 

; ### Other
^o::
	If WinActive("ahk_class XLMAIN")
	{
		Send %A_ThisHotkey%
		Sleep 10
	}
	Else If WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		open_line()
	Return
^g::
	If WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		quit()
	Return
^j::
	IfWinActive,ahk_class XLMAIN
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			newline_and_indent()
	}
	Return
^m::
	If is_target()
		Send %A_ThisHotkey%
	Else
		newline()
	Return
^i::
	IfWinActive,ahk_class XLMAIN
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			indent_for_tab_command()
	}
	Return
!`;::
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		IfWinActive ahk_class wndclass_desked_gsk
			comment()
		Else
			Send %A_ThisHotkey%
	}
	Return
+!`;::
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		IfWinActive ahk_class wndclass_desked_gsk
			uncomment()
		Else
			Send %A_ThisHotkey%
	}
	Return

; ### Search
^s::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_x
			save_buffer()
		Else
			isearch_forward()
	}
	Return
^r::
	If WinActive("ahk_class XLMAIN") or is_target()
		Send %A_ThisHotkey%
	Else
		isearch_backward()
	Return

; ### Kill and Yank
^w::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		kill_region()
	Return
!w::
	IfWinActive, ahk_class XLMAIN
		Send %A_ThisHotkey%
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			kill_ring_save()
	}
	Return
^k::
	If WinActive("ahk_class wndclass_desked_gsk")
	{
		Send +{Down}
		Sleep 10
		Send ^x
	}
	Else If WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		kill_line()
	Return
!d::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		kill_word()
	Return
^y::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		yank()
	Return
^/::
	If WinActive("ahk_class XLMAIN") or is_target()
		Send %A_ThisHotkey%
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		Send !xundo{Return}
	Else
		undo()
	Return
!/::
	IfWinActive, ahk_class wndclass_desked_gsk ; VBE
		Send ^{SPACE}
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			Send %A_ThisHotkey%
	}
	Return
^d::
	IfWinActive, ahk_class XLMAIN
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			delete_char()
	}
	Return
^h::
	IfWinActive, ahk_class XLMAIN
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			delete_backward_char()
	}
	Return

; ## C-SPC (Region) Mode
;; $^{Space}::
+^sc039::
	IfWinActive, ahk_class XLMAIN
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Else
	{
		If is_target()
			Send +^{Space}
	}
	Return
^sc039::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send ^{Space}
	Else
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Return
^@::
	If is_target()
		Send %A_ThisHotkey%
	Else
	{
		If is_pre_spc
			is_pre_spc = 0
		Else
			is_pre_spc = 1
	}
	Return

; ### Move
^a::
	If WinActive("ahk_class XLMAIN") or is_target()
	{
		Send %A_ThisHotkey%
		Sleep 10
	}
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		Send %A_ThisHotkey%
	Else
		move_beginning_of_line()
	Return
^e::
	IfWinActive, ahk_class XLMAIN
	{
		Send %A_ThisHotkey%
		Sleep 10
	}
	Else
	{
		If is_target()	
		{
			Send %A_ThisHotkey%
			Sleep 10
		}
		Else
			move_end_of_line()
	}
	Return
^p::
	If is_target()
		Send %A_ThisHotkey%
	Else
		previous_line()
	Return
^n::
	If is_target()
		Send %A_ThisHotkey%
	Else
		next_line()
	Return
^b::
	If is_target()
		Send %A_ThisHotkey%
	Else
		backward_char()
	Return
!f::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		forward_word()
	Return
!b::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		backward_word()
	Return
!n::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		forward_paragraph()
	Return
+!n::
	If WinActive("ahk_class #32770") or WinActive("ahk_class XLMAIN") or is_target()
		Send %A_ThisHotkey%
	Else
		Send +^{PgDn}
	Return
+^n::
	If WinActive("ahk_class #32770") or WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		Send ^{PgDn}
	Return
!p::
	If WinActive("ahk_class #32770") or WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		backward_paragraph()
	Return
+!p::
	If WinActive("ahk_class #32770") or WinActive("ahk_class XLMAIN") or is_target()
		Send %A_ThisHotkey%
	Else
		Send +^{PgUp}
	Return
+^p::
	If WinActive("ahk_class #32770") or WinActive("ahk_class XLMAIN") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		Send ^{PgUp}
	Return
^v::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		scroll_down()
	Return
!v::
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			scroll_up()
	}
	Return
!<::
	If WinActive("ahk_class #32770") or is_target()
		Send %A_ThisHotkey%
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		Send !xbeginning-of-buffer{Return}
	Else
		beginning_of_buffer()
	Return
!>::
	If WinActive("ahk_class #32770") or is_target()
		Send %A_ThisHotkey%
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		Send !xend-of-buffer{Return}
	Else
		end_of_buffer()
	Return
!^a::
	IfWinActive,ahk_class #32770
		Send %A_ThisHotkey%
	Else
	{
		If is_target()
			Send %A_ThisHotkey%
		Else
			beginning_of_defun()
	}
	Return
!^e::
	If WinActive("ahk_class #32770") or WinActive("ahk_class Chrome_WidgetWin_1") or is_target()
		Send %A_ThisHotkey%
	Else
		end_of_defun()
	Return
^!n::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class #32770") or is_target()
		Send %A_ThisHotkey%
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		next_line()
	Else
		next_buffer()
	Return
~^!n Up::
	IfWinActive, ahk_class XLMAIN
	{
		Send {AltDown}{AltUp}
		Sleep 10
		Return
	}
	Return
^!p::
	If WinActive("ahk_class XLMAIN") or WinActive("ahk_class #32770") or is_target()
		Send %A_ThisHotkey%
	Else If WinActive("ahk_class Chrome_WidgetWin_1")
		previous_line()
	Else
		previous_buffer()
	Return
~^!p Up::
	IfWinActive, ahk_class XLMAIN
	{
		Send {AltDown}{AltUp}
		Sleep 10
		Return
	}
	Return
 
; ### System
#k::
	MsgBox, 4,, Kill AutoHotkey?,
	IfMsgBox, Yes
		ExitApp
	Return
~^#r::
~LWin & r::
	Sleep 100
	Reload, "~\AutoHotkey.ahk"
	Return
#t::
	WinSet, AlwaysOnTop, Toggle, A
	Return
~+^#p::
~RWin & +::
	Send {Volume_Up 15}
	Return
~+^#n::
~RWin & -::
~RWin & _::
	Send {Volume_Down 15}
	Return
~+^#m::
~LWin & \::
	Send {Volume_Mute}
	Return

; Enable ahkBox (#32770) AlwaysOnTop
;; #Persistent
;; 	WinHide, ahk_class XLMAIN
;; 	is_pre_ontop = 1
;; 	Return
;; ^F12::
;; 	If is_pre_ontop =
;; 	{
;; 		WinHide, ahk_class XLMAIN
;; 		WinActivate, ahkBox ahk_class #32770
;; 		WinSet, AlwaysOnTop, Toggle, ahkBox ahk_class #32770
;; 		is_pre_ontop = 1
;; 	}
;; 	Else
;; 	{
;; 		WinShow, ahk_class XLMAIN
;; 		WinSet, AlwaysOnTop, Toggle, ahkBox ahk_class #32770
;; 		is_pre_ontop = 
;; 	}
;; 	Return

; #### Disable Taskbar
#Persistent
	WinHide,ahk_class Shell_TrayWnd
	WinHide,Start ahk_class Button
	TaskBarHide = 1
	Return
~+#b::
~RWin & v::
	If TaskBarHide =
	{
		WinHide,ahk_class Shell_TrayWnd
		WinHide,Start ahk_class Button
		TaskBarHide = 1
	}
	Else
	{
		WinShow,ahk_class Shell_TrayWnd
	    WinShow,Start ahk_class Button
	    TaskBarHide =
	}
	Return

; ## Mouse
~+^#<::
~LWin & ,::
sc07B & ,::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseMove, 100, 20, 0
	}
	Else
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseMove, 100, 20, 0
	}
	Return
~+^#>::
~LWin & .::
sc07B & .::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseMove, W-25, H-25, 0
	}
	Else
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseMove, W-50, H-50, 0
	}
	Return
~^#a::
~+^#a::
~LWin & a::
sc07B & a::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, 50, %ypos%, 0
	Return
~^#e::
~+^#e::
~LWin & e::
sc07B & e::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, W-50, %ypos%, 0
	Return
~^#p::
~LWin & p::
sc07B & p::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, %xpos%, 50, 0
	Return
~^#n::
~LWin & n::
sc07B & n::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, %xpos%, H-50, 0
	Return
~+^#l::
~LWin & o::
sc07B & o::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, %xpos%, H/2, 0
	Return
~+^#h::
~LWin & y::
sc07B & y::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, W/2, %ypos%, 0
	Return
~!+^#l::
~LWin & i::
sc07B & i::
	MouseGetPos, xpos, ypos, id
	WinGetPos, X, Y, W, H, ahk_id %id%
	MouseMove, W/2, H/2, 0
	Return
~^#h::
~LWin & h::
sc07B & h::
	MouseMove, -10, 0, 0, R
	Return
+^h::
	IfWinActive, ahk_class CDynaApp
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		Send {ControlDown}{Down}{ControlUp}
		MouseMove, W/2, %ypos%, 0
		Sleep, 25
		MouseClick, left, , , , 0, D, R
		MouseClick, left, 0, %ypos%, , 0, U
	}
	Return
~^#j::
~LWin & j::
sc07B & j::
	MouseMove, 0, 10, 0, R
	Return
~^#k::
~LWin & k::
sc07B & k::
	MouseMove, 0, -10, 0, R
	Return
~^#l::
~LWin & l::
sc07B & l::
	MouseMove, 10, 0, 0, R
	Return
+^l::
	IfWinActive, ahk_class CDynaApp
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		Send {ControlDown}{Down}{ControlUp}
		MouseMove, W/2, %ypos%, 0
		Sleep, 25
		MouseClick, left, , , , 0, D, R
		MouseClick, left, W, %ypos%, , 0, U
	}
	Return
~^#b::
~LWin & b::
sc07B & b::
	MouseMove, -60, 0, 0, R
	Return
~^#f::
~LWin & f::
sc07B & f::
	MouseMove, 60, 0, 0, R
	Return
~^#u::
~LWin & u::
sc07B & u::
	MouseMove, 0, -60, 0, R
	Return
~^#v::
~LWin & v::
sc07B & v::
	MouseMove, 0, 60, 0, R
	Return
~+^#b::
~LWin & g::
sc07B & g::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-50, 50, , 0
		MouseMove, W-70, 215, 0
	}
	Return
sc07B & r::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-110, 50, , 0
		MouseMove, W-150, 150, 0
	}
	Return
sc07B & s::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-160, 50, , 0
		MouseMove, W-160, 130, 0
	}
	Return
sc07B & d::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-180, 50, , 0
		MouseMove, W-200, 130, 0
	}
	Return
sc07B & m::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-210, 50, , 0
		MouseMove, %xpos%, %ypos%, 0
	}
	Return
sc07B & \::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-240, 50, , 0
		MouseMove, W-255, 140, 0
	}
	Return
sc07B & /::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-270, 50, , 0
		MouseMove, W-370, 240, 0
	}
	Return
sc07B & c::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-300, 50, , 0
		MouseMove, %xpos%, %ypos%, 0
	}
	Return
~^#t::
~+^#t::
sc07B & t::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, W-420, 50, , 0
		MouseMove, W-780, 100, 0
	}
	Return
sc07B & x::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, 400, 80, , 0
		MouseMove, 60, 0, 0, R
		MouseClick, WheelDown, , , 22
		MouseClick, left, 0, 170, , 0, , R
		MouseMove, %xpos%, %ypos%, 0
	}
	Return
sc07B & z::
	IfWinActive, ahk_class Chrome_WidgetWin_1
	{
		MouseGetPos, xpos, ypos, id
		WinGetPos, X, Y, W, H, ahk_id %id%
		MouseClick, left, 480, 80, , 0
		MouseMove, %xpos%, %ypos%, 0
	}
	Return
~^#0::
~LWin & -::
sc07B & -::
	IfWinActive, ahk_class Chrome_WidgetWin_1
		MouseMove, x_pos, y_pos, 0
	Return
~+^#0::
~LWin & =::
sc07B & =::
	IfWinActive, ahk_class Chrome_WidgetWin_1
		MouseGetPos, x_pos, y_pos, 0
	Return
~^#;::
~LWin & `;::
sc07B & `;::
	MouseClick, right,,, 1, 0, U
	Return
~^#sc039::
~LWin & sc039::
sc07B & sc039::
	MouseClick, left,,, 1, 0
	Return
~+^#sc039::
~RWin & s::
sc079 & sc039::
	Loop, 50
	{
		Sleep, 50
		GetKeyState, state, LButton, P
		if state = U
		{
			MouseClick, left,,,, 0, D
			break
		}
		Else
		{
			MouseClick, left,,,, 0, U
		}
	}
	Return
~LWin & [::
sc07B & [::
	Send {WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}{WheelUp}
	Return
~LWin & ]::
sc07B & ]::
	Send {WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}{WheelDown}
	Return

; ### Launcher
^#1::
sc070 & 1::
	Send ^!{Numpad1}
	Return
^#2::
sc070 & 2::
	Send ^!{Numpad2}
	Return
^#3::
sc070 & 3::
	Send ^!{Numpad3}
	Return
^#4::
sc070 & 4::
	Send ^!{Numpad4}
	Return
#1::
sc07B & 1::
	SetWorkingDir,%A_ScriptDir%
	Process,Exist,excel.exe
	If ErrorLevel<>0
	{
		GroupAdd, EXCEL, ahk_class XLMAIN
		DetectHiddenWindows, On
		WinShow, ahk_class XLMAIN
		WinShow, ahk_class wndclass_desked_gsk
		;; WinActivate,ahk_pid %ErrorLevel%
		GroupActivate, EXCEL
	}
	Else
	{
		GroupAdd, EXCEL, ahk_class XLMAIN
		Run,"C:\Progra~2\Microsoft Office\Office10\EXCEL.EXE"
		GroupActivate, EXCEL
	}
	Return
#2::
sc07B & 2::
	SetWorkingDir,%A_ScriptDir%
	Process,Exist,excel.exe
	If ErrorLevel<>0
	{
		GroupAdd, EXCEL, ahk_class XLMAIN
		DetectHiddenWindows, On
		WinShow, ahk_class XLMAIN
		WinShow, ahk_class wndclass_desked_gsk
		WinActivate,ahk_class wndclass_desked_gsk
	}
	Else
	{
		Run,"C:\Progra~1\Microsoft Office\Office10\EXCEL.EXE"
		WinActivate,ahk_class wndclass_desked_gsk
	}
	Return
#3::
sc07B & 3::
	Process,Exist,chrome.exe
	If ErrorLevel<>0
	{
		GroupAdd, CHROME, ahk_class Chrome_WidgetWin_1
		;; DetectHiddenWindows, On
		WinShow, ahk_class Chrome_WidgetWin_1
		GroupActivate, CHROME
		;; WinActivate,ahk_pid %ErrorLevel%
		;; WinActivate,ahk_pid Chrome_WidgetWin_1
		;; Send !{Tab}
	}
	Else
	{
		GroupAdd, CHROME, ahk_class Chrome_WidgetWin_1
		;; DetectHiddenWindows, On
		Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
		GroupActivate, CHROME
	}
	Return
#4::
sc07B & 4::
	Process,Exist,FoxitReader.exe
	If ErrorLevel<>0
	{
		DetectHiddenWindows, On
		WinShow, ahk_class classFoxitReader
		;; WinActivate,ahk_pid %ErrorLevel%
		WinActivate,ahk_class classFoxitReader
	}
	Else
	{
		DetectHiddenWindows, On
		Run,"C:\Program Files (x86)\FOXIT SOFTWARE\FOXIT READER\FoxitReader.exe"
	}
	Return
#6::
sc07B & 6::
	Process,Exist,iexplore.exe
	If ErrorLevel<>0
	{
		DetectHiddenWindows, On
		WinShow, ahk_class IEFrame
		WinActivate, ahk_class IEFrame
	}
	Else
	{
		DetectHiddenWindows, On
                Run,"C:\Program Files\Internet Explorer\iexplore.exe"
	}
	Return
#7::
sc07B & 7::
	Process,Exist,dyna.exe
	If ErrorLevel<>0
	{
		DetectHiddenWindows, On
		WinShow, ahk_class CDynaApp
		WinActivate,ahk_pid %ErrorLevel%
	}
	Else
		Run,"C:\cygwin64\home\Nab\bin\dyna214\dynaclient.exe"
	Return
#8::
sc07B & 8::
	Process,Exist,xyzzy.exe
	If ErrorLevel<>0
	{
		DetectHiddenWindows, On
		WinShow, xyzzy
		WinActivate,ahk_pid %ErrorLevel%
	}
	Else
		Run,"C:\cygwin64\home\Nab\bin\xyzzy\xyzzycli.exe"
	Return
;; #9::
;; sc07B & 9::
;; 	Process,Exist,WinSCP.exe
;; 	If ErrorLevel<>0
;; 	{
;; 		;; DetectHiddenWindows, On
;; 		WinShow, layouts
;; 		WinActivate,ahk_pid %ErrorLevel%
;; 	}
;; 	Else
;; 		Run,"C:\cygwin64\home\Nab\bin\winscp\WinSCP.exe"
;; 	Return
#0::
sc07B & 0::
	Process,Exist,mintty.exe
	If ErrorLevel<>0
	{
		DetectHiddenWindows, On
		WinShow, ahk_class mintty
		WinActivate,ahk_pid %ErrorLevel%
	}
	Else
		Run C:\cygwin64\bin\mintty.exe -i '/Cygwin-Terminal.ico' -t Mintty /usr/bin/zsh --login -c 'screen'
	Return

; ### Disable Key
~LWin Up::
~Shift & LWin Up::
~LWin & Shift Up::
^!Right::
^!Left::
^!Up::
^!Down::
#l::
	Return

; ### Change Key
