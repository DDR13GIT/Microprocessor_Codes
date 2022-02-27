DSEG    SEGMENT 'DATA' 
  
      VALUE DB 00000001B,00000001B,00000001B,00000001B,00000001B,00000011B,00000111B,00001111B,00011111B,00111111B,01111111B,
      VALUE1 DB 00000010b,00000001b,00000001b,00000001b,00000010b,00000110b,00001001b,00010001b,00100001b,01000010b,01100001b,01010001b,01001001b,01000110b
      
      PORTADD DW 2000H,2001H,2002H,2003H,2004H,2002H,2002H,2002H,2002H,2002H,2002H,
      PORTADD2 DW 2005H,2006H,2007H,2008H,2009H,2009H,2008H,2007H,2006H,2005H,2006H,2007H,2008H,2009H
DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

START   PROC    FAR
; Store return address to OS:
 	PUSH    DS
 	MOV     AX, 0
 	PUSH    AX

; set segment registers:
	MOV     AX, DSEG
 	MOV     DS, AX
 	MOV     ES, AX
 	
     MOV BX,0
     
     MAINLOOP:
     
        MOV CX,25D
        MOV SI,0
        MOV DI,0
        
        LOOP1:
            MOV DX,PORTADD[SI]
            MOV AL,VALUE[DI]
            OUT DX,AL
            ADD SI,2
            INC DI
            
            MOV DX,CX
            MOV CX,0AH
            L01:LOOP L01
            
            MOV CX,DX
            
       LOOP LOOP1 
       
       
       MOV CX,10D
       MOV DX,2000H
       MOV AL,00000000B
       
       CLEAR:
        OUT DX,AL
        INC DX
        LOOP CLEAR
       
       INC BX
       CMP BX,5
       JB MAINLOOP

; return to operating system:
	RET
START   ENDP

CSEG    ENDS 

        END    START    ; set entry point.

 	