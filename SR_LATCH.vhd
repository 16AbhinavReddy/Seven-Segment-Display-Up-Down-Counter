-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 27th October 2022
-- This code does SR LATCH Operations



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;


entity SR_LATCH is                                       -- Entity declaration
   port( s : in std_logic;                               -- Set input of the SR latch
         r : in std_logic;                               -- Reset input of the SR latch
         Q : buffer std_logic;                           -- Q output of the SR latch
         QN : buffer std_logic);                         -- Q_bar output of the SR latch
end SR_LATCH;


architecture STRUCTURE of SR_LATCH is
 
  signal s0, s1 : std_logic;
  
begin

   u0 : and_2 port map(r, QN, s0);
	u1 : not_1 port map(s0, Q);
	u2 : and_2 port map(s, Q, s1);
	u3 : not_1 port map(s1, QN);
	
end STRUCTURE;