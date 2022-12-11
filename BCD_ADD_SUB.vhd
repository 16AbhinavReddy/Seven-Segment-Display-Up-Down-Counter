-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 20th October 2022
-- This code does perform Addition/ Subtraction operations.
-- 0 for subtraction and 1 for addition.


library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;



entity BCD_ADD_SUB is                                     
    port(A, B : in std_logic_vector(3 downto 0);          
         A_SBAR : in std_logic;                          
         Y : out std_logic_vector(7 downto 0);            
         INVA : out std_logic;                            
         INVB : out std_logic);                          
end BCD_ADD_SUB;


architecture STRUCTURE of BCD_ADD_SUB is
    
	 signal C, D, E, O1, O2, add, PART_1, PART_2 : std_logic_vector(3 downto 0);
	 signal s, O, s1, s2, s3 : std_logic;
    signal SUM, VAL_BCD : std_logic_vector(4 downto 0);
	 
begin
   
	U5 : code_converter_1 port map (A, C, INVA);
	U6 : code_converter_1 port map (B, D, INVB);
	
	U0 : not_1 port map (A_SBAR, s);
	U1 : xor2 port map (D(3), s, E(3));
	U2 : xor2 port map (D(2), s, E(2));
	U3 : xor2 port map (D(1), s, E(1));
	U4 : xor2 port map (D(0), s, E(0));
	
	U7 : bit4adder port map (C, E, s, SUM);
	
	U8 : not_1 port map (SUM(2), s1);
	U12 : and_2 port map (s1, SUM(1), s2);
	U13 : or_2 port map (s2, SUM(2), s3);
	U14 : and_2 port map (s3, SUM(3), O);
	
	add(0) <= '0' ; add(3) <= '0' ; add(2) <= O ; add(1) <= O;
	
	U9 : bit4adder port map (add, SUM(3 downto 0), '0', VAL_BCD);
	
	PART_1 <= "000" & VAL_BCD(4);
	PART_2 <= VAL_BCD(3 downto 0);
	
	U10 : code_converter_2 port map (PART_1, O1);
	U11 : code_converter_2 port map (PART_2, O2);
	
	Y <= O1 & O2;

end STRUCTURE;