--input
--it is an adder
--press keys to add 100/10/1 when you get your target num,press "en" to verify
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity add1n21 is
port(one,ten,hun,en:in std_logic;
     clk1:in std_logic;
     out1:out std_logic_vector(7 downto 0));
end add1n21;

architecture behav of add1n21 is
begin

process(clk1,one,ten,hun,en)
variable tmp:integer range 0 to 255:=1;
begin
if(rising_edge(clk1)) then
if(one='0') then   
        tmp:=tmp+1;
        end if;
              
if(ten='0') then   
        tmp:=tmp+10;
        end if;

if(hun='0') then  
        tmp:=tmp+100;
        end if;

if(en='0') then
        tmp:=255;
        end if;

out1<=conv_std_logic_vector(tmp,8);
end if;

end process;
end behav;
