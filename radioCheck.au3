#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
    GUICreate("My GUI radio") ; will create a dialog box that when displayed is centered

    Local $idRadio1 = GUICtrlCreateRadio("Radio 1", 10, 10, 120, 20)
    Local $idRadio2 = GUICtrlCreateRadio("Radio 2", 10, 40, 120, 20)
    GUICtrlSetState($idRadio2, $GUI_CHECKED)

    $CopyCommandBtn = GUICtrlCreateButton("RoboCopy! ", 10, 120, 100, 80)

    GUISetState(@SW_SHOW) ; will display an  dialog box with 1 checkbox

    Local $idMsg
    ; Loop until the user exits.
    While 1
        $idMsg = GUIGetMsg()
        Select
            Case $idMsg = $GUI_EVENT_CLOSE
                ExitLoop

			Case $idMsg = $CopyCommandBtn
				;MsgBox(0,"Command","robocopy  *.* /e MT[:4]")
			    ;RunWait(@ComSpec & " /c " & "robocopy  *.* /e MT[:4]")

				If (GUICtrlRead($idRadio1) = $GUI_CHECKED)    Then
				   MsgBox($MB_SYSTEMMODAL, 'Info:', 'You clicked the Radio 1 and it is Checked.')
				EndIf
				If (((  $idRadio2 And GUICtrlRead($idRadio2), $GUI_CHECKED) = $GUI_CHECKED)) Then
				   MsgBox($MB_SYSTEMMODAL, 'Info:', 'You clicked on Radio 2 and it is Checked.')
				EndIf
				#cs
            Case $idMsg = $CopyCommandBtn And BitAND(GUICtrlRead($idRadio1), $GUI_CHECKED) = $GUI_CHECKED
                MsgBox($MB_SYSTEMMODAL, 'Info:', 'You clicked the Radio 1 and it is Checked.')
            Case $idMsg = $CopyCommandBtn And BitAND(GUICtrlRead($idRadio2), $GUI_CHECKED) = $GUI_CHECKED
                MsgBox($MB_SYSTEMMODAL, 'Info:', 'You clicked on Radio 2 and it is Checked.')
				#ce
        EndSelect
    WEnd
EndFunc   ;==>Example
