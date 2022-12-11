-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 21st September 2022
-- This code does 4 X 1 Multiplexer operations which is constructed using 2 X 1
-- multiplexers.




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity MUX_4X1 is
   port( I0 : in std_logic_vector(3 downto 0);            
         S : in std_logic_vector(1 downto 0);            
         O0 : out std_logic);                            
end MUX_4X1;

architecture STRUCTURE of MUX_4X1 is

signal S_0,S_1 : std_logic;

begin
   
	U0 : MUX_2X1 port map (I0(0), I0(1), S(0), S_0);
	U1 : MUX_2X1 port map (I0(2), I0(3), S(0), S_1);
	U2 : MUX_2X1 port map (S_0, S_1, S(1), O0);
	
end STRUCTURE;