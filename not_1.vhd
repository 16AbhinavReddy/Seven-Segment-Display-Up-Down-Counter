-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 28th September 2022
-- This code does NOT operations



library IEEE;
use IEEE.std_logic_1164.all;

entity not_1 is 
	port(I0 : in std_logic;
		  O0 : out std_logic);
end entity;

architecture notLogic of not_1 is
begin 
	O0 <= not(I0);
end notLogic;