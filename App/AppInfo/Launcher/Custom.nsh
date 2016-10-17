${SegmentFile}

${SegmentPrePrimary}
	;Check for BOM
	${If} ${FileExists} "$EXEDIR\Data\cintanotes.settings"
		ClearErrors
		FileOpen $0 "$EXEDIR\Data\cintanotes.settings" r
		${IfNot} ${Errors}
			FileReadByte $0 $1
			FileReadByte $0 $2
			FileClose $0
			
			${IfNot} $1 == "255"
			${AndIfNot} $2 == "254"
				ClearErrors
				FileOpen $0 "$EXEDIR\Data\cintanotes.settings" a
				${IfNot} ${Errors}
					FileSeek $0 0
					FileWriteByte $0 "255"
					FileWriteByte $0 "254"
					FileClose $0
				${EndIf}
			${EndIf}
		${EndIf}
	${EndIf}
!macroend
