-- Author : Abhinav Reddy Gutha 
-- Roll No. : 2103102
-- Date : 28th September 2022
-- This code does AND operations



library IEEE;
use IEEE.std_logic_1164.all;

entity and_2 is
	port(I0 , I1 : in std_logic;
		  O0 : out std_logic);
end entity;

architecture FUNCTIONALITY of and_2 is
begin
	O0 <= I0 and I1;
end FUNCTIONALITY;