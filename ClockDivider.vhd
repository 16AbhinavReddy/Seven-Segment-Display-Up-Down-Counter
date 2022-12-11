library IEEE;
use IEEE.std_logic_1164.all;
                
entity ClockDivider is
port ( CLK_IN : in std_logic;                                                         
       RSTN : in std_logic; 
       CLK_OUT : out std_logic); 
end entity;
                                      
												  
architecture FUNCTIONALITY of ClockDivider is

signal CNT : integer := 1;
signal TEMP : std_logic := '0';
                                                        
begin

process(CLK_IN, RSTN)

begin
if (RSTN = '0') then
    CNT <= 1;
	 TEMP <= '0';
elsif (CLK_IN'event and CLK_IN = '1') then
	 CNT <= CNT+1;

if (CNT = 150000000) then
	 TEMP <= not TEMP;
	 CNT <= 1;
end if;

end if;

CLK_OUT <= TEMP;
end process;

end architecture;