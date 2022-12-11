-- Author : Abhinav Reddy Gutha 
-- Roll No. : 2103102
-- Date : 22th November 2022
-- This code does count from 0 to 9 and from 9 to 0 in a synchronus fashion.



library IEEE;
use IEEE.std_logic_1164.all;
use work.cs210.all;

entity Sync_Counter is                                          -- Entity declaration
	port(CLK : in std_logic;                                        -- Clock input of the counter
		RSTN : in std_logic;                                         -- Active low reset input of the counter
		UP_DN : in std_logic;                                        -- Count up if UP_DN is high, down if low
		LDN : in std_logic;                                          -- Load D to the counter if LDN is low
		E : in std_logic;                                            -- Count if E is high, retain otherwise
		D : in std_logic_vector(3 downto 0);                         -- Count to load when LDN is low
		Q : inout std_logic_vector(3 downto 0));                     -- Output state of the counter
end Sync_Counter;

architecture FUNCTIONALITY of Sync_Counter is
signal CLK_OUT,RSTN1,RSTN2: std_logic;
signal R: std_logic_vector(3 downto 0);
signal QN: std_logic_vector(3 downto 0);
signal S: std_logic_vector(28 downto 0);
begin

	
 U5 : MUX_2X1 port map('1','0',UP_DN,R(0));
 U6 : MUX_2X1 port map('1','0',UP_DN,R(3));
 R(2)<='0';
 R(1)<='0';
 
 S(27)<= NOT(Q(0) AND Q(3) AND (NOT Q(2)) AND (NOT Q(1))); 
 S(28)<= NOT((not(Q(0))) AND (not(Q(1))) AND (not(Q(2))) AND (not(Q(3))));
 
 U7 : MUX_2X1 port map(S(28),S(27),UP_DN,RSTN1);
 
 RSTN2<= RSTN AND RSTN1;

  S(0)<=E;
  
--  U : ClockDivider port map(CLK, '1', CLK_OUT);
	
  UNIT_BANK:
  
  for i in 0 to 3 generate
  
   U1: xor2 port map(S(6*i), Q(i), S(6*i+1));
	U2: MUX_2X1 port map(D(i), S(6*i+1), LDN, S(6*i+2));
	U3: MUX_2X1 port map(R(i), S(6*i+2), RSTN2, S(6*i+3));
	U4: D_FF port map(S(6*i+3), CLK, '1', '1', S(6*i+4), QN(i));
	
	U5: MUX_2X1 port map(QN(i), S(6*i+4), UP_DN, S(6*i+5));
	U6: and_2 port map(S(6*i+5),S(6*i), S(6*i+6));

  end generate;
	
Q(0)<=S(4);
Q(1)<=S(10);
Q(2)<=S(16);
Q(3)<=S(22);
end functionality;
