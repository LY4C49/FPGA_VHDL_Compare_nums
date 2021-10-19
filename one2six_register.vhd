library ieee;
use ieee.std_logic_1164.all;

entity reme is
port(input:in std_logic_vector(7 downto 0);
     o1,o2,o3,o4,o5,o6:out std_logic_vector(7 downto 0);
     en:in std_logic;
     clk:in std_logic);
     end reme;
     
architecture behav of reme is
begin
process(clk,en,input)
variable i:integer range 0 to 5:=0;
begin

if(rising_edge(clk)) then
if(en='0') then
if i=0 then
o1<=input;
elsif i=1 then
o2<=input;
elsif i=2 then
o3<=input;
elsif i=3 then
o4<=input;
elsif i=4 then
o5<=input;
elsif i=5 then
o6<=input;
end if;
i:=i+1;
end if;
end if;
end process;
end behav;   
