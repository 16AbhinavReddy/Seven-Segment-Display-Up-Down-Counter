-- Author : Abhinav Reddy Gutha 
-- Roll No. : 2103102
-- Date : 20th October 2022
-- This code does Convert a Binary number to Seven Segment code


library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity SSD is 
   port(X : in std_logic_vector(3 downto 0); 
        Y : out std_logic_vector(6 downto 0); 
        F : out std_logic);
end SSD;


architecture STRUCTURE of SSD is

	signal s : std_logic_vector(29 downto 0);

begin

   U0 : not_1 port map (X(0), s(0));
	U1 : not_1 port map (X(1), s(1));
	U2 : not_1 port map (X(2), s(2));
	U3 : not_1 port map (X(3), s(3));
	U4 : and_2 port map (s(0), s(1), s(4));
	U5 : and_2 port map (X(2), s(4), s(5));
	U6 : or_2 port map (X(2), X(1), s(19));
	U7 : and_2 port map (X(3), s(19), s(20));
	U8 : and_2 port map (s(3), s(2), s(6));
	U9 : and_2 port map (s(1), X(0), s(7));
	U10 : and_2 port map (s(6), s(7), s(8));
	U11 : or_2 port map (s(5), s(8), s(17));
	U12 : or_2 port map (s(17), s(20), s(21));
	
	Y(6) <= s(21);

	U13 : xor2 port map (X(0), X(1), s(9));
	U14 : and_2 port map (X(2), s(9), s(22));
	U15 : or_2 port map (s(22), s(20), Y(5));
	
   U16 : and_2 port map (X(1), s(0), s(10));
	U17 : and_2 port map (s(2), s(10), s(18));
	U18 : or_2 port map (s(20), s(18), s(23));

	Y(4) <= s(23);
	
	U19 : and_2 port map (X(1), X(0), s(11));
	U20 : and_2 port map (X(2), s(11), s(12));
	U21 : or_2 port map (s(17), s(12), s(24));
	U22 : or_2 port map (s(24), s(20), Y(3));
	
	U23 : and_2 port map (X(2), s(1), s(13));
	U24 : or_2 port map (X(0), s(13), s(25));
	U25 : and_2 port map (X(3), X(1), s(26));
	U26 : or_2 port map (s(25), s(26), Y(2));
	
	U27 : and_2 port map (X(0), s(6), s(14));
	U28 : or_2 port map (s(14), s(18), s(15));
	U29 : and_2 port map (s(3), s(11), s(27));
	U30 : or_2 port map (s(27), s(15), s(28));
   U31 : or_2 port map (s(28), s(20), Y(1));
	
	U32 : and_2 port map (s(6), s(1), s(16));
	U33 : or_2 port map (s(12), s(16), s(29));
	U34 : or_2 port map (s(29), s(20), Y(0));
	
	F <= s(20);
	
end STRUCTURE;