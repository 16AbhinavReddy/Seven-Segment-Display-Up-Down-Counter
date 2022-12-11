-- Author : Abhinav Reddy Gutha 
-- Roll No. : 2103102
-- Date : 28th September 2022
-- This code does OR operations



library IEEE;
use IEEE.std_logic_1164.all;

entity or_2 is 
	port(I0 , I1 : in std_logic;
		  O0 : out std_logic);
end entity;

architecture FUNCTIONALITY of or_2 is 
begin 
	O0 <= I0 or I1 ;
end FUNCTIONALITY;