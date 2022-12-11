-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 27th October 2022
-- This code does -ve D - Latch operations



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity D_LATCH_N is                                    -- Entity declaration
    port( d : in std_logic;                          -- Data input of the D latch
          L : in std_logic;                       -- Latch input of the D latch
          Q : buffer std_logic;                      -- Q output of the D latch
          QN : out std_logic);                       -- Q_bar output of the D latch
end D_LATCH_N;


architecture STRUCTURE of D_LATCH_N is


begin
  
   process (d, L)
	begin
	
	   if L = '0' then
	       Q <= d;
		end if;
		
   end process;
	 
	U : not_1 port map (Q, QN);

end STRUCTURE;