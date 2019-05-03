library ieee;
use ieee.std_logic_1164.all;

entity NAND2 is
   port (X, Y : in std_logic;
          Z : out std_logic);
end;

architecture NANDstuff of NAND2 is 
begin 
  Z<= not(X and Y);
end;
