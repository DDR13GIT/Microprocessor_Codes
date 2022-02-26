DSEG    SEGMENT 'DATA'
   MAINLOOP DB 0 
   Count DB 0 
   Count2 DB 0
   VALUE DB  7FH,7FH,08H,08H,08H,7FH,31H,49H,49H,49H ,46H,7FH,02H,04H,02H,7FH,00H,41H,7FH,41H,00H,3EH,41H,41H,41H ,7FH, 3EH,41H,41H,41H,7FH,7FH ,02H,04H,02H,7FH,7FH,02H,04H,02H
   INDEX DW  2027H,2026H,2025H,2024H,2023H,2022H,2021H,2020H,201FH,201EH,201DH,201CH,201BH,201AH,2019H,2018H,2017H,2016H,2015H ,2014H ,2013H,2012H,2011H,2010H,200FH,200EH,200DH,200CH,200BH,200AH,2009H,2008H,2007H,2006H,2005H,2004H,2003H,2002H,2001H,2000H 
   DOTM  DB  40H,60H,70H,78H,7CH,7EH,7FH,02H,04H,02H,01H,03H,07H,0FH,1FH,3FH,7FH 
   DOTD  DB  40H,60H,70H,78H,7CH,7EH,7FH,01H,01H,01H,02H,06H,0EH,1EH,3EH,41H,41H,41H
   DOTS  DB  01H,01H,01H,01H,02H,06H,09H,09H,09H,11H,31H,49H,49H,49H,46H
   DOTH  DB  40H,60H,70H,78H,7CH,7EH,7FH,08H,08H,08H,08H,18H,38H,78H,7CH,7EH,7FH  
   DOTI  DB  01H,01H,01H,03H,07H,0FH,1FH,3FH,7FH,41H,7FH,41H
   SEVEN5 DB 01H,01H,21H,21H,61H,65H,6DH,6DH
   SEVEN8 DB 01H,03H,07H,0FH,1FH,3FH,7FH,7FH
   SEVEN6 DB 01H,01H,01H,21H,21H,31H,31H,39H,39H,3DH,7DH,7DH 
   SEVEN0 DB 01H,01H,01H,03H,03H,03H,07H,07H,07H,0FH,0FH,0FH,1FH,1FH,3FH,3FH
   SEVEN7 DB 00H,00H,01H,01H,03H,03H,03H,07H,07H   
   SEVEN4 DB 02H,02H,02H,06H,06H,06H,26H,26H,66H,66H
  
    A dw 0  
    B dw 0 
    C dw 0
    D dw 0 
    T dw 0
DSEG    ENDS

SSEG    SEGMENT STACK   'STACK'
        DW      100h    DUP(?)
SSEG    ENDS

CSEG    SEGMENT 'CODE'

;*******************************************

START   PROC    FAR

; Store return address to OS:
    PUSH    DS
    MOV     AX, 0
    PUSH    AX

; set segment registers:
	MOV     AX, DSEG
    MOV     DS, AX
    MOV     ES, AX 
    
    MOV SI,0
    MOV DI,0
    MOV CX,7  
    ;DOT M START         
  	R1:
    MOV DX, 2000H
    MOV AL, DOTM[SI]
	OUT DX, AL
	INC SI
    LOOP R1 

    MOV CX,1
     
    R2:
    MOV DX, 2001H
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
    LOOP R2  
       MOV CX,1
   
    R3:
    MOV DX, 2002H
    MOV AL, DOTM[SI]
    OUT DX, AL 
    MOV DX,2030H
    MOV AL, SEVEN5[DI]
    OUT DX, AL
    INC DI  
	INC SI
    LOOP R3 
       MOV CX,1
      
    R4:
    MOV DX, 2003H
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
    LOOP R4 

    MOV CX,7
     
    R5:
    MOV DX, 2004H
    MOV AL, DOTM[SI]
    OUT DX, AL  
    INC SI
    MOV DX, 2030H
    MOV AL, SEVEN5[DI]
    OUT DX, AL
    INC DI     
    LOOP R5 
	;DOT M DONE 
	MOV DX, 2070H
    MOV AL, 01H
	OUT DX, AL 
	
	
	MOV CX,0FH  
 LED1:LOOP LED1
 
 
   
    MOV SI,0
    MOV DI,0
    MOV CX,7  
    ;DOT M START         
  	R11:
    MOV DX, 2005H
    MOV AL, DOTM[SI]
	OUT DX, AL 
	MOV DX, 2031H
    MOV AL, SEVEN8[DI]
    OUT DX, AL
    INC DI 	
	INC SI
    LOOP R11 

    MOV CX,1
    
    R12:
    MOV DX, 2006H
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
    LOOP R12  
       MOV CX,1
     
    R13:
    MOV DX, 2007H
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
    LOOP R13 
       MOV CX,1
     
    R14:
    MOV DX, 2008H
    MOV AL, DOTM[SI]
    OUT DX, AL 
    MOV DX, 2031H
      MOV AL, SEVEN8[DI]
    OUT DX, AL
    INC DI 
	INC SI
    LOOP R14 
    
   
    
    
    MOV CX,7  
    R15:
    MOV DX, 2009H
    MOV AL, DOTM[SI]
    OUT DX, AL    
	INC SI
    LOOP R15 
	;DOT M DONE 
	
    
 
    MOV CX,0FH  
    LED2:LOOP LED2
   
   ;DOT D START  
    MOV SI,0 
    MOV DI,0
    MOV CX,7
    M4:
    MOV DX, 200AH
    MOV AL, DOTD[SI]
	OUT DX, AL
	MOV DX, 2032H
    MOV AL, SEVEN6[DI]
	OUT DX, AL
	INC DI
	INC SI
    LOOP M4 

 
    MOV CX,1


 M21:
    MOV DX, 200BH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI  
    LOOP M21 
    
        MOV CX,1


 M22:
    MOV DX, 200CH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
	INC T
    LOOP M22 
    
    
        MOV CX,1


 M23:
    MOV DX, 200DH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M23    
   
	
	MOV CX,5
	M5:
    MOV DX, 200EH
    MOV AL, DOTD[SI]
	OUT DX, AL
	MOV DX, 2032H
    MOV AL, SEVEN6[DI]
    OUT DX, AL
	INC SI 
	INC DI
    LOOP M5  
    
    
      MOV CX,1


 M31:
    MOV DX, 200DH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
	INC DI
    LOOP M31 
    
        MOV CX,1


 M32:
    MOV DX, 200CH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M32 
    
    
        MOV CX,1


 M33:
    MOV DX, 200BH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M33 
    
    ;DOT D DONE 
    
    MOV DX, 2070H
    MOV AL, 09H
	OUT DX, AL 
     
        
        
         ;DOT D START  
    MOV SI,0 
    MOV DI,0
    MOV CX,7
    M44:
    MOV DX, 200FH
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M44 

 
    MOV CX,1


 M221:
    MOV DX, 2010H
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
	MOV DX, 2033H
    MOV AL, SEVEN5[DI]
	OUT DX, AL
	INC DI
    LOOP M221 
    
        MOV CX,1


 M222:
    MOV DX, 2011H
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI
	MOV DX, 2033H
    MOV AL, SEVEN5[DI]
	OUT DX, AL
	INC DI 
    LOOP M222 
    
    
        MOV CX,1
    

 M223:
    MOV DX, 2012H
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M223    
   
	
	MOV CX,5
	M55:
    MOV DX, 2013H
    MOV AL, DOTD[SI]
	OUT DX, AL 
	MOV DX, 2033H
    MOV AL, SEVEN5[DI]
	OUT DX, AL
	INC DI
	INC SI
    LOOP M55  
    
    
      MOV CX,1
  

 M331:
    MOV DX, 2012H
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
	MOV DX, 2033H
    MOV AL, SEVEN5[DI]
	OUT DX, AL
	INC DI
    LOOP M331 
    
        MOV CX,1
  

 M332:
    MOV DX, 2011H
    MOV AL, DOTD[SI]
	OUT DX, AL 
	INC SI 
    LOOP M332 
    
    
        MOV CX,1
  

 M333:
    MOV DX, 2010H
    MOV AL, DOTD[SI]
	OUT DX, AL
	INC SI 
    LOOP M333 
    
    ;DOT D2 DONE
     

   
   
    
  	MOV CX,0FH  
    LED5:LOOP LED5 
    
    
    
    
      ;DOT I START  
    MOV SI,0
    MOV DI,0
    MOV CX,3 
    MOV T,2015H 
    MOV DI,0    
    I1:
    MOV DX, T
    MOV AL, DOTI[SI]
	OUT DX, AL 		
	INC SI 
	INC T
    LOOP I1  
    
   
    
    MOV CX,6
	I2:
    MOV DX, 2016H
    MOV AL, DOTI[SI]
	OUT DX, AL		
	INC SI 
	MOV DX, 2034H
    MOV AL, SEVEN7[DI]
	OUT DX, AL   
	INC DI
    LOOP I2  
 
    MOV CX,3 
    MOV T,2015H
    I3:
    MOV DX, T
    MOV AL, DOTI[SI]
	OUT DX, AL		
	INC SI 
	MOV DX, 2034H
    MOV AL, SEVEN7[DI]
	OUT DX, AL   
	INC DI 
	INC T
    LOOP I3  
   ;DOT I DONE
   MOV DX, 2070H
    MOV AL, 0BH
	OUT DX, AL   
   

   
     ;DOT M START
     MOV SI,0 
     MOV DI,0
     MOV CX,7         
  	RT1:
    MOV DX, 2019H
    MOV AL, DOTM[SI]
	OUT DX, AL	
	INC SI  
	MOV DX, 2035H
    MOV AL, SEVEN0[DI]
	OUT DX, AL  
	INC DI
    LOOP RT1 

    MOV CX,1
     
    RT2:
    MOV DX, 201AH
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI 
	MOV DX, 2035H
    MOV AL, SEVEN0[DI]
	OUT DX, AL  
	INC DI
    LOOP RT2  
       MOV CX,1
   
    RT3:
    MOV DX, 201BH
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
    LOOP RT3 
       MOV CX,1
      
    RT4:
    MOV DX, 201CH
    MOV AL, DOTM[SI]
    OUT DX, AL 
	INC SI
	MOV DX, 2035H
    MOV AL, SEVEN0[DI]
	OUT DX, AL  
	INC DI
    LOOP RT4 

    MOV CX,7
     
    RT5:
    MOV DX, 201DH
    MOV AL, DOTM[SI]
    OUT DX, AL   
	INC SI 
	MOV DX, 2035H
    MOV AL, SEVEN0[DI]
	OUT DX, AL  
	INC DI
    LOOP RT5 
	;DOT M DONE 
	
	
 
 
   ;DOT S START 
   MOV SI,0
   MOV DI,0
   MOV CX,1        
  	S1:
    MOV DX, 2022H
    MOV AL, DOTS[SI]
	OUT DX, AL
	INC SI 
    LOOP S1 

    MOV CX,1
     
    S2:
    MOV DX, 2021H
    MOV AL, DOTS[SI]
    OUT DX, AL 
	INC SI
    LOOP S2  
       MOV CX,1       
       
      
    S3:
    MOV DX, 2020H
    MOV AL, DOTS[SI]
    OUT DX, AL 
	INC SI
    LOOP S3  
     
        MOV CX,1
     
    S4:
    MOV DX, 201FH
    MOV AL, DOTS[SI]
    OUT DX, AL 
	INC SI
    LOOP S4  
       MOV CX,2
   
    S5:
    MOV DX, 201EH
    MOV AL, DOTS[SI]
    OUT DX, AL 
	INC SI
    LOOP S5
    
    MOV CX,3 
    MOV T,201FH
    S6:
    MOV DX, T
    MOV AL, DOTS[SI]
	OUT DX, AL	
	INC SI
	MOV DX, 2036H
    MOV AL, SEVEN7[DI]
	OUT DX, AL     
	INC DI 
	INC T
    LOOP S6   
    
     MOV CX,2
   
    S7:
    MOV DX, 2022H
    MOV AL, DOTS[SI]
    OUT DX, AL 
    MOV DX, 2036H
    MOV AL, SEVEN7[DI]
	OUT DX, AL  
	INC DI
	INC SI
    LOOP S7 
    
     MOV CX,4 
    MOV T,2021H
    S8:
    MOV DX, T
    MOV AL, DOTS[SI]
	OUT DX, AL	
	INC SI 
	MOV DX, 2036H
    MOV AL, SEVEN7[DI]
	OUT DX, AL    
	INC DI 
	DEC T
    LOOP S8 
    
      MOV DX, 2070H
    MOV AL, 0BH
	OUT DX, AL    
      	
 ; DOT MATRIX H START
    MOV DI,0
    MOV SI,0
    MOV CX,7
    H1:
    MOV DX, 2023H
    MOV AL, DOTH[SI]
	OUT DX, AL 
	INC SI
    LOOP H1 
    MOV CX,3
    MOV T,2024H 
 H2:
    MOV DX, T
    MOV AL, DOTH[SI]
	OUT DX, AL
	INC SI
	MOV DX, 2037H
    MOV AL, SEVEN4[DI]
	OUT DX, AL  
	INC DI 
	INC T
    LOOP H2 
         
   
   
	
	MOV CX,7
	H3:
    MOV DX, 2027H
    MOV AL, DOTH[SI]
    OUT DX, AL 
	INC SI 
	MOV DX, 2037H
    MOV AL, SEVEN4[DI]
	OUT DX, AL  
	INC DI
    LOOP H3  
   	  
    ;DOT H DONE 
     
      
    MOV DI,0
    MOV SI,0
    
 CODE:
	
	MOV CX, 40d 
    MOV SI, 0 
    MOV DI,0
    MOV DX, 2070H	 
    MOV Al, 0BH 
    OUT DX, AL
    MOV DX, 2030h	 
    MOV Al, 6DH 
    OUT DX, AL
    MOV DX, 2031h	 
    MOV Al, 7FH 
    OUT DX, AL
    MOV DX, 2032h	 
    MOV Al, 7DH 
    OUT DX, AL 
    MOV DX, 2033h	 
    MOV Al, 6DH 
    OUT DX, AL
    MOV DX, 2034h	 
    MOV Al, 07H 
    OUT DX, AL  
    MOV DX, 2035h	 
    MOV Al, 3FH 
    OUT DX, AL 
    MOV DX, 2036h	 
    MOV Al, 07H 
    OUT DX, AL
    MOV DX, 2037h	 
    MOV Al, 66H 
    OUT DX, AL           
    MOV CX,0FFH 
    L0: LOOP L0  
ONE:
     Mov B,Dx
     CMP Count,1
     JE INL00P2     
L00P1: 
    MOV DX, INDEX[SI]
    
    CMP Count,0
    JE Zero
    
  INL00P:  
    MOV AL, VALUE[DI]
	OUT DX, AL
	Mov C,Dx 
    ADD SI,2
    INC DI 
    CMP Count,1
    JE ONE 
 INL00P2:     
    INC Count
    
    CMP Count,40
    JE INITIAL
    
  LOOP L00P1  
Zero:
     Mov A,Dx
    
     CMP Count,40
     JB INL00P
INITIAL:
   
    MOV CX,0FFH 
    L02: LOOP L02 

    JMP SETINDEX 
Change:   
    MOV DI,0
    MOV SI,0
    MOV CX, 40d 
    MOV Count,0 
    INC Count2
    CMP Count2,40
    JB L00P1



    MOV DX, 2070H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2030H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2031H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2032H	 
    MOV Al, 00H 
    OUT DX, AL 
    MOV DX, 2033H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2034H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2035H	 
    MOV Al, 00H 
    OUT DX, AL                              
    MOV DX, 2036H	 
    MOV Al, 00H 
    OUT DX, AL
    MOV DX, 2037H	 
    MOV Al, 00H 
    OUT DX, AL    
    INC MAINLOOP
    MOV Count,0
    MOV Count2,0 
    MOV CX,0FFH
    L9: LOOP L9    
    CMP MAINLOOP,5
    JB CODE
    JMP DOT    

SETINDEX:
    Mov AX,A
    MOV WORD PTR INDEX[SI],AX
    MOV SI,0
    MOV DI,2 
    Mov AX,B
    MOV WORD PTR INDEX[SI],AX
    MOV D,0d
      Lo1: 
       Mov AX,INDEX[DI]
       MOV WORD PTR INDEX[SI],AX 
       ADD SI,2
       ADD DI,2
       INC D
       CMP D,40d
       JB Lo1
   CMP Count2,40
    JB Change
DOT:    
    MOV CX, 40d
    MOV DX, 2000H  
    MOV AL, 00H
CLEARDOT:
    
    OUT DX, AL
    INC DX

    LOOP CLEARDOT    	
    RET
    
START   ENDP

;*******************************************

CSEG    ENDS 

        END    START    ; set entry point