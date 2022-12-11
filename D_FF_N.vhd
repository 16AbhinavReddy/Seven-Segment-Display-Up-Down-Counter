-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 27th October 2022
-- This code does -ve D - Flip Flop operations


library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity D_FF_N is                                                  -- Entity declaration
   port( d : in std_logic;                                      -- Data input of the D flipflop
         c : in std_logic;                                    -- Clock input of the D flipflop
         CLRN : in std_logic;                                   -- Active low clear input of the D flipflop
         PREN : in std_logic;                                   -- Active low preset input of the D flipflop
         Q : buffer std_logic;                                  -- Q output of the D flipflop
         QN : out std_logic);                                   -- Q_bar output of the D flipflop
end D_FF_N;


architecture STRUCTURE of D_FF_N is


begin
  
   process (CLRN, PREN, c)
	begin
	   
		if CLRN = '0' then
	       Q <= '0';
			 
		elsif PREN = '0' then
	       Q <= '1';
			 
		elsif c'event and c = '0' then
	       Q <= d;
			 
		end if;	 
			 
	end process;
	
	U : not_1 port map (Q, QN);
	
end STRUCTURE;