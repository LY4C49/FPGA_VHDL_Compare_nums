library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity select_2 is
port(m1,m2,m3,n1,n2,n3:in integer range 0 to 9;
     sel:in std_logic;
     mo0,mo1,mo2,mo3:out integer range 0 to 9);
     end select_2;
     
architecture behav of select_2 is
begin
process(sel)
begin
if(sel='1') then
mo0<=1;
mo1<=m1;
mo2<=m2;
mo3<=m3;

else
mo0<=0;
mo1<=n1;
mo2<=n2;
mo3<=n3;
end if;

end process;
end behav;
