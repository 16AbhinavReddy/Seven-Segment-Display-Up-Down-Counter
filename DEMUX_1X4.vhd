-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 21st September 2022
-- This code does 1 X 4 demultiplexer operations of a given input which we construct
-- using 1 X 2 demultiplexers.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity DEMUX_1X4 is
   port( I0 : in std_logic;                              
         S : in std_logic_vector(1 downto 0);             
         O0 : out std_logic_vector(3 downto 0));           
end DEMUX_1X4;

architecture STRUCTURE of DEMUX_1X4 is

signal S_0,S_1 : std_logic;

begin
   
	U0 : DEMUX_1X2 port map (I0, S(0), S_0, S_1);
	U1 : DEMUX_1X2 port map (S_0, S(1), O0(0), O0(1));
	U2 : DEMUX_1X2 port map (S_1, S(1), O0(2), O0(3));
	
end STRUCTURE;