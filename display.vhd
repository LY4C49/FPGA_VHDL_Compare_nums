LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

ENTITY add4_24 is
  PORT(clk:IN std_logic;
	   input1,input2,input3,input4,input5,input6:in std_logic_vector(3 downto 0);
	   output_24:out std_logic_vector(23 downto 0)
	   );
END add4_24;

ARCHITECTURE behav OF add4_24 IS--
begin
  output_24<="ZZZZZZZZZZZZZZZZZZZZZZZZ";
  PROCESS(clk,input1,INPUT2,INPUT3,INPUT4,INPUT5,INPUT6)
  begin
  if(rising_edge(clk))then
   output_24<=input1&input2&input3&input4&input5&input6;
   end if;
  END PROCESS;
 END behav;
