ORG 0H	
MOV 70H, #30H
MOV A, 70H
MOV R1, #08H
MOV R2, #00H

LOOP: RRC A
JNC checkpoint
INC R2
checkpoint: DJNZ R1, LOOP
MOV 71H, R2
HERE:SJMP HERE
END
