	
	org 0000h
	sjmp main
	;---��ʾ��ʱ----------
ds1ms: mov r1,#1
ds1lo: mov r2,#200
ds2lo: mov r3,#200
       djnz r3,$
       djnz r2,ds2lo
       djnz r1,ds1lo
       ret ;��ʱ����
	   
;start:	mov r7,#8
main:mov r0,#8           ;һ��ѭ����Ҫ�ƶ�8λ
     mov p1,#01111111b   ;��ʼΪP0.7�Ƶ���
loop: ;clr p2.3
      acall ds1ms         ;��ʱ���Ա����ۿ��Թ۲쵽
      ;setb p2.3
      ;acall ds1ms  
      mov a,p1            ;��P0�ڵ�ǰ��ʾ�������͵�A
      rr a                ;��A�е�����ѭ������1λ
      mov  p1,a            ;�ٽ�A�����ƹ��������͵�P0
      djnz r0,loop
      ;djnz r7,main           ;�ƶ�����8λ������LOOP��ѭ��,
	  sjmp main
	  ajmp $
      end



