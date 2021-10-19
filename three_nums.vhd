library ieee;
use ieee.std_logic_1164.all;

entity comparison3_3 is
port(ina,inb,inc:in std_logic_vector(7 downto 0);
     min,q1,q2:out std_logic_vector(7 downto 0);
     clk:in std_logic);
     end comparison3_3;

architecture behav of comparison3_3 is
    begin
    process(clk)
    begin
    if (rising_edge(clk)) then
        if ina<inb then
            if ina<inc then
            min<=ina;
            q1<=inb;
            q2<=inc;
         else
            min<=inc;
            q1<=ina;
            q2<=inb;
            end if;
         else
         if inb<inc then
            min<=inb;
            q1<=ina;
            q2<=inc;
         else
            min<=inc;
            q1<=ina;
            q2<=inb;
            end if;
        end if;
    end if;
    end process;
    end behav;
