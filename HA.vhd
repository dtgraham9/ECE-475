library ieee;
use ieee.std_logic_1164.all;

entity HA is
  port( X, Y : in std_logic;
        S, Cout : out std_logic);
      end;
      
architecture simpleHA of HA is 
component AND2
  port (x, y : in std_logic;
    Z : out std_logic);
  end component;
  
component XOR2
  port (x, y : in std_logic;
      Z : out std_logic);
  end component;

begin 
  Sum : XOR2 port map(x, y, s);
  carry : AND2 port map(x, y, cout);
end;
