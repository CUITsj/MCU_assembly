		org 0000h
		ljmp start
		org 0200h
			
;_______��tab2�е�����װ����30hΪ�׵�ַ���ڴ浥Ԫ_________;
start:	mov dptr,#tab2
		mov r0,#30h
		
main:	movc a,@a+dptr
		mov @r0,a
		clr a
		inc dptr
		inc r0
		cjne @r0,#0f0h,main	;0-fת�����
		
		;dec r0
		;mov @r0,#0
		;inc r0
		;mov @r0,#0
		;inc r0
		;mov @r0,#0
		
		;mov a,r0		;������ݸ���
		;subb a,#8
		;mov b,a		;������ƫ�ƶ�ѡ
		
			
;_______6λ�������ʾ6λ����_________;
		;mov r4,#2fh
;l3:		inc r4
		;mov a,r4
		;cjne a,b,l4
		;mov r4,#30h
;l4:		mov r7,#10		
;l1:		mov r6,#20

;l2:		mov a,r4
		;mov r0,a
		;djnz r6,loop1
		;djnz r7,l1	
		;sjmp l3
		mov r0,#30h
		
;_______6λ�������ʾ6λ����_________;
loop1:	mov r1,#0feh	;λѡ
		mov r2,#8		;��ʾ����λ��
		mov dptr,#tab1
		
loop2:	mov a,@r0
		movc a,@a+dptr	;ȡ����ѡ��	
		mov p0,a		;��ѡ
		mov p2,r1		;λѡ
		lcall delay
		inc r0
		mov a,r1
		rl a
		mov r1,a
		djnz r2,loop2	;��ʾ��һ��8λ��
		sjmp loop1
		
delay:	mov r3,#0
		djnz r3,$
		ret
		
tab1:	db 3fh,06h,5bh,4fh,66h,6dh		;0-f��������ܱ���
		db 7dh,07h,7fh,6fh,77h,7ch
		db 39h,5eh,79h,71h,0h,6dh,1ch,1eh,04h,54h			;0ffh����λ
			
tab2:	db 2h,0h,1h,5h,0h,7h,2h,0h
		db 5h,8h,10h,11h,12h,13h,14h,15h
		db 10h,10h,10h,10h,10h,10h,0f0h	;Ҫ��ʾ��0-f�Ķ������
			
		end