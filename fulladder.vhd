-- Author : Abhinav Reddy Gutha
-- Roll No : 2103102
-- Date : 28th september 2022
-- This code is written for full adder gate using halfadder and or gate.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity fulladder is 
	port(I0 , I1 , I2 : in std_logic;
	     O0 , O1 : out std_logic);
end entity;


architecture STRUCTURE of fulladder is
	signal S0, S1, S2 : std_logic;
begin
	U0 : halfadder port map (I1, I2, S0, S1);
	U1 : halfadder port map (I0, S0, O0, S2);
	U2 : or_2 port map (S2, S1, O1);
end STRUCTURE;