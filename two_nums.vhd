library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparison2_2 is
Port (a,b: in std_logic_vector(7downto 0);
     clk: in std_logic; 
     y,min: out std_logic_vector(7downto 0)
 );
end comparison2_2;

architecture Behav of comparison2_2 is

begin
process(clk)
begin
  if(rising_edge(clk)) then
  if (a>b) then 
 min<=b;y<=a;
else
 min<=a;y<=b;
 end if;
 end if;
 end process;

end Behav;
