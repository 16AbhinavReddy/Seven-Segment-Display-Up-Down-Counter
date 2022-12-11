-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 28th September 2022
-- This code basically does 4 X 4 multiplication of binary numbers using bit 4 adder
-- and and gate.

library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity MULTIPLIER is
    port(A, B : in std_logic_vector(3 downto 0);
	      P : out std_logic_vector(7 downto 0));
end MULTIPLIER;


architecture STRUCTURE of MULTIPLIER is

   signal G0, G1, G2, G3, K : std_logic_vector(3 downto 0);
	signal H0, H1, H2 : std_logic_vector(4 downto 0);

begin
 
   A0 : and_2 port map(A(0), B(0), G0(0));
	A1 : and_2 port map(A(1), B(0), G0(1));
	A2 : and_2 port map(A(2), B(0), G0(2));
	A3 : and_2 port map(A(3), B(0), G0(3));
	
	A4 : and_2 port map(A(0), B(1), G1(0));
	A5 : and_2 port map(A(1), B(1), G1(1));
	A6 : and_2 port map(A(2), B(1), G1(2));
	A7 : and_2 port map(A(3), B(1), G1(3));
	
	K <= ('0', G0(3), G0(2), G0(1));
	
	FBA0 : bit4adder port map(G1, K, '0', H0);
	
	A8 : and_2 port map(A(0), B(2), G2(0));
	A9 : and_2 port map(A(1), B(2), G2(1));
	A10 : and_2 port map(A(2), B(2), G2(2));
	A11 : and_2 port map(A(3), B(2), G2(3));
	
	FBA1 : bit4adder port map(G2, H0(4 downto 1), '0', H1);
	
	A12 : and_2 port map(A(0), B(3), G3(0));
	A13 : and_2 port map(A(1), B(3), G3(1));
	A14 : and_2 port map(A(2), B(3), G3(2));
	A15 : and_2 port map(A(3), B(3), G3(3));
	
	FBA2 : bit4adder port map(G3, H1(4 downto 1), '0', H2);
	
	P <= (H2(4), H2(3), H2(2), H2(1), H2(0), H1(0), H0(0), G0(0));
	
end STRUCTURE;