		org 0000h
		ajmp main
		org 0033h
			
tab:	db 3fh,06h,5bh,4fh,66h,6dh
		db 7dh,07h,7fh,6fh
			
main:	mov r0,#0fh	;row->p2.0-p2.3
		mov r1,#0f0h ;col->p2.4-p2.7
		mov dptr,#tab
		
l1:		mov p2,r0
		mov a,p2
		cjne a,#0fh,xd
		sjmp l1
xd:		acall delay
		mov a,p2
		cjne a,#0fh,down
		sjmp l1
		
		
down:	mov r3,p2 ;��¼���µ��е�4λ
		mov p2,r1
		mov	r4,p2 ;j��¼���µ��и�4λ
		mov a,r3
		orl a,#11110000b
		anl a,r4
		mov r5,a  ;�õ�������
		
		cjne r5,#00000000b,next1
		ajmp key0
next1:	cjne r5,#11100111b,l1
		ajmp key1
		

delay:	mov r7,#10
del:	mov r6,#50
		djnz r6,$
		djnz r7,del
		ret
		
key0:	mov a,#0h
		movc a,@a+dptr
		mov p1,#0ffh		;��Ӱ
		mov p0,a		;��ѡ
		mov p1,#0fh		;λѡ
		ajmp l1
		
key1:	mov a,#1h
		movc a,@a+dptr
		mov p1,#0ffh		;��Ӱ
		mov p0,a		;��ѡ
		mov p1,#0fh		;λѡ
		ajmp l1
		
		end