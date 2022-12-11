-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 21st September 2022
-- This code does 1 X 2 demultiplexers which is constructed using and and not gates.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity DEMUX_1X2 is
   port( I0, S : in std_logic;          
         O0, O1 : out std_logic );       
end DEMUX_1X2;

architecture STRUCTURE of DEMUX_1X2 is

signal S_0 : std_logic;

begin
   
	U0 : not_1 port map (S, S_0);
	U1 : and_2 port map (I0, S, O0);
	U2 : and_2 port map (I0, S_0, O1);
	
end STRUCTURE;