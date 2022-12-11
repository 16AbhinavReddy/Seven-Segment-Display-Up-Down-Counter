-- Author : Abhinav Reddy Gutha
-- Roll No : 2103102
-- Date : 28th september 2022
-- This code is written for half adder gate using xor and or gate.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity halfadder is
	port( I0, I1 : in std_logic;
			O0, O1 : out std_logic);
end entity;

architecture STRUCTURE of halfadder is
	signal S0, S1 : std_logic;
	
begin
	U0 : xor2 port map (I0, I1, O0);
	U1 : and_2 port map (I0, I1, O1);
end STRUCTURE;

