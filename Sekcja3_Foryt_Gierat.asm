	 ORG 800H  
WYBOR  
	 LXI H,MENU  
	 RST 3  
	 RST 2  
	 CPI '1'  
	 CZ PROCEDURA_1  
	 CPI '2'  
	 CZ PROCEDURA_2  
	 JMP WYBOR  
PROCEDURA_1  
	 MVI H,0  
	 MVI L,0  
	 LXI H,MNOZNA  
	 RST 3  
	 RST 5  
	 MOV B,D  
	 MOV C,E  
	 LXI H,MNOZNIK  
	 RST 3  
	 RST 5  
	 MVI H,0  
	 MVI L,0  
PETLA 	 DAD D  
	 DCX B  
	 MOV A,B  
	 CPI 0  
	 JNZ PETLA  
	 MOV A,C  
	 CPI 0  
	 JNZ PETLA  
	 JMP KONIEC  
	 HLT  
PROCEDURA_2  
	 LXI H,DZIELNA  
	 RST 3  
	 RST 5  
	 MOV B,D  
	 MOV C,E  
	 LXI H,DZIELNIK  
	 RST 3  
	 RST 5  
	 MVI H,0  
	 MVI L,0  
PETLA1  
	 MOV A,C  
	 SBB E  
	 MOV C,A  
	 MOV A,B  
	 SBB D  
	 MOV B,A  
	 JC KONIEC  
	 INX H  
	 JMP PETLA1  
KONIEC  
	 MOV B,H  
	 MOV C,L  
	 LXI H,WYNIK  
	 RST 3  
	 MOV A,B  
	 RST 4  
	 MOV A,C  
	 RST 4  
	 HLT  
MENU 	 DB 10,13,'WPISZ 1 ABY MNOZYC LUB 2 ABY DZIELIC > ','@'         
ENTER 	 DB 10,13,'','@'              
DZIELNIK 	 DB 10,13,'DZIELNA WYNOSI:  ','@'             
DZIELNA 	 DB 10,13,'DZIELNIK WYNOSI: ','@'     
MNOZNA 	 DB 10,13,'MNOZNA WYNOSI:  ','@'     
MNOZNIK 	 DB 10,13,'MNOZNIK WYNOSI:  ','@'        
WYNIK 	 DB 10,13,'WYNIK WYNOSI: ','@'   
