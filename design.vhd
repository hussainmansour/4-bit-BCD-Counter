--design
library ieee;
use ieee.std_logic_1164.all;

entity T_FF is
port(
T: in std_logic;
clk: in std_logic;
Q: out std_logic);
end T_FF;
 
architecture tarch of T_FF is
signal tmp: std_logic :='0' ;
begin
process (clk)
begin
if (clk'event and clk='1' ) then
    if T='0' then
    tmp <= tmp;
    elsif T='1' then
    tmp <= not (tmp);
    end if;
end if;
end process;
Q <= tmp;
end tarch;


library ieee;
use ieee.std_logic_1164.all;

--entity
entity even is 
port(
  x: in std_logic;
  clk: in std_logic;
  z : out std_logic_vector(3 downto 0));
end even;

--arch
architecture evenarch of even is 
component T_FF
port(
  T: in std_logic;
  clk: in std_logic;
  Q: out std_logic);
end component;


begin 


u1: T_FF port map(T=>(not x and z(3) and z(0))or(x and not z(2) and not z(1) and not z(0))or(not x and z(2) and z(1) and z(0)),clk=>clk,Q=>z(3));
u2: T_FF port map(T=>(not x and z(1) and z(0))or(x and z(2) and not z(1) and not z(0))or(x and z(3) and not z(0)),clk=>clk,Q=>z(2));
u3: T_FF port map(T=>(not x and not z(3) and z(0))or(x and z(1) and not z(0))or(x and z(2) and not z(1) and not z(0))or(x and z(3) and not z(1) and not z(0)),clk=>clk,Q=>z(1));
u4: T_FF port map(T=>'1',clk=>clk,Q=>z(0));

end evenarch;