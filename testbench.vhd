--testbench

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity T_FF_tb is
--is empty
end T_FF_tb;

architecture bench of T_FF_tb is
  component even
  port(
  x: in std_logic;
  clk: in std_logic;
  z : out std_logic_vector(3 downto 0));
  end component;
  
  
  signal x: std_logic;
  signal clk: std_logic;
  signal z: std_logic_vector(3 downto 0);
  type dataout is array (10 downto 0,6 downto 0) of std_logic;
  signal a : dataout := ("0110111", "0011010", "1010101",                     "0101011","1111111","1100011","1110011","1101111","0000000","0000001","1000000");
  constant clock_period: time := 2 ns;
  signal stop_the_clock: boolean;
begin
  DUT: even port map (x,clk,z);
  process
  begin
  
   
--     --for i in l1'left downto l1'right + 1 loop
     for i in 5 downto 0 loop
       for j in 6 downto 0 loop
          x<=a(i,j);
          wait for 2 ns;
          end loop;
        end loop;

--         x<='0';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;
--         x<='1';
--           wait for 2 ns;  
    stop_the_clock <= true;
    wait;
  end process;
  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;
end;