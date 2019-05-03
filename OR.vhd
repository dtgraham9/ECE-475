library ieee;
use ieee.std_logic_1164.all;

entity OR2 is
  port(X,Y : in std_logic;
      Z : out std_logic);
end;

architecture ORing of OR2 is
begin
  Z <= X or Y;
end;
