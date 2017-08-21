
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Global $Source
#Region ### START Koda GUI section ### Form=

Local $CopyCommandBtn
$Form1 = GUICreate("My GUI edit",500,600,-1,-1,-1, $WS_EX_ACCEPTFILES)
GUISetOnEvent($GUI_EVENT_DROPPED, "Drag")


$Input1 = GUICtrlCreateEdit("", 8, 24, 241, 21)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)



$CopyCommandBtn = GUICtrlCreateButton("RoboCopy! ", 185, 420, 150, 120)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Func Drag()
   MsgBox(0,"Here","Iwas")
   ConsoleWrite("ID: "&@GUI_DRAGID & " File: "&@GUI_DRAGFILE &" Drop: "&@GUI_DROPID&@CRLF)
   $Source = @GUI_DRAGFILE
EndFunc

While 1
        $iMsg = GUIGetMsg()
        Select
                Case $iMsg =  $GUI_EVENT_CLOSE
                        Exit

					 Case $iMsg = $CopyCommandBtn

						MsgBox(0,"Hello",$Source)

        EndSelect
WEnd