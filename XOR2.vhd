library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
  port ( X, y : in std_logic;
    Z : out std_logic);
end;

architecture Xored of xor2 is 
begin
  Z<=X xor Y;
end;