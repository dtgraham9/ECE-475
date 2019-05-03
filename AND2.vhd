library ieee;
use ieee.std_logic_1164.all;

entity AND2 is
   port (X, Y : in std_logic;
          Z : out std_logic);
end;

architecture ANDstuff of AND2 is 
begin 
  Z<= X and Y;
end;

     