-- Author : Abhinav Reddy Gutha
-- Roll No : 2103102
-- Date : 28th september 2022
-- This code is written for 4 - bit adder using 4 full adder gates.




library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity bit4adder is 
	port ( A : in std_logic_vector(3 downto 0);
			 B : in std_logic_vector(3 downto 0);
			 cin : in std_logic;
			 sum : out std_logic_vector(4 downto 0));
end bit4adder;

architecture STRUCTURE of bit4adder is

	signal sig : std_logic_vector(4 downto 0);
begin
	FA_BANK:
			for i in 0 to 3 generate 
				FA0 : fulladder port map (A(i), B(i), sig(i), sum(i), sig(i+1));
			end generate;
			
	sig(0) <= cin;
	sum(4) <= sig(4);
end STRUCTURE;