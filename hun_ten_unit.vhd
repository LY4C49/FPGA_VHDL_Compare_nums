--input 8bit binary number
--get its hundreds, tens, units digits
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity mod_1 is
  Port ( ci: IN std_logic_vector(7 downto 0);
         clk:in std_logic;
         coa,cob,coc: OUT integer range 0 to 9);
end mod_1;

architecture behav of mod_1 is
begin
    process(clk)
    variable tmp1: integer range 0 to 9;
    variable tmp2: integer range 0 to 99;
    variable sel: integer range 0 to 255; 
    begin
    sel:= conv_integer(ci);
    tmp1:= sel mod (100);
    tmp2:= sel rem (100);
    coa<= tmp1;
    tmp1:= tmp2 mod (10);
    cob<= tmp1;
    tmp1:= sel rem (10);
    coc<= tmp1;
    end process;
end behav;
