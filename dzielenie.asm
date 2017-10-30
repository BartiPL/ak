	 ORG 800H  
	 RST 5  
	 MOV A,D  
	 MOV B,E  
	 MVI C,0  
PETLA 	 SUB B  
	 JC KONIEC  
	 INR C  
	 JMP PETLA  
KONIEC 	 MVI A,10  
	 RST 1  
	 MVI A,13  
	 RST 1  
	 MOV A,D  
	 RST 4  
	 MVI A,'/'  
	 RST 1  
	 MOV A,E  
	 RST 4  
	 MVI A,'='  
	 RST 1  
	 MOV A,C  
	 RST 4  
	 HLT  
