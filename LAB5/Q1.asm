ORG 0H
LJMP MAIN
ORG 100H
MAIN:
blinkingLEDs:
MOV P1, #0FH
MOV A, P1
ADD A, #0F0H 
MOV P1, A

MOV A,P1
ANL A,#0FH
MOV R4, A

LOOPblink:
MOV P1, #0FH
ACALL LOOP1S
MOV P1, #0FFH
ACALL LOOP1S
DJNZ R4, LOOPblink

LJMP blinkingLEDs

LOOP1S:

MOV R6,#28H
LOOP: ACALL DELAY
      DJNZ R6,LOOP
      LJMP final
DELAY: MOV TMOD,#001B 
       MOV TH0,#03CH
       MOV TL0,#0B0H 
       SETB TR0 
HERE: JNB TF0,HERE 
      CLR TR0 
      CLR TF0 
      RET  
      final: RET
	  
end