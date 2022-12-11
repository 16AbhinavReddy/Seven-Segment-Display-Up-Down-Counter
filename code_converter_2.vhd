-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 20th October 2022
-- This code does change 8421 code into XS3 code.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity code_converter_2 is 
	port ( A : in std_logic_vector(3 downto 0);
			 B : out std_logic_vector(3 downto 0));
end code_converter_2;

architecture STRUCTURE of code_converter_2 is

	signal s, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s13, s14 : std_logic;
begin
   U : not_1 port map (A(0), s);
	U0 : not_1 port map (A(0), B(0));
	U1 : not_1 port map (A(1), s0);
	U2 : not_1 port map (A(3), s1);
	U3 : and_2 port map (s1 , A(1), s2);
	U4 : and_2 port map (A(0), s2, s3);
	U5 : and_2 port map (s0 , s, s4);
	U6 : or_2 port map (s4 , s3, B(1));
	U7 : or_2 port map (A(0) , A(1) , s5);
	U8 : and_2 port map (s4, A(2), s6);
	U9 : not_1 port map (A(2), s7);
	U10 : and_2 port map (s1, s7, s8);
	U11 : and_2 port map(A(0), A(3), s9);
	U12 : and_2 port map(s5, s8, s10);
	U13 : or_2 port map (s10, s6, s11);
	U15 : or_2 port map (s9, s11, B(2));
	U16 : and_2 port map (s5, A(2), s13);
	U17 : and_2 port map (A(3), s0, s14);
	U18 : or_2 port map(s14, s13, B(3));
end STRUCTURE;