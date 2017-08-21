; ====================================================
; ================= Example of a GUI =================
; ====================================================
; AutoIt version: 3.0.103
; Language:       English
; Author:         "SlimShady"
;
; ----------------------------------------------------------------------------
; Script Start
; ----------------------------------------------------------------------------

#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

#RequireAdmin

Global $Source, $Destination,  $SourceBox, $DestinationBox

_Main()

Func _Main()
	;Initialize variables
	Local $iGUIWidth = 500, $iGUIHeight = 600
	Local $CopyCommandBtn, $idCancel_Btn, $iMsg, $Speed8, $Speed64, $Speed120, $SelectSourceBtn, $SelectDestinationBtn


	;Create window
	GUICreate("RoboCopy for Ease Team @ Honeywell Aero", $iGUIWidth, $iGUIHeight)

	;Create an edit box with no text in it
	GUICtrlCreateLabel("Source Folder",10,30)
	$SourceBox = GUICtrlCreateEdit("", 10, 50, 380, 45)
    GUICtrlSetData($SourceBox, "C:\Users\Public\Pictures\Sample Pictures")

	$SelectSourceBtn = GUICtrlCreateButton("...",410,50,40)


	;Create an edit box with no text in it
    GUICtrlCreateLabel("Destination Folder",10,130); left, top
	$DestinationBox= GUICtrlCreateEdit("", 10, 150, 380, 45)
     GUICtrlSetData($DestinationBox, "C:\Users\h235975\Desktop\LetsC")

	 $SelectDestinationBtn = GUICtrlCreateButton("...",410,150,40)




    GUICtrlCreateLabel("---COPY SPEED---",180,225)

     $Speed8 = GUICtrlCreateRadio("Fast", 30,260, 100)
	 $Speed64 = GUICtrlCreateRadio("Faster", 195,260, 150)
	 $Speed120 = GUICtrlCreateRadio("Fastest", 380,260, 150)

      GUICtrlCreateLabel("Default :    4 Multi-Thread Copy; for slow systems",20,310)
	  GUICtrlCreateLabel("Fast :         8 Multi-Thread Copy; for old  systems",20,330)
	  GUICtrlCreateLabel("Faster :    64 Multi-Thread Copy; for Okay systems",20,350)
	  GUICtrlCreateLabel("Fastest : 120 Multi-Thread Copy; for pro  systems",20,370)

	  GuiCtrlCreateLabel("Utkarsh.Sinha@Honeywell.com",300,570)




	;Create an "OK" button
	$CopyCommandBtn = GUICtrlCreateButton("RoboCopy! ", 185, 420, 150, 120)



	;Show window/Make the window visible
	GUISetState(@SW_SHOW)

	;Loop until:
	;- user presses Esc
	;- user presses Alt+F4
	;- user clicks the close button
	While 1
		;After every loop check if the user clicked something in the GUI window
		$iMsg = GUIGetMsg()

		Select

			;Check if user clicked on the close button
			Case $iMsg = $GUI_EVENT_CLOSE
				;Destroy the GUI including the controls
				GUIDelete()
				;Exit the script
				Exit


			   Case $iMsg = $SelectDestinationBtn
				  SelectDestination()

              Case $iMsg = $SelectSourceBtn
                  SelectSource()





				;Check if user clicked on the "OK" button
			 Case $iMsg = $CopyCommandBtn

				   $Source = GUICtrlRead($SourceBox)
				  $Source = """" & $Source  & """"

				  $Destination = GUICtrlRead($DestinationBox)
	              $Destination = """" & $Destination  & """"

                   If (GUICtrlRead($Speed8) = $GUI_CHECKED) Then
                MsgBox(0,"Command","robocopy " & $Source & " " & $Destination & " *.* /e MT[:8]")
			    ;RunWait(@ComSpec & " /c " & "robocopy " & $Source & " " & $Destination & " *.* /e MT[:8]")
			   EndIf

			   If (GUICtrlRead($Speed64)= $GUI_CHECKED) Then
                MsgBox(0,"Command","robocopy " & $Source & " " & $Destination & " *.* /e MT[:64]")
			    ;RunWait(@ComSpec & " /c " & "robocopy " & $Source & " " & $Destination & " *.* /e MT[:64]")
			   EndIf

		       If ( GUICtrlRead($Speed120) = $GUI_CHECKED ) Then
                MsgBox(0,"Command","robocopy " & $Source & " " & $Destination & " *.* /e MT[:120]")
			    ;RunWait(@ComSpec & " /c " & "robocopy " & $Source & " " & $Destination & " *.* /e MT[:120]")
               EndIf

                If( GUICtrlRead($Speed8) = $GUI_UNCHECKED ) And ( GUICtrlRead($Speed64) = $GUI_UNCHECKED ) And ( GUICtrlRead($Speed120) = $GUI_UNCHECKED ) Then
		         MsgBox(0,"Command","robocopy " & $Source & " " & $Destination & " *.* /e MT[:4]")
			     ;RunWait(@ComSpec & " /c " & "robocopy " & $Source & " " & $Destination & " *.* /e MT[:4]")
				EndIf


		EndSelect

	WEnd
 EndFunc   ;==>_Main


Global $sFileSelectFolder


 Func SelectSource()
    ; Create a constant variable in Local scope of the message to display in FileSelectFolder.
    Local Const $sMessage = "Select the Source Folder"

    ; Display an open dialog to select a file.
    $sFileSelectFolder = FileSelectFolder($sMessage, "")
    If @error Then
        ; "No folder was selected
    Else
        ; Display the selected folder.

		GUICtrlSetData($SourceBox, $sFileSelectFolder )

    EndIf
EndFunc   ;==>Example

Func SelectDestination()
    ; Create a constant variable in Local scope of the message to display in FileSelectFolder.
    Local Const $sMessage = "Select the Destination Folder"

    ; Display an open dialog to select a file.
    $sFileSelectFolder = FileSelectFolder($sMessage, "")
    If @error Then
       ; no folder was selected
    Else
        ; Display the selected folder.
	    GUICtrlSetData($DestinationBox, $sFileSelectFolder )
	EndIf
EndFunc   ;==>Example



