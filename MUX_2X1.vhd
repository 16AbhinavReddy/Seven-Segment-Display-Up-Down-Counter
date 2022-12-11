-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 21st September 2022
-- This code does 2 X 1 Multiplexer operations which is constructed using and, or and
-- not gates.




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity MUX_2X1 is
   port( I0, I1, S : in std_logic;         
         O0 : out std_logic );             
end MUX_2X1;

architecture STRUCTURE of MUX_2X1 is

signal S_0,S_1,S_2 : std_logic;

begin
   
	U0 : not_1 port map (S, S_0);
	U1 : and_2 port map (I1, S, S_1);
	U2 : and_2 port map (I0, S_0, S_2);
	U3 : or_2 port map (S_1, S_2, O0);
	
end STRUCTURE;