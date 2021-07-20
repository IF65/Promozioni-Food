Case of 
	: (Form event code:C388=On Load:K2:1)
		qQuadrature ("inizializzaRicerca")
		qQuadrature ("inizializzaArray")
		
		  // status(flag)
		  // 0=caricamento dati in attesa di cominciare o in corso
		  // 1=caricamento in corso ma giornata fiscalmente chiusa(dati spostati da idc=>idc_eod su mtx)
		  // 2=giornata fiscalmente chiusa e completamente caricata(è verificato che l'ultimo sequencenumber sia già stato caricato)
		  // 3=negozio non aperto al pubblico.
		  // 
		  // eod(flag)
		  // 0=la giornata è in caricamento o conclusa e il calcolo finale non è ancora stato
		  // 1 = la giornata è conclusa ed è stato fatto il calcolo finale degli importi
		
		
		ARRAY TEXT:C222($status_map;0)
		ARRAY LONGINT:C221($status_display;0)
		APPEND TO ARRAY:C911($status_map;"CARICAMENTO IN CORSO")
		APPEND TO ARRAY:C911($status_display;0)
		APPEND TO ARRAY:C911($status_map;"GIORNATA CONCLUSA")
		APPEND TO ARRAY:C911($status_display;1)
		APPEND TO ARRAY:C911($status_map;"CHIUSURA EFFETTUATA")
		APPEND TO ARRAY:C911($status_display;2)
		APPEND TO ARRAY:C911($status_map;"GIORNATA DI CHIUSURA")
		APPEND TO ARRAY:C911($status_display;3)
		
		ARRAY TEXT:C222($eod_map;0)
		ARRAY LONGINT:C221($eod_display;0)
		APPEND TO ARRAY:C911($eod_map;"GIORNATA APERTA")
		APPEND TO ARRAY:C911($eod_display;0)
		APPEND TO ARRAY:C911($eod_map;"GIORNATA CHIUSA")
		APPEND TO ARRAY:C911($eod_display;1)
		
		ARRAY TEXT:C222(arQ_store;0)
		ARRAY DATE:C224(arQ_ddate;0)
		ARRAY TEXT:C222(arQ_storeDescription;0)
		ARRAY LONGINT:C221(arQ_itemCount;0)
		ARRAY REAL:C219(arQ_totalAmount;0)
		ARRAY LONGINT:C221(arQ_lastSequenceNumber;0)
		ARRAY LONGINT:C221(arQ_status;0)
		ARRAY LONGINT:C221(arQ_eod;0)
		ARRAY TEXT:C222(arQ_ip;0)
		ARRAY TEXT:C222(arQ_created_at;0)
		ARRAY TEXT:C222(arQ_modified_at;0)
		
		utlAlpAreaAddColumn (Self:C308;1;->arQ_store;"Sede";50;0;2;"";0)
		utlAlpAreaAddColumn (Self:C308;2;->arQ_storeDescription;"Descrizione";1;170;1;"";0)
		utlAlpAreaAddColumn (Self:C308;3;->arQ_ddate;"Data";1;70;2;"";0)
		utlAlpAreaAddColumn (Self:C308;4;->arQ_itemCount;"Clienti";1;70;2;"";0)
		utlAlpAreaAddColumn (Self:C308;5;->arQ_totalAmount;"Venduto";1;90;3;<>formatCurrency;0)
		utlAlpAreaAddColumn (Self:C308;6;->arQ_lastSequenceNumber;"Max Seq.";1;80;2;<>formatInteger;0)
		utlAlpAreaAddColumn (Self:C308;7;->arQ_status;"Stato";1;180;1;"";0)
		utlAlpAreaAddColumn (Self:C308;8;->arQ_eod;"Eod";1;150;1;"";0)
		utlAlpAreaAddColumn (Self:C308;9;->arQ_ip;"Ip";1;90;3;"";0)
		utlAlpAreaAddColumn (Self:C308;10;->arQ_created_at;"Creato il";1;120;3;"";0)
		utlAlpAreaAddColumn (Self:C308;11;->arQ_modified_at;"Modificato il";1;120;3;"";0)
		
		utlAlpAreaSetup (Self:C308->)
		
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_ColumnResize;0)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_SelGotoRec;1)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_SelMultiple;1)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_RowHeightFixed;0)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_EntryClick;2)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_NumHdrLines;1)
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_ShowFooters;1)
		  //AL_SetAreaLongProperty (Self->;ALP_Area_ColsLocked;2)
		
		AL_SetColumnLongProperty (Self:C308->;4;ALP_Column_FtrHorAlign;2;1)  //center
		
		AL_SetColumnPtrProperty (Self:C308->;7;ALP_Column_PopupArray;->$status_display;1)
		AL_SetColumnPtrProperty (Self:C308->;7;ALP_Column_PopupMap;->$status_map;1)
		AL_SetColumnLongProperty (Self:C308->;7;ALP_Column_DisplayControl;3;1)
		AL_SetColumnLongProperty (Self:C308->;7;ALP_Column_Enterable;AL Column entry off)
		
		AL_SetColumnPtrProperty (Self:C308->;8;ALP_Column_PopupArray;->$eod_display;1)
		AL_SetColumnPtrProperty (Self:C308->;8;ALP_Column_PopupMap;->$eod_map;1)
		AL_SetColumnLongProperty (Self:C308->;8;ALP_Column_DisplayControl;3;1)
		AL_SetColumnLongProperty (Self:C308->;8;ALP_Column_Enterable;AL Column entry off)
		
		AL_SetAreaLongProperty (Self:C308->;ALP_Area_AutoResizeColumn;2)
		
		qQuadrature ("totali")
		qQuadrature ("aggiornaDisplay")
	: (Form event code:C388=On Plug in Area:K2:16)
		$event:=AL_GetAreaLongProperty (Self:C308->;ALP_Area_AlpEvent)
		Case of 
			: ($event=AL Single Control Click)
				$menu:=""
				$menu:=$menu+"<BPianificazione Invio;"
				$menu:=$menu+"-;"
				$menu:=$menu+"Invio Immediato;"
				$menu:=$menu+"Cancellazione Immediata;"
				$menu:=$menu+"-;"
				$menu:=$menu+"Invio a Laboratorio;"
				$menu:=$menu+"Cancellazione da Laboratorio;"
				
				$result:=Pop up menu:C542($menu)
				Case of 
					: ($result=1)  // pianificazione invio
						
						ARRAY LONGINT:C221($selezione;0)
						$err:=AL_GetObjects (alpPromozioni;ALP_Object_Selection;$selezione)
						If (Size of array:C274($selezione)>0)
							$winRef:=Open form window:C675("utlImpostaDataOraSpedizione";Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4)
							DIALOG:C40("utlImpostaDataOraSpedizione")
							If (ok=1)
								ARRAY OBJECT:C1221(incarichi;0)
								For ($i;1;Size of array:C274($selezione))
									$incarico:=New object:C1471(\
										"codicePromozione";arQ_codice{$selezione{$i}};\
										"lavoroCodice";10;\
										"data";vDataInvio;\
										"ora";String:C10(vOraInvio;HH MM:K7:2)\
										)
									APPEND TO ARRAY:C911(incarichi;$incarico)
								End for 
								pfIncarichi ("creaIncarichi")
							End if 
						Else 
							ALERT:C41("Nessuna promozione selezionata!";"Continua")
						End if 
						
					: ($result=3)
						ARRAY LONGINT:C221($selezione;0)
						$err:=AL_GetObjects (alpPromozioni;ALP_Object_Selection;$selezione)
						If (Size of array:C274($selezione)>0)
							
							ARRAY LONGINT:C221($promozioni;0)
							For ($i;1;Size of array:C274($selezione))
								APPEND TO ARRAY:C911($promozioni;arQ_codice{$selezione{$i}})
							End for 
							$text:=utlElencoSediUsate (->$promozioni)
							$sediUsate:=JSON Parse:C1218($text)
							
							ARRAY OBJECT:C1221(incarichi;0)
							For ($i;1;Size of array:C274($selezione))
								If (OB Is defined:C1231($sediUsate;String:C10(arQ_codice{$selezione{$i}})))
									ARRAY TEXT:C222($codiciSediUsate;0)
									OB GET ARRAY:C1229($sediUsate;String:C10(arQ_codice{$selezione{$i}});$codiciSediUsate)
									For ($j;1;Size of array:C274($codiciSediUsate))
										$incarico:=New object:C1471(\
											"codicePromozione";arQ_codice{$selezione{$i}};\
											"codiceSede";$codiciSediUsate{$j};\
											"codiceLavoro";10\
											)
										APPEND TO ARRAY:C911(incarichi;$incarico)
									End for 
								End if 
							End for 
							pfIncarichi ("creaIncarichi")
						End if 
						
					: ($result=4)
						ARRAY LONGINT:C221($selezione;0)
						$err:=AL_GetObjects (alpPromozioni;ALP_Object_Selection;$selezione)
						If (Size of array:C274($selezione)>0)
							ARRAY OBJECT:C1221(incarichi;0)
							For ($i;1;Size of array:C274($selezione))
								$incarico:=New object:C1471(\
									"codicePromozione";arQ_codice{$selezione{$i}};\
									"lavoroCodice";20;\
									"data";Current date:C33;\
									"ora";String:C10(Current time:C178;HH MM:K7:2)\
									)
								APPEND TO ARRAY:C911(incarichi;$incarico)
							End for 
							pfIncarichi ("creaIncarichi")
						End if 
						
					: ($result=6)
						utlInvioLaboratorio ("invio")
					: ($result=7)
						utlInvioLaboratorio ("cancellazione")
				End case 
				
			: ($event=AL Empty Area Single click)
				qQuadrature ("totali")
			: ($event=AL Single click event)
				qQuadrature ("totali")
			: ($event=AL Double click event)
				  //promozioneSelezionata:=AL_GetAreaLongProperty (alpPromozioni;ALP_Area_SelRow)
				qQuadratureModifica 
				
				
			: ($event=AL Empty Area Double click)
				  // idle
		End case 
End case 