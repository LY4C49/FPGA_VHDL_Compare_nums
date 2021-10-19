LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;

ENTITY Vhdl1 IS
PORT(clk,rst_n,en:in std_logic; idis_data:std_logic_vector(23 downto  0); ds_stcp,ds_shcp,ds_data:out std_logic
);
end Vhdl1;

architecture behav of Vhdl1 is
CONSTANT SEG_NUM0:std_logic_vector(7 downto 0):= "11000000";
CONSTANT SEG_NUM1:std_logic_vector(7 downto 0):= "11111001";
CONSTANT SEG_NUM2:std_logic_vector(7 downto 0):= "10100100";
CONSTANT SEG_NUM3:std_logic_vector(7 downto 0):= "10110000";
CONSTANT SEG_NUM4:std_logic_vector(7 downto 0):= "10011001";
CONSTANT SEG_NUM5:std_logic_vector(7 downto 0):= "10010010";
CONSTANT SEG_NUM6:std_logic_vector(7 downto 0):= "10000010";
 
CONSTANT SEG_NUM7:std_logic_vector(7 downto 0):="11111000"; CONSTANT SEG_NUM8:std_logic_vector(7 downto 0):= "10000000";
CONSTANT SEG_NUM9:std_logic_vector(7 downto 0):= "10010000";
CONSTANT SEG_NUMA:std_logic_vector(7 downto 0):= "10001000"; CONSTANT SEG_NUMB:std_logic_vector(7 downto 0):="10000011"; CONSTANT SEG_NUMC:std_logic_vector(7 downto 0):= "11000110";
CONSTANT SEG_NUMD:std_logic_vector(7 downto 0):= "10100001";
CONSTANT SEG_NUME:std_logic_vector(7 downto 0):= "10000110";
CONSTANT SEG_NUMF:std_logic_vector(7 downto 0):= "10001110";
CONSTANT SEG_WE0:std_logic_vector(7 downto 0):= "11111110";
CONSTANT SEG_WE1:std_logic_vector(7 downto 0):= "11111101";
CONSTANT SEG_WE2:std_logic_vector(7 downto 0):= "11111011";
CONSTANT SEG_WE3:std_logic_vector(7 downto 0):= "11110111";
CONSTANT SEG_WE4:std_logic_vector(7 downto 0):= "11101111";
CONSTANT SEG_WE5:std_logic_vector(7 downto 0):= "11011111";




signal clk_div_2,clk1:std_logic;
signal seg_num:std_logic_vector(3 downto 0);
signal seg_duan,seg_wei:std_logic_vector(7 downto 0); 
signal cnt_4:std_logic_vector(8 downto 0);
signal ds_stcpr,ds_shcpr,ds_datar:std_logic;
begin process(en,clk,clk1)
begin
if en='1' then clk1<=clk;
else clk1<=clk1; end if;
end process; process(clk1,rst_n)
begin
if (clk1'event and clk1='1') then if (rst_n='0') then clk_div_2<='1';
else
clk_div_2<=not clk_div_2; end if;
end if; end process;

process(clk_div_2,rst_n) begin
if clk_div_2'event and clk_div_2='1' then if rst_n='0' then
 
cnt_4<="000000000";
else cnt_4<=cnt_4+'1'; end if;
end if; end process;

process(clk_div_2,rst_n,idis_data,cnt_4) begin
if clk_div_2'event and clk_div_2='1' then if rst_n='0' then
seg_num<="0000"; else
case cnt_4(8 downto 6) is
when "000"=>seg_num<=idis_data(3 downto 0); when "001"=>seg_num<=idis_data(7 downto 4); when "010"=>seg_num<=idis_data(11 downto 8); when "011"=>seg_num<=idis_data(15 downto 12); 
when "100"=>seg_num<=idis_data(19 downto 16);
when "101"=>seg_num<=idis_data(23 downto 20);
when others=>seg_num<="0000";
end case;
end if; end if;
end process;

process(clk_div_2,rst_n) begin
if clk_div_2'event and clk_div_2='1' then if rst_n='0' then
seg_duan<="11111111"; else
case seg_num is
when "0000"=>seg_duan<=SEG_NUM0; when "0001"=>seg_duan<=SEG_NUM1; when "0010"=>seg_duan<=SEG_NUM2; when "0011"=>seg_duan<=SEG_NUM3; when "0100"=>seg_duan<=SEG_NUM4; when "0101"=>seg_duan<=SEG_NUM5; when "0110"=>seg_duan<=SEG_NUM6; when "0111"=>seg_duan<=SEG_NUM7; when "1000"=>seg_duan<=SEG_NUM8; when "1001"=>seg_duan<=SEG_NUM9; when "1010"=>seg_duan<=SEG_NUMA; when "1011"=>seg_duan<=SEG_NUMB; when "1100"=>seg_duan<=SEG_NUMC; when "1101"=>seg_duan<=SEG_NUMD; when "1110"=>seg_duan<=SEG_NUME;
 
when "1111"=>seg_duan<=SEG_NUMF; end case;
end if; end if;
end process;

process(cnt_4(8 downto 6)) begin
case cnt_4(8 downto 6) is when "000"=>seg_wei<=SEG_WE0; when "001"=>seg_wei<=SEG_WE1; when "010"=>seg_wei<=SEG_WE2; when "011"=>seg_wei<=SEG_WE3;
when"100"=>seg_wei<=SEG_WE4;
when "101"=>seg_wei<=SEG_WE5;
when others=>seg_wei<="00000000"; end case;
end process;

process(clk_div_2,rst_n,cnt_4,ds_shcpr) begin
if clk_div_2'event and clk_div_2='1' then if rst_n='0' then
ds_shcpr<='0';
else if (cnt_4>"000000010" and cnt_4<="000100010") or (cnt_4>"000100100" and cnt_4<="001000100") or (cnt_4>"001000110" and cnt_4<="001100110") or (cnt_4>"001101000" and cnt_4<="010001000") or (cnt_4>"010010000" and cnt_4<="010110000") or (cnt_4>"010110010" and cnt_4<="011010010") or (cnt_4>"011010100" and cnt_4<="011110100")
	or (cnt_4>"011110110" and cnt_4<="100010110")
	or (cnt_4>"100011000" and cnt_4<="100111000")
	or (cnt_4>"100111010" and cnt_4<="101011010")
	or (cnt_4>"101011100" and cnt_4<="101111100")
	then ds_shcpr<=not ds_shcpr;
else	ds_shcpr<='0'; end if;
end if; end if;
end process;

process(clk_div_2,rst_n) begin
if clk_div_2'event and clk_div_2='1' then if rst_n='0' then
ds_datar<='0'; else case cnt_4 is when
"000000010"|"001000110"|"010010000"|"011010100"|"100011000"|"101011100"=>ds_datar<=seg_duan(7);
 
when "000000100"|"001001000"|"010010010"|"011010110"|"100011010"|"101011110"=>ds_datar<=seg_duan(6);
when "000000110"|"001001010"|"010010100"|"011011000"|"100011100"|"101100000"=>ds_datar<=seg_duan(5);
when "000001000"|"001001100"|"010010110"|"011011010"|"100011110"|"101100010"=>ds_datar<=seg_duan(4);
when "000001010"|"001001110"|"010011000"|"011011100"|"100100000"|"101100100"=>ds_datar<=seg_duan(3);
when "000001100"|"001010000"|"010011010"|"011011110"|"100100010"|"101100110"=>ds_datar<=seg_duan(2);
when "000001110"|"001010010"|"010011100"|"011100000"|"100100100"|"101101000"=>ds_datar<=seg_duan(1);
when "000010000"|"001010100"|"010011110"|"011100010"|"100100110"|"101101010"=>ds_datar<=seg_duan(0);
when "000010010"|"001010110"|"010100000"|"011100100"|"100101000"|"101101100"=>ds_datar<=seg_wei(0);
when "000010100"|"001011000"|"010100010"|"011100110"|"100101010"|"101101110"=>ds_datar<=seg_wei(1);
when "000010110"|"001011010"|"010100100"|"011101000"|"100101100"|"101110000"=>ds_datar<=seg_wei(2);
when "000011000"|"001011100"|"010100110"|"011101010"|"100101110"|"101110010"=>ds_datar<=seg_wei(3);
when "000011010"|"001011110"|"010101000"|"011101100"|"100110000"|"101110100"=>ds_datar<=seg_wei(4);
when "000011100"|"001100000"|"010101010"|"011101110"|"100110010"|"101110110"=>ds_datar<=seg_wei(5);
when "000011110"|"001100010"|"010101100"|"011110000"|"100110100"|"101111000"=>ds_datar<=seg_wei(6);
when "000100000"|"001100100"|"010101110"|"011110010"|"100110110"|"101111010"=>ds_datar<=seg_wei(7);
when "000100100"|"001101000"|"010110010"|"011110110"|"100111010"=>ds_datar<='1';
when "000100110"|"001101010"|"010110100"|"011111000"|"100111100"=>ds_datar<='1';
when "000101000"|"001101100"|"010110110"|"011111010"|"100111110"=>ds_datar<='1';
when "000101010"|"001101110"|"010111000"|"011111100"|"101000000"=>ds_datar<='1';
when "000101100"|"001110000"|"010111010"|"011111110"|"101000010"=>ds_datar<='1';
when "000101110"|"001110010"|"010111100"|"100000000"|"101000100"=>ds_datar<='1';
when "000110000"|"001110100"|"010111110"|"100000010"|"101000110"=>ds_datar<='1';
 
when "000110010"|"001110110"|"011000000"|"100000100"|"101001000"=>ds_datar<='1';
when "000110100"|"001111000"|"011000010"|"100000110"|"101001010"=>ds_datar<='1';
when "000110110"|"001111010"|"011000100"|"100001000"|"101001100"=>ds_datar<='1';
when "000111000"|"001111100"|"011000110"|"100001010"|"101001110"=>ds_datar<='1';
when "000111010"|"001111110"|"011001000"|"100001100"|"101010000"=>ds_datar<='1';
when "000111100"|"010000000"|"011001010"|"100001110"|"101010010"=>ds_datar<='1';
when "000111110"|"010000010"|"011001100"|"100010000"|"101010100"=>ds_datar<='1';
when "001000000"|"010000100"|"011001110"|"100010010"|"101010110"=>ds_datar<='1';
when "001000010"|"010000110"|"011010000"|"100010100"|"101011000"=>ds_datar<='1';
when others=>ds_datar<=seg_duan(0); end case;
end if; end if;
end process;

process(clk1,rst_n) begin
if clk1'event and clk1='1' then if rst_n='0' then
ds_stcpr<='0';
else	if
(cnt_4="000000001")or(cnt_4="000100011")or(cnt_4="001000101")or

(cnt_4="001100111")or(cnt_4="010001001")or(cnt_4="010110001")or
(cnt_4="011010011") or(cnt_4="100010111") or(cnt_4="100111001") or(cnt_4="101011011") or(cnt_4="101111101")then	ds_stcpr<='0'; else
if (cnt_4="000100010")or(cnt_4="001000100")or(cnt_4="001100110")or(cnt_4="010001000")or(cnt_4="010110000")or(cnt_4="011010010")or(cnt_4="011110100") or(cnt_4="100010110") or(cnt_4="100111000") or(cnt_4="101011010") or(cnt_4="101111100")
then
ds_stcpr<='1'; end if;
end if; end if;
end if;
 
end process;

ds_stcp<=ds_stcpr; ds_shcp<=ds_shcpr; ds_data<=ds_datar;

end behav;
