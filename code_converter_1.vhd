-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 20th October 2022
-- This code does change 84-2-1 code into 8421 code.


library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;



entity code_converter_1 is
	port( A : in std_logic_vector(3 downto 0);
		   B : out std_logic_vector(3 downto 0);
			INV : out std_logic);
end code_converter_1;



architecture STRUCTURE of code_converter_1 is

	signal s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12 : std_logic;

begin

	U0 : or_2 port map (A(0), A(1), s0);
	U1 : not_1 port map (s0, s1);
	U2 : and_2 port map (A(3), s1 , s2);
	U3 : and_2 port map (A(2), A(3), s3);
	U4 : or_2 port map (s2, s3, B(3));
	U5 : xor2 port map (A(2), s0, B(2));
	U6 : xor2 port map (A(0), A(1), B(1));
	
	B(0) <= A(0);
	
	U7 : not_1 port map (A(0), s4);
	U8 : not_1 port map (A(1), s5);
	U9 : not_1 port map (A(2), s6);
	U10 : not_1 port map (A(3), s7);
	U11 : or_2 port map (s4, s5, s9);
	U12 : and_2 port map (s6, s7, s10);
	U13 : and_2 port map (s3, s9, s11);
	U14 : and_2 port map (s10, s0, s12);
	U15 : or_2 port map (s11, s12, INV);
	
end STRUCTURE;