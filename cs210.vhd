-- Author : Abhinav Reddy Gutha 
-- Roll No : 2103102
-- Date : 28th september September 2022
-- This code basically creates a package which can access all gates which we have 
-- created in this project.



library IEEE;
use IEEE.std_logic_1164.all;

package cs210 is 

component and_2 is 
	port( I0 , I1 : in std_logic;
			O0 : out std_logic);
end component;

component or_2 is 
	port( I0 , I1 : in std_logic;
			O0 : out std_logic);
end component;

component not_1 is 
	port( I0 : in std_logic;
			O0 : out std_logic);
end component;

component xor2 is 
	port( I0 , I1 : in std_logic;
			O0 : out std_logic);
end component;

component halfadder is
	port( I0 , I1 : in std_logic;
	      O0 , O1 : out std_logic);
end component;

component fulladder is 
	port(I0 , I1 , I2 : in std_logic;
	     O0 , O1 : out std_logic);
end component;

component MUX_2X1 is 
	port( I0, I1, S : in std_logic;         
         O0 : out std_logic );     
end component;

component DEMUX_1X2 is
	port( I0, S : in std_logic;          
         O0, O1 : out std_logic ); 
end component;

component bit4adder is
	port ( A : in std_logic_vector(3 downto 0);
			 B : in std_logic_vector(3 downto 0);
			 cin : in std_logic;
			 sum : out std_logic_vector(4 downto 0));
end component;

component code_converter_1 is 
	port( A : in std_logic_vector(3 downto 0);
		   B : out std_logic_vector(3 downto 0);
			INV : out std_logic);
end component;	

component code_converter_2 is 
	port ( A : in std_logic_vector(3 downto 0);
			 B : out std_logic_vector(3 downto 0));
end component;

component ClockDivider is
port ( CLK_IN : in std_logic;                                                         
       RSTN : in std_logic; 
       CLK_OUT : out std_logic);
end component;

component D_FF is 
   port( d : in std_logic;                                     
         c : in std_logic;                                   
         CLRN : in std_logic;                                   
         PREN : in std_logic;                                 
         Q : buffer std_logic;                                  
         QN : out std_logic);                                   
end component;

component SSD is 
   port(X : in std_logic_vector(3 downto 0); 
        Y : out std_logic_vector(6 downto 0); 
        F : out std_logic);
end component;


end package;
